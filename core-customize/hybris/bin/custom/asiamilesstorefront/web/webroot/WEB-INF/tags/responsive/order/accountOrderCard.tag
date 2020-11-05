<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="utf-8" %>
<%@ attribute name="order" required="true" type="de.hybris.platform.commercefacades.order.data.OrderHistoryData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 item-list J-item-list">
    <div class="order-container order-date-num">
        <p class="order-title">
        		<c:set var="pattern"><spring:theme code="basket.page.time.pattern"/></c:set>
            <spring:theme code="text.order.list.order.date"/>: 
            <span class="order-text font-SemiBold date J-order-date">
                <fmt:formatDate value="${order.placed}" pattern="${pattern }"/>
				</span>
        </p>
        <p class="order-title">
            <spring:theme code="text.order.list.order.number"/>: <span
                class="order-text font-SemiBold number J-order-number">${order.code}</span>
        </p>
    </div>
    <div class="order-container order-amount">
        <div class="order-amount__left">
            <c:if test="${not empty order.totalMiles && order.totalMiles > 0}">
                <svg class="icon-yellow">
                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-yellow"/>
                </svg>
                <span class="integral font-bold J-total-miles"><fmt:formatNumber value="${order.totalMiles}"
                                                                                 maxFractionDigits="0"/></span></span>
            </c:if>
            <c:if test="${not empty order.totalPriceCash && order.totalPriceCash > 0}">
                 <span class="amount-money font-SemiBold">
                                <span>+&nbsp;${order.currency}</span>
                                <span class="J-total-cash"><fmt:formatNumber value="${order.totalPriceCash}"
                                                                             minFractionDigits="2"
                                                                             maxFractionDigits="2"/></span>
                            </span>
            </c:if>
            <span class="item-num font-regular">[${order.qty}&nbsp;<c:if test="${order.qty>1}">
                <spring:theme code="text.order.list.order.items"/>
            </c:if>
			<c:if test="${order.qty<2}">
                <spring:theme code="text.order.list.order.items"/>
            </c:if>]
		</span>
        </div>
        <c:if test="${order.totalEarnedMiles gt 0}">
            <div class="order-amount__right">
                <span class="font-bold"><spring:theme code="basket.page.miles.haveearned"/></span>
                <svg class="icon-yellow">
                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-yellow" />
                </svg>
                <span class="font-bold"><fmt:formatNumber value="${order.totalEarnedMiles}" type="number"/></span>
                <span class="font-bold"><spring:theme code="basket.page.miles.haveearned1"/></span>
            </div>
        </c:if>
    </div>
    <div class="order-container order-image-button">
        <c:if test="${not empty order.images}">
            <div class="order-image">
                <c:forEach items="${order.images}" var="image">
                    <div class="image-list">
                        <img src="${image.url}"
                             alt='images for order number <${order.code}> and order date on ${order.placed}'/>
                    </div>
                </c:forEach>
                <c:if test="${order.restImageCount > 0}">
                    <span class="image-num font-regular">+${order.restImageCount}</span>
                </c:if>
            </div>
        </c:if>
        <c:if test="${empty order.images}">
            <div class="order-image">
                <div class="image-list">
                    <img src="<spring:theme code="img.missingProductImage.responsive.orderHistoryListing"/>"
                         alt='images for order number <${order.code}> and order date on ${order.placed}'/>
                </div>
            </div>
        </c:if>
        <a href="/${language}/my-account/order/${order.code}" class="view-detial-button font-SemiBold"
           aria-label="See order details button- for order number <${order.code}> and order date on ${order.placed}">
            <spring:theme code="text.order.list.order.see.order.details"/></a>
    </div>
</div>