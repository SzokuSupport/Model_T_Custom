<%@ attribute name="abstractOrderData" required="true"
              type="de.hybris.platform.commercefacades.order.data.AbstractOrderData" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="info-box total">
    <div class="order-total">
        <div class="info-title font-SemiBold"><spring:theme
                code="text.order.summary.page.order.total.in.order.list"/></div>
        <div class="total-box">
            <p class="balance font-bold">
                <svg class="icon-yellow">
                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-yellow"></use>
                </svg>
                <fmt:formatNumber value="${orderData.totalPrice.value}" maxFractionDigits="0"/>
            </p>
            <p class="cash">+ ${countryData.currencyIsoCode}&nbsp; 
            	<fmt:formatNumber value="${orderData.totalPriceCash.value}" minFractionDigits="2" maxFractionDigits="2"/></p>
        </div>
    </div>
    <c:if test="${orderData.totalEarnedMiles gt 0 or not empty orderData.appliedBonusPromotions }">
        <div class="earn-miles">
            <div class="earn-miles-content">
            	 <c:set var="totalEarned" value="${orderData.totalEarnedMiles}"/>
                <c:forEach  items="${orderData.appliedBonusPromotions }" var="promotion" varStatus="status">
	            	 <c:set var="totalEarned" value="${totalEarned+ promotion.bonusMiles}"/>
					</c:forEach>
	                <div class="earn-miles-content__row">
	                    <div class="earn-miles-content__row-content-left">
	                        <span class="font-SemiBold"><spring:theme code="basket.page.miles.earned"/></span>
	                    </div>
	                    <div class="earn-miles-content__row-content-right">
	                        <svg class="am-icon">
	                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num"/>
	                        </svg>
	                        <span class="font-bold"><fmt:formatNumber value="${totalEarned}" type="number"/></span>
	                    </div>
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
