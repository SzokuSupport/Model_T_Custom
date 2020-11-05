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

<%@ attribute name="emailDeliveryInfo" required="true"
	type="com.asiamiles.core.dto.EmailDeliveryInfo"%>
	
	<input type="text" hidden=true
	id="emailNeed"
	value="${emailDeliveryInfo.needEmailDelivery}"
	name="needEmailDelivery" />
<div class="step-one__email J-email-need-self">

	<div class="step-one__email--left">
		<span><spring:theme code = "asiamiles.check.out.stype.nav.delivery.address.by.email"/></span>
	</div>
	<div class="row step-one__email--right">
		<div class="col-lg-12 col-sm-12">
			<div class="input-component J-input-transform">
				<input type="text" id="email" name="deliveryEmailAddress"
					value="${emailDeliveryInfo.deliveryEmailAddress}" /> <label
					class=" placeholder J-input-placeholder" for="email"><spring:theme code = "asiamiles.check.out.stype.nav.recipient.email.address"/></label>
					<div class="errorBox J-error-box">
						<div class="errorMes">
							<svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
								<g fill="none" fill-rule="evenodd">
									<path fill="#D0021B" d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
									<path fill="#FFF" d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
								</g>
							</svg>
							<span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>