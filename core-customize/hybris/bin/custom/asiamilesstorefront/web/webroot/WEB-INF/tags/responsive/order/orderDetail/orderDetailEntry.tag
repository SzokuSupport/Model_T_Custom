<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="orderEntry" required="true" type="com.asiamiles.facades.Data.OrderDetailEntryData" %>

<div class="order-product-info">
    <div class="product-image">
        <picture>
            <c:if test="${not empty orderEntry.productImage}">
                <source media="(max-width: 766px)"
                        data-srcset="${orderEntry.productImage.url }">
                <source media="(min-width: 768px) and (max-width: 1280px)"
                        data-srcset="${orderEntry.productImage.url }">
                <img class="lazy cross-sale"
                     data-src="${orderEntry.productImage.url }"
                     alt="this is a picture">
            </c:if>
            <c:if test="${empty orderEntry.productImage}">
                <source media="(max-width: 766px)"
                        data-srcset='<spring:theme code="img.missingProductImage.responsive.orderHistoryDetails"/>'>
                <source media="(min-width: 768px) and (max-width: 1280px)"
                        data-srcset='<spring:theme code="img.missingProductImage.responsive.orderHistoryDetails"/>'>
                <img class="lazy cross-sale"
                     data-src='<spring:theme code="img.missingProductImage.responsive.orderHistoryDetails"/>'
                     alt="this is a picture">
            </c:if>
        </picture>
    </div>
    <c:set var="product" value="${orderEntry.product}"/>
    <div class="order-info">
        <span class="font-bold product-name">${product.brandName}</span>
        <span class="font-regular product-description">${product.name }</span>
        <div class="font-regular package-info"><spring:theme code="text.product.detail.page.package.code"/>&nbsp;:<span
                class="package-code">${product.code}</span></div>
        <span class="font-regular product-detail-info">
      <c:if test="${not empty orderEntry.option}">
          ${orderEntry.option}
      </c:if>
      </span>
        <div class="font-regular quantity-info"><spring:theme code="text.order.detail.page.one.order.quantity"/>:<span
                class="font-bold quantity-count">${orderEntry.qty}</span>
        </div>
        <c:if test="${country eq 'HK' && not empty orderEntry.product.specialProductType && orderEntry.product.specialProductType eq 'ELECTRONIC' && not empty orderEntry.consignments.get(0).statutoryRemovalService}">
            <div style="font-size: 12px;line-height: 1.0625rem; margin-top: .375rem; color: #525960; margin-top: 15px;">
                <p class=""><spring:theme code="checkout.step1.ree.text"/><span class="font-Bold"
                                                                                style="display: unset;">&nbsp;&nbsp;<spring:theme
                        code="checkout.step1.ree.status.${orderEntry.consignments.get(0).statutoryRemovalService}"/></span>
                </p>
                <c:if test="${orderEntry.consignments.get(0).statutoryRemovalService eq 'TO_BE_DETERMINED'}">
                    <div class="removal-recycling-service-remark" style="margin-top: 5px;">
                        <spring:theme code="text.order.details.ree.status.TO_BE_DETERMINED.message1"/><a
                            class="go-to-contact-details" href="javascript:void(0);"
                            style="text-decoration: underline;"><spring:theme
                            code="text.order.details.ree.status.TO_BE_DETERMINED.message2"/></a><spring:theme
                            code="text.order.details.ree.status.TO_BE_DETERMINED.message3"/>
                    </div>
                </c:if>
            </div>
        </c:if>
    </div>
    <div class="item-total">
    	  <c:set var="onlyCash" value="true"/>
        <span class="font-SemiBold item-total-title"><spring:theme code="text.order.detail.page.one.item.total"/></span>
        <div class="total-amount-section">
            <c:if test="${orderEntry.totalMiles > 0}">
             <c:set var="onlyCash" value="false"/>
                <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                     width="40" height="48" viewBox="0 0 40 48">
                    <g fill="none" fill-rule="evenodd">
                        <path fill="#FACF00"
                              d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                        <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                        <path fill="#FACF00"
                              d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                    </g>
                </svg>
                <span class="total-amount font-bold"><fmt:formatNumber value="${orderEntry.totalMiles}"
                                                                       maxFractionDigits="0"/></span>
            </c:if>
        </div>
        <c:if test="${not empty orderEntry.totalPriceCash and orderEntry.totalPriceCash > 0 }">
            <span class="font-SemiBold amount-add"><c:if test="${!onlyCash}">+&nbsp;</c:if>${orderEntry.currency}&nbsp;<fmt:formatNumber
                    value="${orderEntry.totalPriceCash}" minFractionDigits="2"/></span>
        </c:if>
        <c:if test="${orderEntry.earnedMiles gt 0}">
            <div class="individual-product-earn-miles J-earn-miles-bubbling">
                <span class="font-regular"><spring:theme code="basket.page.miles.haveearned"/></span>
                <svg class="am-icon">
                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-yellow" />
                </svg>
                <span class="font-bold"><fmt:formatNumber value="${orderEntry.earnedMiles}" type="number"/><spring:theme code="basket.page.miles.haveearned1"/></span>
                <svg class="icon-info-small J-bubbling-static-icon" tabindex="0">
                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-info-small"></use>
                </svg>
                <div class="bubbling-static">
                    <div class="earn-miles">
                    		<c:if test="${not empty orderEntry.earnedBaseMiles}">
                        <div class="earn-miles-content">
                            <div class="earn-miles-content__row">
                                <div class="earn-miles-content__row-content-left">
                                    <span>${orderEntry.earnedBaseMiles.title}</span>
                                </div>
                                <div class="earn-miles-content__row-content-right">
                                    <svg class="am-icon">
                                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num" />
                                    </svg>
                                    <span class="font-bold"><fmt:formatNumber value="${orderEntry.earnedBaseMiles.earnedMiles}" type="number"/></span>
                                </div>
                            </div>
                        </div>
                        </c:if>
                        <c:forEach items="${orderEntry.earnedBonuseMiles}" var="bonus">
	                        <div class="earn-miles-content">
	                            <div class="earn-miles-content__row">
	                                <div class="earn-miles-content__row-content-left">
	                                    <span>${bonus.title }</span>
	                                </div>
	                                <div class="earn-miles-content__row-content-right">
	                                    <svg class="am-icon">
	                                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num" />
	                                    </svg>
	                                    <span class="font-bold"><fmt:formatNumber value="${bonus.earnedMiles}" type="number"/></span>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>