<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="order" required="true" type="de.hybris.platform.commercefacades.order.data.OrderData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
<link href="/_ui/responsive/aml/css/orderDetails.css" rel="stylesheet">

<c:set var="orderTotalPriceCash" value="${orderData.totalPriceCash}" />
<c:set var="deliveryAddress" value="${orderData.deliveryAddress}" />

<div class="container order-detail-container">
	<h2 class="order-detail-headline">
		<span class="text font-light">
			<spring:theme code="text.order.detail.page.one.title" /></span>
	</h2>
	<div class="order-detail-content">
		<div class="order-content">
			<div class="item-content order-date-num">
				<p>
					<spring:theme code="text.order.detail.page.one.order.date" /> <span class="date-num font-SemiBold">
						<fmt:formatDate value="${orderData.created}" pattern="d MMM yyyy"/>&nbsp;GMT+8</span></p>
				<p>
					<spring:theme code="text.order.detail.page.one.order.number" /> <span
						class="date-num font-SemiBold">${orderData.code}</span></p>
			</div>
			<div class="item-content order-amount">
				<c:if test="${not empty orderData.totalMiles && orderData.totalMiles > 0}">
					<svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
						<g fill="none" fill-rule="evenodd">
							<path fill="#FACF00"
								d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z" />
							<path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z" />
							<path fill="#FACF00"
								d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z" />
						</g>
					</svg>
					<span class="integral font-bold">
						<fmt:formatNumber value="${orderData.totalMiles}" maxFractionDigits="0" /></span>
				</c:if>
				<c:if test="${not empty orderTotalPriceCash.value and orderTotalPriceCash.value > 0}">
					<span class="amount-money font-SemiBold"><span>+</span>${order.cashCurrencyIsocode}&nbsp;
						<fmt:formatNumber value="${orderTotalPriceCash.value}" minFractionDigits="2"
							maxFractionDigits="2" /></span>
				</c:if>
				<span class="item-num font-regular">(${orderData.qty}&nbsp;<c:if test="${orderData.qty gt 1}">
						<spring:theme code="text.order.detail.page.one.order.items" />
					</c:if>
					<c:if test="${orderData.qty eq 1}">
						<spring:theme code="text.order.detail.page.one.order.items" />
					</c:if>)
				</span>
			</div>
		</div>
		<div class="deliver-info">
			<div class="deliver-info-name font-bold">
				<span class="info-name">
					<spring:theme code="text.order.detail.page.one.delivery.info" /></span>
				<span class="items-num font-regular">(${orderData.qty}&nbsp;<c:if test="${orderData.qty gt 1}">
						<spring:theme code="text.order.detail.page.one.order.items" />
					</c:if>
					<c:if test="${orderData.qty eq 1}">
						<spring:theme code="text.order.detail.page.one.order.items" />
					</c:if>)
				</span>
			</div>
			<div class="delivery-container">
				<div class="delivery-content font-regular">
					<span class="deliver-title font-SemiBold">
						<spring:theme code="text.order.detail.page.one.recipient.details" /></span>
					<span>${deliveryAddress.title}&nbsp;${deliveryAddress.firstName}&nbsp;${deliveryAddress.lastName}</span>
					<c:if test="${not empty deliveryAddress.phone }">
						<span>+${deliveryAddress.phone}</span>
					</c:if>
					<c:if test="${not empty deliveryAddress.email}">
						<span> ${deliveryAddress.email}</span>
					</c:if>

				</div>
				<c:if test="${deliveryAddress.addressFlag}">
					<div class="delivery-content font-regular">
						<span class="deliver-title font-SemiBold">
							<spring:theme code="text.order.detail.page.one.delivery.address"/> <span
								class="deliver_en font-regular">(English)</span></span>
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
						<c:if test="${not empty deliveryAddress.country.name}">
							<span>${deliveryAddress.country.name}</span>
						</c:if>
						<c:if test="${not empty deliveryAddress.postalCode}">
							<span>${deliveryAddress.postalCode}</span>
						</c:if>
					</div>
				</c:if>
			</div>
		</div>
		<c:if test="${not empty orderData.entries}">
			<c:forEach items="${orderData.entries}" var="orderEntry">
				<div class="order-detail-list">
					<div class="item-detail">
						<span class="item-title">${orderEntry.productName}</span>
						<p>
							<spring:theme code="text.order.detail.page.one.package.code" />
							:<span>&nbsp;&nbsp;${orderEntry.productCode }</span></p>
						<p class="quantity">
							<spring:theme code="text.order.detail.page.one.order.quantity" />:<span
								class="number font-SemiBold">&nbsp;&nbsp;${orderEntry.quantity}</span></p>
						<div class="reference">
							<span>
								<spring:theme code="text.order.detail.page.one.reference.number" />:</span>
							<span class="reference-num">${orderEntry.claim}</span>
						</div>
					</div>
					<div class="item-total font-SemiBold">
						<span>
							<spring:theme code="text.order.detail.page.one.item.total" /></span>
						<div class="item-amount-money font-bold">
							<c:if test="${orderEntry.totalMiles > 0}">
								<svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48"
									viewBox="0 0 40 48">
									<g fill="none" fill-rule="evenodd">
										<path fill="#FACF00"
											d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z" />
										<path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z" />
										<path fill="#FACF00"
											d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z" />
									</g>
								</svg>
								<span class="integral font-bold">
									<fmt:formatNumber value="${orderEntry.totalMiles}" maxFractionDigits="0" /></span>
							</c:if>
							<c:if
								test="${not empty orderEntry.totalPriceCash.value and orderEntry.totalPriceCash.value > 0 }">
								<span
									class="amount-money font-SemiBold"><span>+</span>${order.cashCurrencyIsocode}&nbsp;
									<fmt:formatNumber value="${orderEntry.totalPriceCash.value}" minFractionDigits="2"
										maxFractionDigits="2" /></span>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>

		<div class="order-total">
			<span class="order-total-title font-bold">
				<spring:theme code="text.order.detail.page.one.order.total" /></span>
			<div class="order-total-content">
				<div class="total-amount">
					<c:if test="${not empty orderData.totalMiles && orderData.totalMiles > 0}">
						<svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
							<g fill="none" fill-rule="evenodd">
								<path fill="#FACF00"
									d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z" />
								<path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z" />
								<path fill="#FACF00"
									d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z" />
							</g>
						</svg>
						<span class="integral font-bold">
							<fmt:formatNumber value="${orderData.totalMiles}" maxFractionDigits="0" /></span>
					</c:if>
				</div>
				<c:if test="${not empty orderTotalPriceCash.value and orderTotalPriceCash.value > 0}">
					<span class="currey-amount font-SemiBold">+ ${order.cashCurrencyIsocode}&nbsp;
						<fmt:formatNumber value="${orderTotalPriceCash.value}" minFractionDigits="2"
							maxFractionDigits="2" /></span>
				</c:if>
			</div>
		</div>
	</div>
</div>
<script src="/_ui/responsive/aml/js/common.js"></script>
<script src="/_ui/responsive/aml/js/orderDetails.js"></script>
