<%@ attribute name="abstractOrderData" required="true"
              type="de.hybris.platform.commercefacades.order.data.AbstractOrderData" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="multi-checkout" tagdir="/WEB-INF/tags/responsive/checkout/multi" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="info-box order-items">
    <div class="info-title font-SemiBold"><spring:theme code="text.order.summary.page.order.items"/>
        (${abstractOrderData.totalUnitCount})
    </div>
    <div class="detail-desc">
        <c:forEach var="entry" items="${abstractOrderData.entries}">
            <div class="cart-item--list">
                <div class="info clearfix">
                    <div class="info--img ImgToBg">
                        <product:productPrimaryImage product="${entry.product}" format="orderSummary"/>
                    </div>
                    <div class="info--detail">
                        <p class="brand-name font-bold">${fn:escapeXml(entry.product.brandName)}</p>
                        <p class="product-name">${fn:escapeXml(entry.product.name)}</p>
                        <ul class="variant-selection clearfix">
                            <c:if test="${not empty entry.product.baseOptions}">
								<c:forEach items="${entry.product.baseOptions}" var="option">
                                   		 <c:choose>
                                                <c:when test="${option.selected.code eq entry.product.code}">
                                                   <c:set var="productOption" value="${option}"/>
                                                </c:when>
                                                <c:otherwise>
                                                </c:otherwise>
                                            </c:choose>
                                   	</c:forEach>
                                <c:forEach items="${productOption.selected.variantOptionQualifiers}"
                                           var="buffer" varStatus="status">
                                    <c:choose>
                                        <c:when test="${status.first}">
                                            <li>
                                                <c:choose>
                                                    <c:when test="${buffer.name eq 'Type Value'}">
                                                        <span>${productOption.selected.typeName}:</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span>${buffer.name}:</span>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:if test="${buffer.qualifier eq 'dateAndTime'}">
                                                    <fmt:parseDate value="${buffer.value}"
                                                                   type="both"
                                                                   pattern="EEE MMM dd HH:mm:ss z yyyy" var="time2"
                                                                   parseLocale="en"/>
                                                </c:if>
                                                <c:choose>
                                                    <c:when test="${buffer.qualifier eq 'dateAndTime'}">
                                                        <c:choose>
                                                            <c:when test="${language eq 'zh' }">
                                                                <c:set var="optionValue"><fmt:formatDate
                                                                        value="${time2}"
                                                                        pattern="yyyy年MM月dd日 HH:mm:ss"/></c:set>
                                                            </c:when>
                                                            <c:when test="${language eq 'zh_TW' }">
                                                                <c:set var="optionValue"><fmt:formatDate
                                                                        value="${time2}"
                                                                        pattern="yyyy年MM月dd日 HH:mm:ss"/></c:set>
                                                            </c:when>
                                                            <c:when test="${language eq 'ja'}">
                                                                <c:set var="optionValue"><fmt:formatDate
                                                                        value="${time2}"
                                                                        pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
                                                            </c:when>
                                                            <c:when test="${language eq 'ko'}">
                                                                <c:set var="optionValue"><fmt:formatDate
                                                                        value="${time2}"
                                                                        pattern="yyyy년 MM월 dd일 HH:mm:ss"/></c:set>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="optionValue"><fmt:formatDate
                                                                        value="${time2}"
                                                                        type="both"
                                                                        pattern="d MMM yyyy HH:mm:ss"/></c:set>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <span class="font-SemiBold">${optionValue}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="font-SemiBold">${buffer.value}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <span>${buffer.name}:</span>
                                                <span class="font-SemiBold">${buffer.value}</span>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:if>
                            <li>
                                <span><spring:theme code="text.product.detail.page.variant.quantity"/>:</span>
                                <span class="font-SemiBold">${entry.quantity}</span>
                            </li>
                        </ul>
                        <c:if test="${country eq 'HK' && not empty entry.product.specialProductType && entry.product.specialProductType eq 'ELECTRONIC'}">
                            <div style="font-size: 12px;line-height: 1.0625rem; margin-top: .375rem; color: #525960; margin-top: 15px;">
                                <p class=""><spring:theme code="checkout.step1.ree.text"/> <span class="font-bold"><spring:theme code="checkout.step1.ree.status.${entry.statutoryRemovalService}"/> </span></p>
                                <c:if test="${entry.statutoryRemovalService eq 'TO_BE_DETERMINED'}">
                                    <div style="margin-top: 5px;">
                                        <spring:theme code="checkout.step1.ree.status.TO_BE_DETERMINED.message"/>
                                    </div>
                                </c:if>
                            </div>
                        </c:if>
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>
</div>