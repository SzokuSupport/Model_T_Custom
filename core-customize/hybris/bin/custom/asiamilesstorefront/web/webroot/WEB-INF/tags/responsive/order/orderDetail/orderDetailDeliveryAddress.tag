<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="deliveryAddress" required="true" type="de.hybris.platform.commercefacades.user.data.AddressData" %>

<div class="delivery-content delivery-recipient font-regular">
	<span class="deliver-title font-SemiBold"><spring:theme
			code="text.account.order.detail.deliveryrecipient" /></span> <span>${deliveryAddress.title}&nbsp;${deliveryAddress.firstName}&nbsp;${deliveryAddress.lastName}</span>
	<c:if
		test="${not empty deliveryAddress.phoneAreaCode and not empty deliveryAddress.phone }">
		<span>+${deliveryAddress.phoneAreaCode}&nbsp;${deliveryAddress.phone}</span>
	</c:if>
	
</div>

<c:if test="${deliveryAddress.addressFlag}">
	<div class="delivery-content font-regular delivery-address-content">
		<div class="delivery-address">
			
		<div class="deliver-title font-SemiBold"><spring:theme code="text.checkout.page.delivery.address.english" />
			<span class="address-language font-regular"><spring:theme code="text.checkout.page.delivery.address.english2"/> </span>
		</div>
		
		<c:if test="${not empty deliveryAddress.companyName}">
			<span>${deliveryAddress.companyName}</span>
		</c:if>
		<c:if test="${not empty deliveryAddress.line1}">
			<span>${deliveryAddress.line1}</span>
		</c:if>
		<c:if test="${not empty deliveryAddress.line2}">
			<span>${deliveryAddress.line2}</span>
		</c:if>
		<c:if test="${not empty deliveryAddress.line3}">
			<span>${deliveryAddress.line3}</span>
		</c:if>
		<c:if test="${not empty deliveryAddress.city}">
			<span>${deliveryAddress.city}</span>
		</c:if>
		<c:if test="${not empty deliveryAddress.state}">
			<span>${deliveryAddress.state}</span>
		</c:if>
		<c:if test="${not empty deliveryAddress.countryName}">
			<span>${deliveryAddress.countryName}</span>
		</c:if>
		<c:if test="${not empty deliveryAddress.postalCode}">
			<span>${deliveryAddress.postalCode}</span>
		</c:if>
	</div>
	

	<c:if test="${deliveryAddress.localAddressFlag}">
		<div class="delivery-address">
			<div class="deliver-title font-SemiBold">
				<spring:theme code="text.account.order.detail.deliveryaddress" />
				<span class="address-language font-regular">(Local language)</span>
			</div>
			<c:if test="${not empty deliveryAddress.localCompanyName}">
				<span>${deliveryAddress.localCompanyName}</span>
			</c:if>
			<c:if test="${not empty deliveryAddress.localLine1}">
				<span>${deliveryAddress.localLine1}</span>
			</c:if>
			<c:if test="${not empty deliveryAddress.localLine2}">
				<span>${deliveryAddress.localLine2}</span>
			</c:if>
			<c:if test="${not empty deliveryAddress.localLine3}">
				<span>${deliveryAddress.localLine3}</span>
			</c:if>
			<c:if test="${not empty deliveryAddress.localCity}">
				<span>${deliveryAddress.localCity}</span>
			</c:if>
			<c:if test="${not empty deliveryAddress.localState}">
				<span>${deliveryAddress.localState}</span>
			</c:if>
			<c:if test="${not empty deliveryAddress.localCountryName}">
				<span>${deliveryAddress.localCountryName}</span>
			</c:if>
			<c:if test="${not empty deliveryAddress.localPostalCode}">
				<span>${deliveryAddress.localPostalCode}</span>
			</c:if>
		</div>
	</c:if>
	</div>
</c:if>