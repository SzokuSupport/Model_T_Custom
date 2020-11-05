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
<%@ taglib prefix="checkout" tagdir="/WEB-INF/tags/responsive/checkout"%>
<%@ attribute name="phoneCountryCode" required="true"
	type="java.util.List"%>
<%@ attribute name="recipientInfo" required="true"
	type="com.asiamiles.core.dto.RecipientInfo"%>

<div class="step-one__recipient">
	<div class="step-one__recipient--left">
		<span>
			<spring:theme code="asiamiles.check.out.stype.nav.recipient.details" /></span>
	</div>
	<input type="hidden" name="deliverTo" value="other">
	<div class="row step-one__recipient--right">
		<div class="col-lg-12 col-sm-12">
			<checkout:amlTitle titles="${DeliveryInfo.titles}"/>
			<div class="input-component J-input-transform">
				<input type="text" id="familyNameOther" name="familyName" value="${recipientInfo.familyName}"
					aria-invalid="false" />
				<label class=" placeholder J-input-placeholder" for="familyNameOther">
					<spring:theme code="asiamiles.check.out.stype.nav.recipient.family.name" /></label>
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
			<div class="input-component J-input-transform">
				<input type="text" id="givenNameOther" name="givenName" value="${recipientInfo.givenName}" />
				<label class=" placeholder J-input-placeholder" for="givenNameOther">
					<spring:theme code="asiamiles.check.out.stype.nav.recipient.given.name" /></label>
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
		<div class="col-lg-6 col-sm-6">
			<div class="dropdown-group__checkOut J-country-code">
				<label for="recipientCountryCode" class="dropdown-label">
					<spring:theme code="asiamiles.check.out.stype.nav.recipient.country.and.code" /></label>
				<a class="dropdown-selected J-selectTrigger" aria-hidden="false" tabindex="0">
					<span class="dropdown-selected-text J-code">${recipientInfo.countryCode}</span>
					<input class="J-select-input" name="recipientCountryCode" type="hidden" id='capacity'
						value="${recipientInfo.countryCode}" />
					<svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
						<g fill="none" fill-rule="evenodd" transform="translate(5 8)">
							<path d="M15 0v8.414H0V0z"/>
							<path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
						</g>
					</svg>
				</a>
				<!-- desktop dropdown -->
				<div class="dropdown-selected-control J-selectedControl">
					<ul class="listbox" role="listbox" aria-expanded="true">
						<c:forEach items="${phoneCountryCode}" var="phoneCountry">
							<c:if test="${recipientInfo.countryCode==phoneCountry.phoneCode}">
								<li class="option selected" role="option" data-href=""><a class="link"
										href="javascript:;"><span>${phoneCountry.name}</span>
										<span class="J-code-num">${phoneCountry.phoneCode}</span></a></li>
							</c:if>
							<c:if test="${recipientInfo.countryCode!=phoneCountry.phoneCode}">
								<li class="option " role="option" data-href=""><a class="link"
										href="javascript:;"><span>${phoneCountry.name}</span>
										<span class="J-code-num">${phoneCountry.phoneCode}</span></a></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<!-- /desktop dropdown -->
				<!-- mobile dropdown -->
				<select class="dropdown-selected-control--mobile J-selectedControlMobile" name="title"
					id="otherCuntryListBoxPhone" use="Y">
					<c:forEach items="${phoneCountryCode}" var="phoneCountry">
						<c:if test="${recipientInfo.countryCode==phoneCountry.phoneCode}">
							<option class="option" value=${phoneCountry.phoneCode} selected
								ccode=${phoneCountry.phoneCode}>
								<span>${phoneCountry.name}</span>
								<span class="J-code-num">${phoneCountry.phoneCode}</span>
							</option>
						</c:if>

						<c:if test="${recipientInfo.countryCode!=phoneCountry.phoneCode}">
							<option class="option" value=${phoneCountry.phoneCode} ccode=${phoneCountry.phoneCode}>
								<span>${phoneCountry.name}</span>
								<span class="J-code-num">${phoneCountry.phoneCode}</span>
							</option>
						</c:if>
					</c:forEach>
				</select>
				<!-- /mobile dropdown -->
				<div class="errorBox J-error-box">
					<div class="errorMes">
						<svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
							<g fill="none" fill-rule="evenodd">
								<path fill="#D0021B" d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
								<path fill="#FFF" d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
							</g>
						</svg>
						<span class="J-error-back">
							<spring:theme code="text.checkout.page.recipient.country.name.error" />
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-sm-6">
			<div class="input-component J-input-transform">
				<input type="text" id="phoneOther" name="recipientPhoneNo" aria-label="Mobile phone number" value="${recipientInfo.phoneNo}"
					aria-invalid="false" />
				<label class="placeholder J-input-placeholder" for="phoneOther" aria-hidden='true'>
					<spring:theme code="asiamiles.check.out.stype.nav.recipient.phone" /> </label>
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