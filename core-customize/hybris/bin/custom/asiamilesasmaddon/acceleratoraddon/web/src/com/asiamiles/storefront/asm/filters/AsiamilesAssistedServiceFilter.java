/*
 * [y] hybris Platform
 *
 * Copyright (c) 2018 SAP SE or an SAP affiliate company. All rights reserved.
 *
 * This software is the confidential and proprietary information of SAP
 * ("Confidential Information"). You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the
 * license agreement you entered into with SAP.
 */
package com.asiamiles.storefront.asm.filters;

import de.hybris.platform.assistedservicefacades.constants.AssistedservicefacadesConstants;
import de.hybris.platform.assistedservicefacades.util.AssistedServiceUtils;
import de.hybris.platform.assistedserviceservices.exception.AssistedServiceException;
import de.hybris.platform.assistedserviceservices.utils.AssistedServiceSession;
import de.hybris.platform.assistedservicestorefront.constants.AssistedservicestorefrontConstants;
import de.hybris.platform.assistedservicestorefront.restrictions.AssistedServicePathRestrictionEvaluator;
import de.hybris.platform.core.model.user.UserGroupModel;
import de.hybris.platform.core.model.user.UserModel;
import de.hybris.platform.jalo.JaloSession;
import de.hybris.platform.jalo.user.CookieBasedLoginToken;
import de.hybris.platform.jalo.user.LoginToken;
import de.hybris.platform.servicelayer.config.ConfigurationService;
import de.hybris.platform.servicelayer.i18n.CommonI18NService;
import de.hybris.platform.servicelayer.user.UserService;
import de.hybris.platform.util.Config;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.jwt.Jwt;
import org.springframework.security.jwt.JwtHelper;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.WebUtils;

import com.asiamiles.core.constants.AsiamilesCoreConstants;
import com.asiamiles.core.service.AMLSessionService;
import com.asiamiles.core.service.IdpUserService;
import com.asiamiles.facades.asm.AsiamilesAssistedServiceFacade;
import com.asiamiles.storefront.asm.security.AssistedServiceAgentAuthoritiesManager;
import com.asiamiles.storefront.asm.security.impl.AssistedServiceAgentLoginStrategy;
import com.asiamiles.storefront.asm.security.impl.AssistedServiceAgentLogoutStrategy;
import com.asiamiles.storefront.asm.security.impl.AssistedServiceAuthenticationToken;
import com.asiamiles.thirdparty.idp.IdpClient;
import com.asiamiles.thirdparty.idp.bean.IdpToken;
import com.asiamiles.thirdparty.util.UrlUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Assisted Service filter. Used for applying restrictions to storefront paths
 * for AS agent and login agent based on request.
 */
public class AsiamilesAssistedServiceFilter extends OncePerRequestFilter {
	private static final Logger LOG = LoggerFactory.getLogger(AsiamilesAssistedServiceFilter.class);

	private AssistedServicePathRestrictionEvaluator assistedServicePathRestrictionEvaluator;
	private AsiamilesAssistedServiceFacade assistedServiceFacade;
	private AssistedServiceAgentLoginStrategy assistedServiceAgentLoginStrategy;
	private CommonI18NService commonI18NService;
	private ConfigurationService configurationService;
	private AMLSessionService sessionService;
	private IdpClient idpClient;
	private AssistedServiceAgentLogoutStrategy assistedServiceAgentLogoutStrategy;
	private UserService userService;
	private AssistedServiceAgentAuthoritiesManager assistedServiceAgentAuthoritiesManager;
	private IdpUserService idpUserService;

	@Override
	protected void doFilterInternal(final HttpServletRequest httpservletrequest,
			final HttpServletResponse httpservletresponse, final FilterChain filterchain)
					throws ServletException, IOException {

		if ("/assisted-service/logoutasm".equalsIgnoreCase(httpservletrequest.getServletPath()))
		{
			AssistedServiceUtils.eraseSamlCookie(httpservletresponse);
			getSessionService().removeAttribute(AsiamilesCoreConstants.SESSION_KEY_ASM_TOKEN);
			getSessionService().removeAttribute(AssistedservicefacadesConstants.ASM_SESSION_PARAMETER);

			//
			final Cookie cookie = WebUtils.getCookie(httpservletrequest, "ASMcollapseBtn");
			if (cookie != null)
			{
				cookie.setValue(null);
				cookie.setMaxAge(0);// delete cookie at once
				cookie.setPath("/");
				httpservletresponse.addCookie(cookie);
			}
			httpservletresponse.getOutputStream().print("success");
			//doFilter(httpservletrequest, httpservletresponse);
			return;
		}

		// asm login 1.get accesstoken ;2. create or update user
		if ("/asm-auto-login".equalsIgnoreCase(httpservletrequest.getServletPath())) {
			final String code = httpservletrequest.getParameter("code");
			LOG.info("service=[{}],action=[{}],authCode=[{}],description=[{}]", "AsiamilesAssistedServiceFilter", "asm-auto-login",
					code, "start ASM_access_token with authCode");

			final IdpToken token = this.idpClient.retrieveASMToken(code);

			if (null == token) {
				httpservletresponse.sendRedirect(Config.getParameter("idp.error.page.url"));
				filterchain.doFilter(httpservletrequest, httpservletresponse);
				return;
			}

			final String accessToken = token.getAccessToken();
			final Jwt tokenDecoded = JwtHelper.decode(accessToken);
			LOG.info("service=[{}],action=[{}],tokenDecoded=[{}],description=[{}]", "AsiamilesAssistedServiceFilter",
					"getAccessToken", tokenDecoded, "decoded ASM_access_token");
			final Map<String, String> authInfo = new ObjectMapper().readValue(tokenDecoded.getClaims(), Map.class);

			final String userId = authInfo.get("sub");
			final String accessRight = authInfo.get("access_right");
			final String partnerCode = authInfo.get("partner_code");

			try
			{
				if (!this.idpUserService.isAsmUserGroupExist(accessRight)
						|| !this.idpUserService.isVendorExist(partnerCode)) {
					LOG.error("service=[{}],action=[{}],loginStatus=[{}],description=[{}]", "AsiamilesAssistedServiceFilter",
							"checkAsmUserGroupExist", "failed", "ASM_login error, usergroup is not exist or parnterCode is not exist.");
					httpservletresponse.sendRedirect(Config.getParameter("idp.error.page.url"));
					filterchain.doFilter(httpservletrequest, httpservletresponse);
					return;
				}

				UserModel user = this.idpUserService.getSsoUser(userId);
				if (user == null) {
					// create user info
					user = this.idpUserService.createNewUser(userId, partnerCode, accessRight);
				} else {
					// set user group and vendor info to user model
					user = this.idpUserService.updateUser(user, partnerCode, accessRight);
				}
				httpservletresponse.addHeader("Set-Cookie", createProfileTrackingPauseCookie());
				getAssistedServiceFacade().launchAssistedServiceMode();

				getAssistedServiceFacade().loginAssistedServiceAgentIDP(authInfo.get("sub"),
						authInfo.get("access_right"),
						authInfo.get("partner_code"));
				this.assistedServiceAgentLoginStrategy.login(authInfo.get("sub"), httpservletrequest,
						httpservletresponse);
				this.getAssistedServiceFacade().emulateAfterLogin();
				refreshSpringSecurityToken();
				setSessionTimeout();
				this.getSessionService().setAttribute(AsiamilesCoreConstants.SESSION_KEY_ASM_TOKEN,token);
			}
			catch (final AssistedServiceException e)
			{
				getAssistedServiceFacade().getAsmSession().setFlashErrorMessage(e.getMessageCode());
				final String errorMessage = String.format("service=[%s],action=[%s],loginStatus=[%s],error message =[%s]",
						"AsiamilesAssistedServiceFilter", "loginAssistedServiceAgent", "failed", e.getMessage());
				LOG.debug(errorMessage, e);
			} catch (final Exception e) {
				// getAssistedServiceFacade().getAsmSession().setFlashErrorMessage(e.getMessage());
				final String errorMessage = String.format("service=[%s],action=[%s],loginStatus=[%s],error message =[%s]",
						"AsiamilesAssistedServiceFilter", "loginAssistedServiceAgent", "failed", e.getMessage());
				LOG.debug(errorMessage, e);
			}
			LOG.info("service=[{}],action=[{}],accessToken=[{}],description=[{}]", "AsiamilesAssistedServiceFilter",
					"getAccessToken", token.getAccessToken(), "print ASM_access_token");
			httpservletresponse.sendRedirect(httpservletrequest.getParameter("targetURL"));
			filterchain.doFilter(httpservletrequest, httpservletresponse);
			return;
		}

		final String asmRequestParam = httpservletrequest
				.getParameter(AssistedservicestorefrontConstants.ASM_REQUEST_PARAM);

		if (Boolean.TRUE.toString().equals(asmRequestParam)) {
			if (checkIdpPreloginCookie(httpservletrequest, httpservletresponse)) {
				return;
			}
		}

		if (getAssistedServicePathRestrictionEvaluator().evaluate(httpservletrequest, httpservletresponse)) {
			filterchain.doFilter(httpservletrequest, httpservletresponse);
		}

	}

	/**
	 * This method should be called after any facade method where user substitution
	 * may occur
	 */
	protected void refreshSpringSecurityToken() {
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof AssistedServiceAuthenticationToken) {
			final UserModel currentUser = this.userService.getCurrentUser();
			if (currentUser == null || this.userService.isAnonymousUser(currentUser) || isASAgent(currentUser)) {
				((AssistedServiceAuthenticationToken) authentication).setEmulating(false);
			} else {
				((AssistedServiceAuthenticationToken) authentication).setEmulating(true);
				this.assistedServiceAgentAuthoritiesManager.addCustomerAuthoritiesToAgent(currentUser.getUid());
			}
		}
	}

	protected void setSessionTimeout() {
		JaloSession.getCurrentSession().setTimeout(this.assistedServiceFacade.getAssistedServiceSessionTimeout());
		// since agent is logged in - change session timeout to the value from
		// properties
		((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession()
		.setMaxInactiveInterval(this.assistedServiceFacade.getAssistedServiceSessionTimeout()); // in seconds
	}

	protected boolean isASAgent(final UserModel currentUser) {
		final Set<UserGroupModel> userGroups = this.userService.getAllUserGroupsForUser(currentUser);
		for (final UserGroupModel userGroup : userGroups) {
			if (AssistedservicestorefrontConstants.AS_AGENT_GROUP_UID.equals(userGroup.getUid())) {
				return true;
			}
		}
		return false;
	}


	private boolean checkIdpPreloginCookie(final HttpServletRequest httpRequest, final HttpServletResponse httpResponse)
			throws IOException {

		if (httpRequest.getRequestURL().indexOf("asm-auto-login") > 0
				|| httpRequest.getRequestURL().indexOf("logoutasm") > 0) {
			return false;
		}

		final AssistedServiceSession assistedServiceSession = getSessionService()
				.getAttribute(AssistedservicefacadesConstants.ASM_SESSION_PARAMETER);

		if (assistedServiceSession != null && assistedServiceSession.getAgentPk() != null
				&& this.getSessionService().getAttribute(AsiamilesCoreConstants.SESSION_KEY_ASM_TOKEN) != null) {
			return false;
		}

		final Cookie cookie = WebUtils.getCookie(httpRequest, AsiamilesCoreConstants.IDP_PRELOGIN_COOKIE);
		if (cookie != null && cookie.getValue().equals("1")) {
			httpResponse.sendRedirect(getValidateSessionUrl(httpRequest));
		} else {
			httpResponse.sendRedirect(getAuthorize(httpRequest));
		}
		return true;
	}

	private String getAuthorize(final HttpServletRequest httpRequest) {

		final StringBuilder builder = new StringBuilder();
		builder.append(
				this.configurationService.getConfiguration().getString(AsiamilesCoreConstants.IDP_AUTH_URL));
		builder.append("?response_type=").append(this.configurationService.getConfiguration()
				.getString(AsiamilesCoreConstants.IDP_COMMON_RESPONSE_TYPE, "code"));
		builder.append("&client_id=")
		.append(this.configurationService.getConfiguration().getString(AsiamilesCoreConstants.IDP_ASM_CLIENT_ID));
		builder.append("&scope=").append(UrlUtil.getURLEncoderString(this.configurationService.getConfiguration()
				.getString(AsiamilesCoreConstants.IDP_TOKEN_SCOPE, "openid offline_access")));
		builder.append("&redirect_uri=").append(UrlUtil.getURLEncoderString(
				this.configurationService.getConfiguration().getString(AsiamilesCoreConstants.IDP_ASM_REDIRECT_URL)));
		builder.append("&login_url=")
		.append(this.configurationService.getConfiguration().getString(AsiamilesCoreConstants.BASE_SITE_URL))
		.append(UrlUtil.getURLEncoderString("?asm=true"));
		builder.append("&target_url=")
		.append(this.configurationService.getConfiguration().getString(AsiamilesCoreConstants.BASE_SITE_URL))
		.append(UrlUtil.getURLEncoderString("?asm=true"));
		LOG.info("service=[{}],action=[{}],request=[{}],description=[{}]", "AsiamilesAssistedServiceFilter", "getAuthorizeForIDP",
				builder.toString());
		return builder.toString();

	}

	private String getValidateSessionUrl(final HttpServletRequest httpRequest) {
		String targetUrl = httpRequest.getParameter("targetUrl");
		if (StringUtils.isEmpty(targetUrl)) {
			targetUrl = httpRequest.getRequestURL().toString();
		}
		//this.commonI18NService.getCurrentLanguage();
		final StringBuilder builder = new StringBuilder();
		builder.append(
				this.configurationService.getConfiguration()
				.getString(AsiamilesCoreConstants.IDP_VALIDATE_SESSION_URL));
		builder.append("?response_type=").append(this.configurationService.getConfiguration()
				.getString(AsiamilesCoreConstants.IDP_COMMON_RESPONSE_TYPE, "code"));
		builder.append("&client_id=")
		.append(this.configurationService.getConfiguration().getString(AsiamilesCoreConstants.IDP_ASM_CLIENT_ID));
		builder.append("&scope=").append(UrlUtil.getURLEncoderString(this.configurationService.getConfiguration()
				.getString(AsiamilesCoreConstants.IDP_TOKEN_SCOPE, "openid offline_access")));
		builder.append("&redirect_uri=").append(UrlUtil.getURLEncoderString(
				this.configurationService.getConfiguration().getString(AsiamilesCoreConstants.IDP_ASM_REDIRECT_URL)));
		builder.append("&login_url=")
		.append(this.configurationService.getConfiguration().getString(AsiamilesCoreConstants.BASE_SITE_URL))
		.append(UrlUtil.getURLEncoderString("?asm=true"));
		builder.append("&target_url=").append(UrlUtil.getURLEncoderString(targetUrl));
		return builder.toString();

	}

	private void performLogin(final HttpServletRequest httpservletrequest,
			final HttpServletResponse httpservletresponse) throws AssistedServiceException {
		// in case it is a logout request then remove the saml cookie if exist and
		// proceed with the normal logout flow
		if ("/assisted-service/logoutasm".equalsIgnoreCase(httpservletrequest.getServletPath())) {
			AssistedServiceUtils.eraseSamlCookie(httpservletresponse);
			//
			final Cookie cookie = WebUtils.getCookie(httpservletrequest, "ASMcollapseBtn");
			cookie.setValue(null);
			cookie.setMaxAge(0);// delete cookie at once
			cookie.setPath("/");
			httpservletresponse.addCookie(cookie);
		}

		final LoginToken token = new CookieBasedLoginToken(AssistedServiceUtils.getSamlCookie(httpservletrequest));

		// terminate in case token doesn't belong to currently logged in agent
		if (getAssistedServiceFacade().isAssistedServiceAgentLoggedIn()
				&& getAssistedServiceFacade().getAsmSession().getAgent().getUid().equals(token.getUser().getUid())) {
			return;
		}
		if (getAssistedServiceFacade().isAssistedServiceAgentLoggedIn()) {
			getAssistedServiceFacade().logoutAssistedServiceAgent();
		}
		getAssistedServiceFacade().loginAssistedServiceAgentSAML(token.getUser().getUid(), token.getPassword());
		getAssistedServiceAgentLoginStrategy().login(token.getUser().getUid(), httpservletrequest, httpservletresponse);
		getAssistedServiceFacade().emulateAfterLogin();
	}

	protected String createProfileTrackingPauseCookie() {
		final String cookieName = Config.getString(AssistedservicestorefrontConstants.PROFILE_COOKIE_NAME,
				AssistedservicestorefrontConstants.ASM_PROFILE_TRACKING_PAUSE_COOKIE);
		final StringBuilder buf = new StringBuilder(cookieName);
		buf.append("=");
		buf.append(StringUtils.EMPTY);

		final long age = AssistedservicestorefrontConstants.IMPERSISTENCE_COOKIE_INDEX;
		buf.append("; Max-Age=\"");
		buf.append(age);
		buf.append("\"");

		buf.append("; Path=\"");
		buf.append("/");
		buf.append("\"");

		buf.append("; Secure");
		buf.append("; HttpOnly");
		return buf.toString();
	}

	/**
	 * @return the assistedServicePathRestrictionEvaluator
	 */
	protected AssistedServicePathRestrictionEvaluator getAssistedServicePathRestrictionEvaluator() {
		return this.assistedServicePathRestrictionEvaluator;
	}

	/**
	 * @param assistedServicePathRestrictionEvaluator
	 *            the assistedServicePathRestrictionEvaluator to set
	 */
	@Required
	public void setAssistedServicePathRestrictionEvaluator(
			final AssistedServicePathRestrictionEvaluator assistedServicePathRestrictionEvaluator) {
		this.assistedServicePathRestrictionEvaluator = assistedServicePathRestrictionEvaluator;
	}

	/**
	 * @return the assistedServiceFacade
	 */
	protected AsiamilesAssistedServiceFacade getAssistedServiceFacade()
	{
		return this.assistedServiceFacade;
	}

	/**
	 * @param assistedServiceFacade
	 *            the assistedServiceFacade to set
	 */
	@Required
	public void setAssistedServiceFacade(final AsiamilesAssistedServiceFacade assistedServiceFacade)
	{
		this.assistedServiceFacade = assistedServiceFacade;
	}

	/**
	 * @return the assistedServiceAgentLoginStrategy
	 */
	protected AssistedServiceAgentLoginStrategy getAssistedServiceAgentLoginStrategy() {
		return this.assistedServiceAgentLoginStrategy;
	}

	/**
	 * @param assistedServiceAgentLoginStrategy
	 *            the assistedServiceAgentLoginStrategy to set
	 */
	@Required
	public void setAssistedServiceAgentLoginStrategy(
			final AssistedServiceAgentLoginStrategy assistedServiceAgentLoginStrategy) {
		this.assistedServiceAgentLoginStrategy = assistedServiceAgentLoginStrategy;
	}

	public CommonI18NService getCommonI18NService() {
		return this.commonI18NService;
	}

	public void setCommonI18NService(final CommonI18NService commonI18NService) {
		this.commonI18NService = commonI18NService;
	}

	public ConfigurationService getConfigurationService() {
		return this.configurationService;
	}

	public void setConfigurationService(final ConfigurationService configurationService) {
		this.configurationService = configurationService;
	}

	public AMLSessionService getSessionService() {
		return this.sessionService;
	}

	public void setSessionService(final AMLSessionService sessionService) {
		this.sessionService = sessionService;
	}

	public IdpClient getIdpClient() {
		return this.idpClient;
	}

	public void setIdpClient(final IdpClient idpClient)
	{
		this.idpClient = idpClient;
	}


	public AssistedServiceAgentLogoutStrategy getAssistedServiceAgentLogoutStrategy() {
		return this.assistedServiceAgentLogoutStrategy;
	}

	public void setAssistedServiceAgentLogoutStrategy(
			final AssistedServiceAgentLogoutStrategy assistedServiceAgentLogoutStrategy) {
		this.assistedServiceAgentLogoutStrategy = assistedServiceAgentLogoutStrategy;
	}

	public UserService getUserService() {
		return this.userService;
	}

	public void setUserService(final UserService userService) {
		this.userService = userService;
	}

	public AssistedServiceAgentAuthoritiesManager getAssistedServiceAgentAuthoritiesManager() {
		return this.assistedServiceAgentAuthoritiesManager;
	}

	public void setAssistedServiceAgentAuthoritiesManager(
			final AssistedServiceAgentAuthoritiesManager assistedServiceAgentAuthoritiesManager) {
		this.assistedServiceAgentAuthoritiesManager = assistedServiceAgentAuthoritiesManager;
	}

	public IdpUserService getIdpUserService() {
		return this.idpUserService;
	}

	public void setIdpUserService(final IdpUserService idpUserService) {
		this.idpUserService = idpUserService;
	}

}
