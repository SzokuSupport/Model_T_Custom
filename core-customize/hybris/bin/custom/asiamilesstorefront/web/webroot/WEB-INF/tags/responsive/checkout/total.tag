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
<%@ attribute name="cartInfo" required="true"
	type="de.hybris.platform.commercefacades.order.data.CartData"%>

<div class="container">
	<div class="total-mes">
		<div class="total-mes__price">
			<div class="total-mes__price-order-total">
				<p class="font-SemiBold total-mes__price--left"><spring:theme code="asiamiles.check.out.stype.nav.order.total" /></p>
				<div class="total-mes__price--right">
					<p class="total-mes__price--right__money">
						<svg class="icon-price__one">
							<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num" />
						</svg>
						<span class="font-bold"><fmt:formatNumber value="${cartInfo.totalPrice.value}"
																  maxFractionDigits="0"/></span>
					</p>
					<p class="total-mes__price--right__HKD">+${countryData.currencyIsoCode}&nbsp;
						<fmt:formatNumber value="${cartInfo.totalPriceCash.value}" maxFractionDigits="2"
										  minFractionDigits="2" /></p>
				</div>
			</div>
			<c:if test="${not empty cartInfo.appliedBonusPromotions or cartInfo.totalEarnedMiles gt 0}">
				<div class="total-mes__price-earn-miles">
					<div class="earn-miles-content">
						<div class="earn-miles-content__row  earn-miles-content__title">
							<div class="earn-miles-content__row-content-left">
								<p class="font-SemiBold"><spring:theme code="basket.page.miles.tobeearned"/></p>
							</div>
							<div class="earn-miles-content__row-content-right">
                       <span class="earn-miles-title-total-wrapper J-earn-miles-title-total-wrapper">
                           <svg class="am-icon">
                               <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num" />
                           </svg>
                           <span class="font-bold J-total-miles-to-earn"><fmt:formatNumber value="${cartInfo.totalBonusMiles }" maxFractionDigits="0"/></span>
                       </span>

                       <svg class="icon-dropdown J-expand-earn-miles-details">
                           <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown"></use>
                       </svg>
                      </div>
                  </div>
                  <div class="earn-miles-content-details-wrapper J-earn-miles-content-details-wrapper earn-miles-content-details-wrapper--hide">
							<c:if test="${cartInfo.totalEarnedMiles gt 0 }">
								<div class="earn-miles-content__row">
									<div class="earn-miles-content__row-content-left">
										<span><spring:theme code="text.product.page.base.earn.miles.cash.spending.text"/></span>
									</div>
									<div class="earn-miles-content__row-content-right">
										<svg class="am-icon">
											<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num"/>
										</svg>
										<span class="font-bold"><fmt:formatNumber value="${cartInfo.totalEarnedMiles}" type="number"/></span>
									</div>
								</div>
							</c:if>
							<c:forEach items="${cartInfo.appliedBonusPromotions }" var="promotion" varStatus="status">
								<div class="earn-miles-content__row">
									<c:set var="code" value=""/>
									<c:forEach items="${promotion.appliedVouchers }" var="voucher">
										<c:set var="code" value="${voucher }"/>
									</c:forEach>
									<div class="earn-miles-content__row-content-left">
										<span>${promotion.promotionData.name }</span>
									</div>
									<div class="earn-miles-content__row-content-right">
										<svg class="am-icon">
											<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num"/>
										</svg>
										<span class="font-bold"><fmt:formatNumber value="${promotion.bonusMiles}" type="number"/></span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="earn-miles-remark">
						<p class="font-SemiBold">
							<spring:theme code="basket.page.miles.remindstart"/>
							<a href=${overviewProfileURL} target="_blank"><spring:theme code="basket.page.miles.remindlink"/></a>
							<spring:theme code="basket.page.miles.remindend"/>
						</p>
					</div>
				</div>
			</c:if>
		</div>
		<div class="total-mes__check">
			<p>
				<spring:theme code="asiamiles.check.out.stype.nav.send.verification.code" />
			</p>
			<button type="submit" class="button-yellow font-SemiBold J-form-verification">
				<spring:theme code="asiamiles.check.out.stype.nav.verify" /></button>
		</div>
	</div>
</div>