<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="orderData" required="true" type="de.hybris.platform.commercefacades.order.data.OrderData" %>
<%@ attribute name="totalEarnedMiles" required="false" type="java.lang.Double" %>

<c:set var="orderTotalPriceCash" value="${orderData.totalPriceCash}" />
<div class="order-content">
	<div class="item-content order-date-num">
		<p>
			<spring:theme code="text.order.detail.page.one.order.date"/>
			<span class="date-num font-SemiBold">
				<c:choose>
		            <c:when test="${language eq 'zh' || language eq 'zh_TW' }">
		                <fmt:formatDate value="${orderData.created}" pattern="yyyy年MM月dd日"/>
		            </c:when>
		            <c:when test="${language eq 'ja'}">
		            	 <fmt:formatDate value="${orderData.created}" pattern="yyyy年 MM月 dd日"/>
		            </c:when>
		            <c:when test="${language eq 'ko'}">
		            	<fmt:formatDate value="${orderData.created}" pattern="yyyy년 MM월 dd일"/>
		            </c:when>
		            <c:otherwise>
		            	<fmt:formatDate value="${orderData.created}" pattern="d MMM yyyy"/>
		            </c:otherwise>
	        	</c:choose>
			</span>
		</p>
		<p>
			<spring:theme code="text.order.detail.page.one.order.number"/>
			<span class="date-num font-SemiBold">${orderData.code}</span>
		</p>
	</div>
	<div class="item-content order-amount">
		<div class="order-amount__content-wrapper">
			<div class="order-amount__content-block">
				<c:if test="${not empty orderData.totalMiles && orderData.totalMiles > 0}">
					<c:set var="fullCash" value="false"/>
					<svg class="icon-yellow">
						<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-yellow" />
					</svg>
					<span class="integral font-bold"><fmt:formatNumber value="${orderData.totalMiles}" maxFractionDigits="0" /></span>
				</c:if>
				<c:if test="${not empty orderTotalPriceCash.value and orderTotalPriceCash.value > 0}">
					<span class="amount-money font-SemiBold"><span><c:if
							test="${not empty fullCash}">+</c:if></span>${orderData.cashCurrencyIsocode}&nbsp;
						<fmt:formatNumber value="${orderTotalPriceCash.value}" minFractionDigits="2"/>
					</span>
				</c:if>
				<span class="item-num font-regular">(${orderData.qty}&nbsp;
					<c:if test="${orderData.qty gt 1}">
						<spring:theme code="text.order.detail.page.one.order.items"/>
					</c:if>
					<c:if test="${orderData.qty eq 1}"><spring:theme code="text.order.detail.page.one.order.items"/>
					</c:if>)
				</span>
			</div>
			<c:if test="${totalEarnedMiles gt 0}">
				<div class="order-amount__content-block earn-miles">
					<span class="font-regular"><spring:theme code="basket.page.miles.haveearned"/></span>
					<svg class="am-icon">
						<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-yellow" />
					</svg>
					<span class="font-bold"><fmt:formatNumber value="${totalEarnedMiles}" type="number"/>
						<spring:theme code="basket.page.miles.haveearned1"/>
					</span>
				</div>
			</c:if>
		</div>
	</div>

</div>