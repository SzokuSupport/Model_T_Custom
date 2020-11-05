<%@ tag body-content="empty" trimDirectiveWhitespaces="true"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product"%>
<%@ taglib prefix="storepickup"
	tagdir="/WEB-INF/tags/responsive/storepickup"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format"%>

<%@ attribute name="baseInfo" required="true"
	type="com.asiamiles.core.dto.BaseInfo"%>

<div class="container">

	<c:if test="${baseInfo.isEmailAddressValidated==1}">
		<input hidden=true type="text" name="emailAddress"
			value="${baseInfo.emailAddress}" />
		<div class="confirm__email">
			<spring:theme code = "asiamiles.check.out.stype.nav.confirmation.you.email.1"/> <span
				class="font-SemiBold">"${baseInfo.emailAddress}"</span>
				<spring:theme code = "asiamiles.check.out.stype.nav.confirmation.you.email.2"/>
		</div>
	</c:if>
	<c:if test="${baseInfo.isEmailAddressValidated!=1}">
		<div class="confirm__email--input">
			<p><spring:theme code ="asiamiles.check.out.stype.one.conf.send"/></p>
			<div class="input-component J-input-transform">
				<input type="text" name="emailAddress" value="${baseInfo.emailAddress}"/> <label
					class="placeholder J-input-placeholder"><spring:theme code = "asiamiles.check.out.stype.one.conf.send.email.address"/></label>
				<div class="errorBox J-error-box">
					<div class="errorMes">
						<svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
							<g fill="none" fill-rule="evenodd">
								<path fill="#D0021B" d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
								<path fill="#FFF" d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
							</g>
						</svg>
						<span class="J-error-back">Please enter your emailAddress</span>
					</div>
				</div>
			</div>
			
		</div>
	</c:if>


</div>