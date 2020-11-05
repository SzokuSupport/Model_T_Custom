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
package com.asiamiles.storefront.asm.contorllers;

import de.hybris.platform.acceleratorstorefrontcommons.controllers.AbstractController;
import de.hybris.platform.assistedservicefacades.AssistedServiceFacade;
import de.hybris.platform.assistedservicefacades.constants.AssistedservicefacadesConstants;
import de.hybris.platform.assistedserviceservices.exception.AssistedServiceException;
import de.hybris.platform.assistedserviceservices.utils.AssistedServiceSession;
import de.hybris.platform.assistedservicestorefront.constants.AssistedservicestorefrontConstants;
import de.hybris.platform.assistedservicestorefront.redirect.AssistedServiceRedirectStrategy;
import de.hybris.platform.assistedservicestorefront.user.AutoSuggestionCustomerData;
import de.hybris.platform.commercefacades.order.data.CartData;
import de.hybris.platform.commercefacades.user.data.CustomerData;
import de.hybris.platform.core.model.order.CartModel;
import de.hybris.platform.core.model.order.payment.CreditCardPaymentInfoModel;
import de.hybris.platform.core.model.user.CustomerModel;
import de.hybris.platform.core.model.user.UserGroupModel;
import de.hybris.platform.core.model.user.UserModel;
import de.hybris.platform.jalo.JaloSession;
import de.hybris.platform.order.CartService;
import de.hybris.platform.servicelayer.user.UserService;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.asiamiles.core.constants.AsiamilesCoreConstants;
import com.asiamiles.core.customer.AsiaMilesCustomerAccountService;
import com.asiamiles.core.service.AMLSessionService;
import com.asiamiles.core.thirdparty.cls.AsiaMilesClsService;
import com.asiamiles.storefront.asm.security.AssistedServiceAgentAuthoritiesManager;
import com.asiamiles.storefront.asm.security.impl.AssistedServiceAgentLoginStrategy;
import com.asiamiles.storefront.asm.security.impl.AssistedServiceAgentLogoutStrategy;
import com.asiamiles.storefront.asm.security.impl.AssistedServiceAuthenticationToken;
import com.asiamiles.storefront.asm.util.SubscriptionFacadeReflectionWrapper;
import com.asiamiles.thirdparty.cls.bean.MemberProfile;
import com.asiamiles.thirdparty.idp.bean.IdpToken;
import com.sap.security.core.server.csi.XSSEncoder;


@Controller
@RequestMapping(value = "/assisted-service")
public class AssistedServiceComponentController extends AbstractController {
	private static final String ASSISTED_SERVICE_COMPONENT = "addon:/asiamilesasmaddon/cms/asm/assistedServiceComponent";

	private static final String ASM_MESSAGE_ATTRIBUTE = "asm_message";
	private static final String ASM_REDIRECT_URL_ATTRIBUTE = "redirect_url";
	private static final String ASM_ALERT_CLASS = "asm_alert_class";
	private static final String ENABLE_360_VIEW = "enable360View";
	private static final String CUSTOMER_ID = "customerId";
	private static final String CUSTOMER_NAME = "customerName";

	private static final Logger LOG = LoggerFactory.getLogger(AssistedServiceComponentController.class);

	@Resource(name = "assistedServiceFacade")
	private AssistedServiceFacade assistedServiceFacade;

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "cartService")
	private CartService cartService;

	@Resource(name = "assistedServiceAgentLoginStrategy")
	private AssistedServiceAgentLoginStrategy assistedServiceAgentLoginStrategy;

	@Resource(name = "assistedServiceAgentLogoutStrategy")
	private AssistedServiceAgentLogoutStrategy assistedServiceAgentLogoutStrategy;

	@Resource(name = "sessionService")
	private AMLSessionService sessionService;

	@Resource(name = "subscriptionFacadeWrapper")
	private SubscriptionFacadeReflectionWrapper subscriptionFacadeWrapper;

	@Resource(name = "assistedServiceRedirectStrategy")
	private AssistedServiceRedirectStrategy assistedServiceRedirectStrategy;

	@Resource(name = "assistedServiceAgentAuthoritiesManager")
	private AssistedServiceAgentAuthoritiesManager authoritiesManager;

	@Resource(name = "clsService")
	private AsiaMilesClsService clsService;

	@Resource(name = "customerAccountService")
	private AsiaMilesCustomerAccountService customerAccountService;

	@RequestMapping(value = "/quit", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void quitAssistedServiceMode() {
		this.assistedServiceFacade.quitAssistedServiceMode();
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginAssistedServiceAgent(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestParam("username") final String username,
			@RequestParam("password") final String password) {
		try {
			this.assistedServiceFacade.loginAssistedServiceAgent(username, password);
			this.assistedServiceAgentLoginStrategy.login(username, request, response);
			this.assistedServiceFacade.emulateAfterLogin();
			refreshSpringSecurityToken();
			setSessionTimeout();
			model.addAttribute(ASM_REDIRECT_URL_ATTRIBUTE, this.assistedServiceRedirectStrategy.getRedirectPath());
		} catch (final AssistedServiceException e) {
			model.addAttribute(ASM_MESSAGE_ATTRIBUTE, e.getMessageCode());
			model.addAttribute(ASM_ALERT_CLASS, e.getAlertClass());
			model.addAttribute("username", this.encodeValue(username));
			final String errorMessage = String.format(
					"sessionId=[%s],agentNo=[%s],service=[%s],action=[%s],userName=[%s],error message =[%s]", getSessionId(),
					getAgentNo(), "AssistedServiceComponentController", "loginAssistedServiceAgent", username, e.getMessage());
			LOG.debug(errorMessage, e);
		}
		model.addAllAttributes(this.assistedServiceFacade.getAssistedServiceSessionAttributes());
		return ASSISTED_SERVICE_COMPONENT;
	}

	@RequestMapping(value = "/logoutasm", method = RequestMethod.POST)
	public String logoutAssistedServiceAgent(final Model model, final HttpServletRequest request) {
		try {
			this.assistedServiceFacade.logoutAssistedServiceAgent();
		} catch (final AssistedServiceException e) {
			model.addAttribute(ASM_MESSAGE_ATTRIBUTE, e.getMessage());
			final String errorMessage = String.format("sessionId=[%s],agentNo=[%s],service=[%s],action=[%s],error message =[%s]",
					getSessionId(), getAgentNo(), "AssistedServiceComponentController", "logoutAssistedServiceAgent", e.getMessage());
			LOG.debug(errorMessage, e);
		}
		if (null != this.sessionService.getAttribute(AssistedservicefacadesConstants.ASM_SESSION_PARAMETER)) {
			model.addAllAttributes(this.assistedServiceFacade.getAssistedServiceSessionAttributes());
		}
		model.addAttribute("customerReload", "reload");
		this.assistedServiceAgentLogoutStrategy.logout(request);
		return ASSISTED_SERVICE_COMPONENT;
	}

	@RequestMapping(value = "/personify-customer", method = RequestMethod.POST)
	public String emulateCustomer(final Model model, @RequestParam(CUSTOMER_ID) final String customerId,
			@RequestParam(CUSTOMER_NAME) final String customerName, @RequestParam("cartId") final String cartId) {
		try {
			this.assistedServiceFacade.emulateCustomer(customerId, cartId);
			refreshSpringSecurityToken();
			final IdpToken token = this.sessionService.getAttribute(AsiamilesCoreConstants.SESSION_KEY_ASM_TOKEN);
			if (Objects.nonNull(token))
			{
				final MemberProfile profile = this.clsService.generalProfile(customerId, token);
				this.sessionService.setMemberProfile(profile);
			}

			model.addAttribute(ASM_REDIRECT_URL_ATTRIBUTE, this.assistedServiceRedirectStrategy.getRedirectPath());
		} catch (final AssistedServiceException e) {
			model.addAttribute(ASM_MESSAGE_ATTRIBUTE, e.getMessageCode());
			model.addAttribute(ASM_ALERT_CLASS, e.getAlertClass());
			model.addAttribute(CUSTOMER_ID, this.encodeValue(customerId));
			model.addAttribute("cartId", this.encodeValue(cartId));
			model.addAttribute(CUSTOMER_NAME, this.encodeValue(customerName));
			final String errorMessage = String.format(
					"sessionId=[%s],agentNo=[%s],service=[%s],action=[%s],customerName=[%s],cartId=[%s],error message =[%s]",
					getSessionId(), getAgentNo(), "AssistedServiceComponentController", "emulateCustomer", customerName, cartId,
					e.getMessage());
			LOG.debug(errorMessage, e);
		}
		model.addAllAttributes(this.assistedServiceFacade.getAssistedServiceSessionAttributes());
		return ASSISTED_SERVICE_COMPONENT;
	}

	@RequestMapping(value = "/emulate", method = RequestMethod.GET)
	public String emulateCustomerByLink(final RedirectAttributes redirectAttrs,
			@RequestParam(value = CUSTOMER_ID, required = false) final String customerId,
			@RequestParam(value = "cartId", required = false) final String cartId,
			@RequestParam(value = "orderId", required = false) final String orderId,
			@RequestParam(value = "fwd", required = false) final String fwd,
			@RequestParam(value = "enable360View", required = false) final boolean enable360View) {
		try {
			// launch AS mode in case it has not been launched yet
			if (!this.assistedServiceFacade.isAssistedServiceModeLaunched()) {
				LOG.debug("sessionId=[{}],agentNo=[{}],service=[{}],action=[{}],description=[{}]", getSessionId(), getAgentNo(),
						"AssistedServiceComponentController", "emulateCustomerByLink", "ASM launched after link-emulate request");
				this.assistedServiceFacade.launchAssistedServiceMode();
			}

			if (this.assistedServiceFacade.isAssistedServiceAgentLoggedIn()) {
				this.assistedServiceFacade.stopEmulateCustomer();
				refreshSpringSecurityToken();
				LOG.debug("sessionId=[{}],agentNo=[{}],service=[{}],action=[{}],customerId=[{}],description=[{}]", getSessionId(),
						getAgentNo(), "AssistedServiceComponentController", "emulateCustomerByLink",
						this.userService.getCurrentUser().getUid(), "Previous emulation for customer has been stopped.");
			}

			// only set the flash attribute if this value is true and will only happen in
			// case 360 view is initiated from customer list
			if (enable360View) {
				redirectAttrs.addFlashAttribute(ENABLE_360_VIEW, Boolean.valueOf(enable360View));
			}

			this.assistedServiceFacade.emulateCustomer(customerId, cartId, orderId);

			LOG.debug("sessionId=[{}],agentNo=[{}],service=[{}],action=[{}],customerId=[{}],cartId=[{}].description=[{}]",
					getSessionId(), getAgentNo(), "AssistedServiceComponentController", "emulateCustomerByLink", customerId, cartId,
					"Link-emulate request successfuly started an emulation");
			refreshSpringSecurityToken();
			return REDIRECT_PREFIX + this.assistedServiceRedirectStrategy.getRedirectPath();
		} catch (final AssistedServiceException e) {
			final String errorMessage = String.format("sessionId=[%s],agentNo=[%s],service=[%s],action=[%s],error message =[%s]",
					getSessionId(), getAgentNo(), "AssistedServiceComponentController", "emulateCustomer", e.getMessage());
			LOG.debug(errorMessage, e);
			redirectAttrs.addFlashAttribute(ASM_MESSAGE_ATTRIBUTE, e.getMessageCode());
			redirectAttrs.addFlashAttribute(ASM_ALERT_CLASS, e.getAlertClass());
			redirectAttrs.addFlashAttribute(CUSTOMER_ID, this.encodeValue(customerId));
			redirectAttrs.addFlashAttribute(CUSTOMER_NAME, this.encodeValue(customerId));
			redirectAttrs.addFlashAttribute("cartId", this.encodeValue(cartId));
			this.assistedServiceFacade.getAsmSession().setForwardUrl(fwd);
		}
		return REDIRECT_PREFIX + this.assistedServiceRedirectStrategy.getErrorRedirectPath();
	}

	@RequestMapping(value = "/create-account", method = RequestMethod.POST)
	public String createCustomer(final Model model, @RequestParam(CUSTOMER_ID) final String customerId,
			@RequestParam(CUSTOMER_NAME) final String customerName) {
		String redirectTo = ASSISTED_SERVICE_COMPONENT;
		try {
			this.assistedServiceFacade.createCustomer(customerId, customerName);
			// customerId is lower cased when user registered using customer account service
			final String customerIdLowerCased = customerId.toLowerCase();
			final CartModel sessionCart = this.cartService.getSessionCart();
			if (sessionCart != null && this.userService.isAnonymousUser(sessionCart.getUser())
					&& CollectionUtils.isNotEmpty(sessionCart.getEntries())) {
				// if there's already an anonymous cart with entries - bind it to customer
				bindCart(customerIdLowerCased, null, model);
				redirectTo = emulateCustomer(model, customerIdLowerCased, null,
						this.cartService.getSessionCart().getCode());
			} else {
				redirectTo = emulateCustomer(model, customerIdLowerCased, null, null);
			}
			this.subscriptionFacadeWrapper.updateProfile(new HashMap<String, String>());
		} catch (final AssistedServiceException e) {
			if (e.getMessage() != null && e.getMessage().toLowerCase().contains("duplicate")) {
				model.addAttribute(ASM_MESSAGE_ATTRIBUTE, "asm.createCustomer.duplicate.error");
				model.addAttribute(ASM_ALERT_CLASS, "ASM_alert_customer ASM_alert_create_new");
			} else {
				model.addAttribute(ASM_MESSAGE_ATTRIBUTE, "asm.createCustomer.error");
			}
			model.addAttribute(CUSTOMER_ID, this.encodeValue(customerId));
			model.addAttribute(CUSTOMER_NAME, this.encodeValue(customerName + ", " + customerId));
			final String errorMessage = String.format(
					"sessionId=[%s],agentNo=[%s],service=[%s],action=[%s],customerName=[%s],error message =[%s]", getSessionId(),
					getAgentNo(), "AssistedServiceComponentController", "createCustomer", customerName, e.getMessage());
			LOG.debug(errorMessage, e);
		}
		model.addAllAttributes(this.assistedServiceFacade.getAssistedServiceSessionAttributes());
		return redirectTo;
	}

	@RequestMapping(value = "/personify-stop", method = RequestMethod.POST)
	public String endEmulateCustomer(final Model model) {
		this.authoritiesManager.restoreInitialAuthorities();
		this.assistedServiceFacade.stopEmulateCustomer();
		refreshSpringSecurityToken();
		model.addAllAttributes(this.assistedServiceFacade.getAssistedServiceSessionAttributes());
		model.addAttribute(ASM_REDIRECT_URL_ATTRIBUTE, "/");
		return ASSISTED_SERVICE_COMPONENT;
	}

	@RequestMapping(value = "/resetSession", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void resetSession() {
		return;
	}

	@RequestMapping(value = "/autocomplete", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<AutoSuggestionCustomerData> autocomplete(@RequestParam(CUSTOMER_ID) final String customerId) {
		final List<AutoSuggestionCustomerData> autoSuggestionCustomerDataList = new ArrayList<>();
		try {
			final IdpToken token = this.sessionService.getAttribute(AsiamilesCoreConstants.SESSION_KEY_ASM_TOKEN);
			if (Objects.isNull(token)) {
				LOG.warn("sessionId=[{}],agentNo=[{}],service=[{}],action=[{}],customerId=[{}],description=[{}]", getSessionId(),
						getAgentNo(), "AssistedServiceComponentController", "emulateCustomerByLink", customerId,
						"the asm token unavailable.");
				return autoSuggestionCustomerDataList;
			}

			final MemberProfile profile = this.clsService.generalProfile(customerId, token);
			if (Objects.nonNull(profile))
			{
				this.customerAccountService.storeCustomerProfileFromCls(profile, token);
			}

			final List<CustomerData> customers = this.assistedServiceFacade.getSuggestedCustomerList(customerId);

			if (CollectionUtils.isEmpty(customers)) {
				autoSuggestionCustomerDataList.add(new AutoSuggestionCustomerData());
				return autoSuggestionCustomerDataList;
			}
			for (final CustomerData customer : customers) {
				final AutoSuggestionCustomerData autoSuggestionCustomerData = new AutoSuggestionCustomerData();
				final CustomerModel customerModel = (CustomerModel) this.userService.getUserForUID(customer.getUid());
				populateCustomerJSON(customerModel, autoSuggestionCustomerData);
				final Collection<CartData> carts = this.assistedServiceFacade.getCartListForCustomer(customerModel);
				if (CollectionUtils.isNotEmpty(carts)) {
					final List<String> cartCodes = new ArrayList<>();
					carts.forEach(cart -> cartCodes.add(cart.getCode()));
					autoSuggestionCustomerData.setCarts(cartCodes);
				}
				autoSuggestionCustomerDataList.add(autoSuggestionCustomerData);
			}
		} catch (final Exception e) {
			final String errorMessage = String.format(
					"sessionId=[%s],agentNo=[%s],service=[%s],action=[%s],customerId=[%s],error message =[%s]", getSessionId(),
					getAgentNo(), "AssistedServiceComponentController", "autocomplete", customerId, e.getMessage());
			LOG.error(errorMessage, e);
		}
		return autoSuggestionCustomerDataList;
	}

	protected void populateCustomerJSON(final CustomerModel customer,
			final AutoSuggestionCustomerData autoSuggestionCustomerData) {
		final String cardNumber = customer.getDefaultPaymentInfo() instanceof CreditCardPaymentInfoModel
				? ((CreditCardPaymentInfoModel) customer.getDefaultPaymentInfo()).getNumber()
						: null;
				final String last4Digits = cardNumber == null ? "----"
						: cardNumber.subSequence(cardNumber.length() >= 4 ? (cardNumber.length() - 4) : 0, cardNumber.length())
						.toString();
				final String formattedCreationDate = customer.getCreationtime() != null
						? new SimpleDateFormat("dd/MM/YYYY").format(customer.getCreationtime())
								: "--/--/----";

						autoSuggestionCustomerData.setEmail(customer.getUid());
						autoSuggestionCustomerData.setDate(formattedCreationDate);
						autoSuggestionCustomerData.setValue(customer.getName());
						autoSuggestionCustomerData.setCard(last4Digits);
	}

	@RequestMapping(value = "/bind-cart", method = RequestMethod.POST)
	public String bindCart(@RequestParam(value = CUSTOMER_ID, required = false) final String customerId,
			@RequestParam(value = "cartId", required = false) final String cartId, final Model model) {
		try {
			this.assistedServiceFacade.bindCustomerToCart(customerId, cartId);
			refreshSpringSecurityToken();
			model.addAttribute(ASM_REDIRECT_URL_ATTRIBUTE, "/");
		} catch (final AssistedServiceException e) {
			model.addAttribute(ASM_MESSAGE_ATTRIBUTE, e.getMessage());
			model.addAttribute(CUSTOMER_ID, this.encodeValue(customerId));
			final String errorMessage = String.format(
					"sessionId=[%s],agentNo=[%s],service=[%s],action=[%s],customerId=[%s],cartId=[%s],error message =[%s]",
					getSessionId(), getAgentNo(), "AssistedServiceComponentController", "bindCart", customerId, cartId,
					e.getMessage());
			LOG.debug(errorMessage, e);
		}
		model.addAllAttributes(this.assistedServiceFacade.getAssistedServiceSessionAttributes());
		return ASSISTED_SERVICE_COMPONENT;
	}

	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public String addToCartEventHandler(final Model model) {
		try {
			// since cart isn't empty anymore - emulate mode should be on
			this.assistedServiceFacade.emulateCustomer(this.userService.getCurrentUser().getUid(),
					this.cartService.getSessionCart().getCode());
		} catch (final AssistedServiceException e) {
			final String errorMessage = String.format("sessionId=[%s],agentNo=[%s],service=[%s],action=[%s],error message =[%s]",
					getSessionId(), getAgentNo(), "AssistedServiceComponentController", "addToCartEventHandler", e.getMessage());
			LOG.debug(errorMessage, e);
			return null; // there will be 'page not found' response in case of exception
		}
		return refresh(model);
	}

	@RequestMapping(value = "/refresh", method = RequestMethod.POST)
	public String refresh(final Model model) {
		model.addAllAttributes(this.assistedServiceFacade.getAssistedServiceSessionAttributes());
		return ASSISTED_SERVICE_COMPONENT;
	}

	protected void setSessionTimeout() {
		JaloSession.getCurrentSession().setTimeout(this.assistedServiceFacade.getAssistedServiceSessionTimeout());
		// since agent is logged in - change session timeout to the value from
		// properties
		((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession()
		.setMaxInactiveInterval(this.assistedServiceFacade.getAssistedServiceSessionTimeout()); // in seconds
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
				this.authoritiesManager.addCustomerAuthoritiesToAgent(currentUser.getUid());
			}
		}
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

	protected String encodeValue(final String inputValue) {
		final String trimmedInputValue = StringUtils.isEmpty(inputValue) ? "" : inputValue.trim();

		try {
			return XSSEncoder.encodeHTML(trimmedInputValue);
		} catch (final UnsupportedEncodingException e) {
			final String errorMessage = String.format(
					"sessionId=[%s],agentNo=[%s],service=[%s],action=[%s],inputValue=[%s],error message =[%s]", getSessionId(),
					getAgentNo(), "AssistedServiceComponentController", "encodeValue", inputValue, e.getMessage());
			LOG.error(errorMessage, e);
		}
		return null;
	}

	/**
	 * get AgentNo for logging, if asm login return uid else return empty
	 *
	 * @return
	 */
	private String getAgentNo()
	{
		final AssistedServiceSession session = this.assistedServiceFacade.getAsmSession();
		if (null != session && null != session.getAgent())
		{
			return session.getAgent().getUid();
		}
		return "";
	}

	/**
	 * get sessionId for logging
	 *
	 * @return
	 */
	private String getSessionId()
	{
		if (null != this.sessionService.getCurrentSession())
		{
			return this.sessionService.getCurrentSession().getSessionId();
		}
		return "";
	}
}
