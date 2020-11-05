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

<%@ attribute name="cartInfo" required="true"
	type="de.hybris.platform.commercefacades.order.data.CartData"%>


<div class="order-details">
	<div class="container order-details__content">
		<p class="order-details__title font-regular J-detail">
			<spring:theme code = "asiamiles.check.out.stype.nav.order.details"/>
			<svg class="icon-expand J-detail-icon" aria-label='Arrow button-Order Details-Clickable' tabindex="0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
				<g fill="none" fill-rule="evenodd">
					<mask fill="#fff">
						<path d="M20 8v8.414H5V8z"/>
					</mask>
					<path fill="#272F38" d="M12.5 16.414a.908.908 0 0 1-.646-.268L5 9.292 6.292 8l6.208 6.208L18.707 8 20 9.292l-6.854 6.854a.91.91 0 0 1-.646.268" mask="url(#b)" transform="rotate(180 12.5 12.207)"/>
				</g>
    					</svg>
		</p>
		<c:forEach var="entry" items="${cartInfo.entries}" varStatus="status">
			<div class="row">
				<div class="order-detail">
					<div class="col-lg-12 col-sm-12 order-detail__mes">
						<div class="order-detail__mes--img">
							<div class="info--img ImgToBg">
								<product:productPrimaryImage product="${entry.product}"
									format="cartIcon" />
							</div>
						</div>
						<div class="order-detail__mes--text">
							<p class="font-bold">${fn:escapeXml(entry.product.brandName)}</p>
							<p class="font-regular">${fn:escapeXml(entry.product.name)}</p>
							<ul class="order-detail__mes--text__size" id="otherOrderDetail" name="otherOrderDetail">
								<c:if test="${not empty entry.product.baseOptions}">
									<script>
										<c:forEach items="${entry.product.baseOptions}" var="productOption">
											$("ul[name='otherOrderDetail']").eq(${status.index}).append('<li><span>${productOption.selected.variantOptionQualifiers[0].name}:</span><span class="font-SemiBold">${productOption.selected.variantOptionQualifiers[0].value}</span></li>');
										</c:forEach>
									</script>
								</c:if>

							</ul>
						</div>
					</div>
					<%-- <div class="col-lg-12 col-sm-12 order-detail__price">
						<div class="order-detail__price--normal">
							<svg class="icon-price" xmlns="http://www.w3.org/2000/svg" width="40" height="48" viewBox="0 0 40 48">
								<g fill="none" fill-rule="evenodd">
									<path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
									<path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
									<path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
								</g>
						            </svg>
							<fmt:formatNumber value="${entry.totalPrice.value}"
								maxFractionDigits="3" />
						</div>
						<div class="order-detail__price--HKD">
							<spring:theme code="${entry.totalPriceCash.currencyIso}" />
							<fmt:formatNumber value="${entry.totalPriceCash.value}"
								maxFractionDigits="3" />
						</div>
					</div> --%>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
