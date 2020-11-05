<%@ page trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/responsive/common/header" %>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<template:page pageTitle="${pageTitle}">
    <jsp:attribute name="pageCss">
        <link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
        <link href="/_ui/responsive/aml/css/checkOutStepTwo.css" rel="stylesheet">
    </jsp:attribute>
    <jsp:attribute name="pageScripts">
        <script src="/_ui/responsive/aml/js/common.js"></script>
        <script src="/_ui/responsive/aml/js/checkOutStepTwo.js"></script>
        <script src="/_ui/responsive/aml/js/applyAllPages.js"></script>
    </jsp:attribute>

    <jsp:body>
        <div class="">
            <div class="checkOut-step-nav--desktop">
                <h1 class="checkOut-step-nav__head font-SemiBold">
                    <spring:theme code="text.checkout.page.title" />
                </h1>
                <div class="checkOut-step-nav__detail font-bold">
                    <div class="checkOut-step-nav__detail--yet ">
                        <span>
                            <svg class="nav__icon--tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <title>svg/web/tick_small copy 5</title>
                                <desc>Created with Sketch.</desc>
                                <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                                    <g transform="translate(-20.000000, -315.000000)"
                                        fill="#ffffff" fill-rule="nonzero">
                                        <g>
                                            <g transform="translate(17.000000, 308.000000)">
                                                <g transform="translate(3.000000, 4.000000)">
                                                    <polygon
                                                        transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) "
                                                        points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467">
                                                    </polygon>
                                                </g>
                                            </g>
                                        </g>
                                    </g>
                                </g>
                            </svg>
                        </span>
                        <span>
                            <spring:theme code="text.checkout.page.title.delivery.address.title" /> </span>
                    </div>
                    <div class="checkOut-step-nav__detail--ing">
                        <span>2</span>
                        <span>
                            <spring:theme code="text.checkout.page.title.membership.verification" /> </span>
                    </div>
                    <div class="checkOut-step-nav__detail--un">
                        <span>3</span>
                        <span>
                            <spring:theme code="text.checkout.page.title.payment" /></span>
                    </div>
                </div>
            </div>

            <div class="checkOut-step-nav--mobile J-step-two-show"
                data-url="/_ui/responsive/aml/html/layout/checkOutStepTwoNav.html">
                <div class="checkOut-step-nav--mobile__cur">
                    <span class="font-regular">2/3</span>
                    <span class="font-bold font-letter-spacing">
                        <spring:theme code="text.checkout.page.title.membership.verification" /></span>
                    <span>
                        <svg class="checkOut-nav__icon">
                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown" />
                        </svg>
                    </span>
                </div>
            </div>
            <div class="J-nav-popup-mobile" style="display:none">
                <div class="checkOut-step-nav-mobileBox">
                    <svg class="icon-step-close J-close-tooltip" tabindex="0">
                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-close"/>
                    </svg>
                    <div class="checkOut-step-nav__detail font-bold">
                        <div class="checkOut-step-nav__detail--yet ">
                            <span>
                                <svg class="nav__icon--tick">
                                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-tick-white"/>
                                </svg>
                            </span>
                            <span><spring:theme code="asiamiles.check.out.stype.nav.delivery"/></span>
                        </div>
                        <div class="checkOut-step-nav__detail--ing">
                            <span>2</span>
                            <span><spring:theme code="asiamiles.check.out.stype.nav.membership"/></span>
                        </div>
                        <div class="checkOut-step-nav__detail--un">
                            <span>3</span>
                            <span><spring:theme code="asiamiles.check.out.stype.nav.payment"/></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container step-two">
            <p class="step-two__title">
                <spring:theme code="checkout.step2.otp" />
            </p>
            <div class="step-two__topWarn J-warning-box">
                <div>
                    <svg class="icon-warning">
                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-small-warning" />
                    </svg>
                    <input type="hidden" id="errorMessage1" value="${errorTime}" />
                    <input type="hidden" id="errorMessage2" value="${errorTime2 }" />
                    <input type="hidden" id="errorMessage3" value="${errorTime3 }" />
                    <input type="hidden" id="errorCode" value="${errorCode}" />
                    <p class="J-error-message1">
                        <spring:theme code="checkout.step2.otp.validation.error.time" />
                    </p>
                    <p class="J-error-message2">
                        <spring:theme code="checkout.step2.otp.validation.error.time2" />
                    </p>
                    <p class="J-error-message3">
                        <spring:theme code="checkout.step2.otp.validation.error.time3" />
                    </p>
                </div>
            </div>

            <div class="step-two__content">
                <p>
                    <spring:theme code="checkout.step2.otp.send.pre.1" />&nbsp;${mobile }
                    <spring:theme code="checkout.step2.otp.send.pre.2" />
                </p>
                <p class="J-count-num">
                    <spring:theme code="checkout.step2.otp.send.middle.1" /> <span
                        class="font-SemiBold J-count-down">${reSendCountDown}</span>.
                    <spring:theme code="checkout.step2.otp.send.middle.2" />
                    <spring:theme code="checkout.step2.otp.send.middle.3" />
                </p>
                <p class="J-count-again">
                    <spring:theme code="checkout.step2.otp.send.suffix" />
                </p>
                <div class="step-two__content__sendBtn J-send-btn content" data-url="/checkout/multi/payment-method/resend"
                    tabindex="0">
                    <div>
                        <svg class="icon-sendMes" xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                            viewBox="0 0 30 30">
                            <g fill="#000000" fill-rule="nonzero">
                                <path
                                    d="M8.714 21.233H23.33c1.569 0 2.69-.901 2.69-2.248V7.249C26.02 6.009 25.01 5 23.772 5H5.25C4.01 5 3 6.01 3 7.249v17.284c0 .89 1.077 1.337 1.707.707l4.007-4.007zM5 22.118V7.248C5 7.115 5.114 7 5.25 7h18.522c.134 0 .249.114.249.249v11.736c0 .049-.01.07-.05.102-.102.083-.313.146-.64.146H8.3a1 1 0 0 0-.707.293L5 22.118z" />
                                <path
                                    d="M7.54 12.32v-2h13.313v2H7.54zm0-2h13.313v2H7.54v-2zM7.54 15.88v-2h13.313v2H7.54zm0-2h13.313v2H7.54v-2z" />
                            </g>
                        </svg>
                        <span class="font-SemiBold">
                            <spring:theme code="checkout.step2.otp.resend" /></span>
                    </div>
                </div>
                <div class="step-two__content__sendBtn--disabled J-send-disBtn">
                    <div>
                        <svg class="icon-sendMes" xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                            viewBox="0 0 30 30">
                            <g fill="#A9ACAF" fill-rule="nonzero">
                                <path
                                    d="M8.714 21.233H23.33c1.569 0 2.69-.901 2.69-2.248V7.249C26.02 6.009 25.01 5 23.772 5H5.25C4.01 5 3 6.01 3 7.249v17.284c0 .89 1.077 1.337 1.707.707l4.007-4.007zM5 22.118V7.248C5 7.115 5.114 7 5.25 7h18.522c.134 0 .249.114.249.249v11.736c0 .049-.01.07-.05.102-.102.083-.313.146-.64.146H8.3a1 1 0 0 0-.707.293L5 22.118z" />
                                <path
                                    d="M7.54 12.32v-2h13.313v2H7.54zm0-2h13.313v2H7.54v-2zM7.54 15.88v-2h13.313v2H7.54zm0-2h13.313v2H7.54v-2z" />
                            </g>
                        </svg>
                        <span class="font-SemiBold">
                            <spring:theme code="checkout.step2.otp.resend" /></span>
                    </div>
                </div>
            </div>
            <div class="step-two__submit">
                <div class="step-two__submit--code">
                    <div class="input-component J-input-transform">
                        <input type="text" id="code" name="smsCode" class="J-code" />
                        <label class=" placeholder J-input-placeholder" for="code">
                            <spring:theme code="checkout.step2.otp.code.placeholder" /></label>
                        <div class="errorBox J-error-code">
                            <div class="errorMes">
                                <svg class="icon-warning">
                                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                                </svg>
                                <span class="font-SemiBold">
                                    <spring:theme code="checkout.step2.otp.validation.error.code" /></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="J-verification half" tabindex="0">
                    <button class="button-yellow font-SemiBold">
                        <spring:theme code="checkout.step2.otp.code.result.next" /></button>
                </div>
                <div class="J-backHome half disappear">
                    <button class="button-yellow font-SemiBold">
                        <spring:theme code="checkout.step2.otp.code.result.back" /></button>
                </div>

            </div>

            <div class="disappear">
                <input id="paymentProcess" value="false" type="hidden" />
                <div id="paymentFormDiv"></div>
            </div>
        </div>
        <template:javaScriptVariables />
    </jsp:body>

</template:page>