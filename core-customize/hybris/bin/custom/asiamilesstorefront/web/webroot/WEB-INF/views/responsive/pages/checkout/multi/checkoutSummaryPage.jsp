<%@ page trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/responsive/common/header" %>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="multi-checkout" tagdir="/WEB-INF/tags/responsive/checkout/multi" %>

<spring:htmlEscape defaultHtmlEscape="true"/>
<template:page pageTitle="${pageTitle}">
    <jsp:attribute name="pageCss">
         <link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
         <link href="/_ui/responsive/aml/css/orderSummary.css" rel="stylesheet">
    </jsp:attribute>
    <jsp:attribute name="pageScripts">
         <script src="/_ui/responsive/aml/js/common.js"></script>
         <script src="/_ui/responsive/aml/js/orderSummary.js"></script>
         <script src="/_ui/responsive/aml/js/applyAllPages.js"></script>
    </jsp:attribute>
    <jsp:body>
        <div class="container order-summary-wrap">
            <div class="summary-info-wrap">
                <h2 class="title font-light"><spring:theme code="text.order.summary.page.title"/></h2>
                <div class="sub-title">
                    <div class="text">
                        <c:choose>
                            <c:when test="${language eq 'zh_TW'}">
                                <p><spring:theme
                                        code="text.order.summary.page.description1"/> ${memberProfile.customerRecord.memberName.givenName}
                                    <spring:theme code="text.order.summary.page.description2"/><strong
                                            class="font-bold">${memberProfile.customerEmailAddressInfo.customerEmailAddressRecord[0].emailAddress}</strong><spring:theme
                                            code="text.order.summary.page.description3"/><a class="link content"
                                                                                            href="javascript:$zopim.livechat.window.show()"><spring:theme
                                            code="text.order.summary.page.description4"/></a>!
                                </p>
                                <p class="small-text font-bold"><spring:theme
                                        code="text.order.summary.page.to.track.this.order1"/><a
                                        class="link" href="/${language}/my-account/orders"><spring:theme
                                        code="text.order.summary.page.to.track.this.order2"/></a>!</p>
                            </c:when>
                            <c:when test="${language eq 'zh'}">
                                <p>${memberProfile.customerRecord.memberName.givenName}
                                    <spring:theme
                                            code="text.order.summary.page.description1"/>
                                    <strong
                                            class="font-bold">${memberProfile.customerEmailAddressInfo.customerEmailAddressRecord[0].emailAddress}</strong><spring:theme
                                            code="text.order.summary.page.description2"/>
                                    <a
                                            class="link content"
                                            href="javascript:$zopim.livechat.window.show()"><spring:theme
                                            code="text.order.summary.page.description3"/></a>!
                                </p>
                                <p class="small-text font-bold"><spring:theme
                                        code="text.order.summary.page.to.track.this.order1"/>
                                    <a class="link" href="/${language}/my-account/orders"><spring:theme
                                            code="text.order.summary.page.to.track.this.order2"/> </a>
                                    <spring:theme code="text.order.summary.page.to.track.this.order3"/></p>
                            </c:when>
                            <c:when test="${language eq 'ja'}">
                                <p>${memberProfile.customerRecord.memberName.givenName}
                                    <spring:theme
                                            code="text.order.summary.page.description1"/>
                                    <strong
                                            class="font-bold">${memberProfile.customerEmailAddressInfo.customerEmailAddressRecord[0].emailAddress}</strong><spring:theme
                                            code="text.order.summary.page.description2"/>
                                    <a
                                            class="link content"
                                            href="javascript:$zopim.livechat.window.show()"><spring:theme
                                            code="text.order.summary.page.description3"/></a>!
                                </p>
                                <p class="small-text font-bold"><spring:theme
                                        code="text.order.summary.page.to.track.this.order1"/>
                                    <a class="link" href="/${language}/my-account/orders"><spring:theme
                                            code="text.order.summary.page.to.track.this.order2"/> </a>
                                    <spring:theme code="text.order.summary.page.to.track.this.order3"/></p>
                            </c:when>
                            <c:when test="${language eq 'ko'}">
                                <p>${memberProfile.customerRecord.memberName.givenName}
                                    <spring:theme
                                            code="text.order.summary.page.description1"/>
                                    <strong
                                            class="font-bold">${memberProfile.customerEmailAddressInfo.customerEmailAddressRecord[0].emailAddress}</strong><spring:theme
                                            code="text.order.summary.page.description2"/>
                                    <a
                                            class="link content"
                                            href="javascript:$zopim.livechat.window.show()"><spring:theme
                                            code="text.order.summary.page.description3"/></a>!
                                </p>
                                <p class="small-text font-bold">
                                    <a class="link" href="/${language}/my-account/orders"><spring:theme
                                            code="text.order.summary.page.to.track.this.order1"/></a>
                                    <spring:theme
                                            code="text.order.summary.page.to.track.this.order2"/></p>
                            </c:when>
                            <c:otherwise>
                                <p><spring:theme code="text.order.summary.page.description1"/>${memberProfile.customerRecord.memberName.givenName}<spring:theme code="text.order.summary.page.description2"/>
                                    <strong class="font-bold">${memberProfile.customerEmailAddressInfo.customerEmailAddressRecord[0].emailAddress}</strong><spring:theme
                                            code="text.order.summary.page.description3"/> <a class="link content" href="javascript:$zopim.livechat.window.show()">chat</a>.
                                </p>
                                <p class="small-text font-bold"><spring:theme
                                        code="text.order.summary.page.to.track.this.order1"/><a
                                        class="link" href="/${language}/my-account/orders"><spring:theme
                                        code="text.order.summary.page.to.track.this.order2"/></a>.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="info-box">
                    <h3 class="info-title font-SemiBold"><spring:theme
                            code="text.order.summary.page.order.detail"/></h3>
                    <div class="detail-desc">
                        <p class="gray-text"><spring:theme code="text.order.summary.page.order.number"/></p>
                        <p class="detail font-SemiBold">${orderData.code }</p>
                        <p class="gray-text"><spring:theme code="text.order.summary.page.order.date"/></p>
                        <p class="detail font-SemiBold">
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
                            </c:choose></p>
                        <p class="gray-text"><spring:theme code="text.order.summary.page.order.total"/></p>
                        <p class="detail font-SemiBold">
                            <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#FACF00"
                                          d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                    <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                    <path fill="#FACF00"
                                          d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                </g>
                            </svg>
                            <fmt:formatNumber value="${orderData.totalPrice.value}" maxFractionDigits="0"/>
                            + ${countryData.currencyIsoCode}&nbsp;<fmt:formatNumber
                                value="${orderData.totalPriceCash.value}" pattern="0.00" maxFractionDigits="2"/>
                        </p>
                    </div>
                </div>
                <c:if test="${orderData.deliveryAddress.needPhysicalDelivery}">
                    <div class="info-box">
                        <h3 class="info-title font-SemiBold"><spring:theme
                                code="text.order.summary.page.order.delivery.details"/></h3>
                        <div class="detail-desc">
                            <div class="delive-contact">
                                <p class="gray-text"><spring:theme code="text.order.summary.page.delivery.contact"/></p>
                                <p class="detail font-SemiBold">
                                    <span>${orderData.deliveryAddress.title}&nbsp;${orderData.deliveryAddress.firstName }&nbsp;${orderData.deliveryAddress.lastName }</span>
                                    <span>${orderData.deliveryAddress.email }</span>
                                    <span>+${orderData.deliveryAddress.phoneAreaCode }&nbsp;${orderData.deliveryAddress.phone }</span>
                                </p>
                            </div>
                            <div class="delivery-address">
                                <c:set var="deliveryAddress" value="${orderData.deliveryAddress}"/>
                                <div class="address english">
                                    <p class="gray-text"><spring:theme
                                            code="text.order.summary.page.delivery.address.english"/></p>
                                    <p class="detail font-SemiBold">
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
                                    </p>

                                </div>
                                <div class="address local-language">
                                    <p class="gray-text"><spring:theme
                                            code="text.order.summary.page.delivery.address.local.language"/></p>
                                    <p class="detail font-SemiBold">
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
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${orderData.deliveryAddress.needEmailDelivery}">
                    <div class="info-box">
                        <h3 class="info-title font-SemiBold"><spring:theme
                                code="text.order.summary.page.delivery.by.email"/></h3>
                        <div class="detail-desc">
                            <p class="gray-text"><spring:theme
                                    code="text.order.summary.page.recipient.email.address"/></p>
                            <p class="detail font-SemiBold">${orderData.deliveryAddress.email }</p>
                        </div>
                    </div>
                </c:if>
                <c:if test="${orderData.deliveryAddress.needSmsDelivery}">
                    <div class="info-box">
                        <h3 class="info-title font-SemiBold"><spring:theme
                                code="text.order.summary.page.delivery.by.sms"/></h3>
                        <div class="detail-desc">
                            <p class="gray-text"><spring:theme
                                    code="text.order.summary.page.recipient.phone.number"/></p>
                            <p class="detail font-SemiBold">
                                +${orderData.deliveryAddress.phoneAreaCode }&nbsp;${orderData.deliveryAddress.phone }</p>
                        </div>
                    </div>
                </c:if>
                <multi-checkout:checkoutOrderDetails abstractOrderData="${orderData}"/>
                <multi-checkout:orderTotals abstractOrderData="${orderData}"/>
                <c:url value="/" var="backtohome"/>
                <a href="${backtohome }" class="button-white font-SemiBold"><spring:theme
                        code="text.order.summary.page.back.to.home"/></a>
            </div>
        </div>
        <template:javaScriptVariables/>
    </jsp:body>

</template:page>
