<%@ tag body-content="empty" trimDirectiveWhitespaces="true"
        pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="storepickup"
           tagdir="/WEB-INF/tags/responsive/storepickup" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>

<%@ attribute name="cartInfo" required="true"
              type="de.hybris.platform.commercefacades.order.data.CartData" %>


<div class="order-details">
    <div class="container order-details__content">
        <p class="order-details__title font-regular J-detail">
            <spring:theme code="asiamiles.check.out.stype.nav.order.details"/>
            <svg class="icon-expand J-detail-icon" aria-label='Arrow button-Order Details-Clickable' tabindex="0" xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                    <path d="M15 0v8.414H0V0z"/>
                    <path fill="#272F38"
                          d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
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
                                                             format="cartIcon"/>
                            </div>
                        </div>
                        <div class="order-detail__mes--text">
                            <p class="font-bold">${fn:escapeXml(entry.product.brandName)}</p>
                            <p class="font-regular">${fn:escapeXml(entry.product.name)}</p>
                            <ul class="order-detail__mes--text__size" id="orderDetail" id="optionList"
                                name="optionList">
                                <c:if test="${not empty entry.product.baseOptions}">
                                    <c:forEach items="${entry.product.baseOptions}" var="option">
                                   		 <c:choose>
                                                <c:when test="${option.selected.code eq entry.product.code}">
                                                   <c:set var="productOption" value="${option}"/>
                                                </c:when>
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
                                    <span class="font-regular"><spring:theme code="text.order.detail.page.one.order.quantity"/> :</span>
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
            </div>
        </c:forEach>
    </div>
</div>
