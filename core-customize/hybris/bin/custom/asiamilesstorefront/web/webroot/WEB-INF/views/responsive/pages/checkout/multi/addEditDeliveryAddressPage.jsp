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
<%@ taglib prefix="header"
           tagdir="/WEB-INF/tags/responsive/common/header" %>
<%@ taglib prefix="footer"
           tagdir="/WEB-INF/tags/responsive/common/footer" %>
<%@ taglib prefix="checkout" tagdir="/WEB-INF/tags/responsive/checkout" %>


<template:page pageTitle="${pageTitle}">

    <jsp:attribute name="pageCss">
    <link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
    <link href="/_ui/responsive/aml/css/checkOutStepOne.css"
          rel="stylesheet">
	</jsp:attribute>

    <jsp:attribute name="pageScripts">
    <script src="/_ui/responsive/aml/js/common.js"></script>
    <script src="/_ui/responsive/aml/js/checkOutStepOne.js"></script>
    <script src="/_ui/responsive/aml/js/checkOutStepOnePlugin.js"></script>
    <script src="/_ui/responsive/aml/js/applyAllPages.js"></script>
	</jsp:attribute>

    <jsp:body>
        <div class="checkOut-step-nav">
            <div class="checkOut-step-nav--desktop">
                <h1 class="checkOut-step-nav__head font-SemiBold"><spring:theme
                        code="asiamiles.check.out.stype.nav.page"/></h1>
                <div class="checkOut-step-nav__detail font-bold">
                    <div class="checkOut-step-nav__detail--ing ">
                        <span>1</span> <span><spring:theme code="asiamiles.check.out.stype.nav.delivery"/></span>
                    </div>
                    <div class="checkOut-step-nav__detail--un ">
                        <span>2</span> <span><spring:theme code="asiamiles.check.out.stype.nav.membership"/></span>
                    </div>
                    <div class="checkOut-step-nav__detail--un">
                        <span>3</span> <span><spring:theme code="asiamiles.check.out.stype.nav.payment"/></span>
                    </div>
                </div>
            </div>

            <div class="checkOut-step-nav--mobile J-step-one-show"
                 data-url="/_ui/responsive/aml/html/layout/checkOutStepOneNav.html">
                <div class="checkOut-step-nav--mobile__cur">
                    <span>1/3</span>
                    <span class="font-bold font-letter-spacing"><spring:theme
                            code="asiamiles.check.out.stype.nav.delivery"/> </span>
                    <span>
					<svg class="checkOut-nav__icon">
                   <use
                           xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown"/>
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
                        <div class="checkOut-step-nav__detail--ing ">
                            <span>1</span>
                            <span><spring:theme code="asiamiles.check.out.stype.nav.delivery"/></span>
                        </div>
                        <div class="checkOut-step-nav__detail--un ">
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
        <c:if test="${true eq isShowDeliveryAlertMsg}">
            <div class="container checkoutStep1Page-error-message clearfix">
                <!-- top alert message -->
                <div class="checkoutStep1Page-alert">
                    <svg class="icon-triangle-important">
                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-triangle-important"></use>
                    </svg>
                    <span class="error-text"><spring:theme code="text.checkout.step.one.page.delivery.country.general.message1"/><a href="https://lifestyle.asiamiles.com/"><spring:theme code="text.checkout.step.one.page.delivery.country.general.message2"/> </a><spring:theme code="text.checkout.step.one.page.delivery.country.general.message3"/></span>
                </div>
                <!-- /top alert message -->
            </div>
        </c:if>

        <input id="formType" hidden=true value=${DeliveryInfo.recipientType}>
        <div class="step-one">
            <div class="step-one__deliver">
                <div class="step-one__deliver--left">
                    <span><spring:theme code="asiamiles.check.out.stype.nav.who.are.you.delivery"/></span>
                </div>
                <div class="row step-one__deliver--right">
                    <div class="col-sm-12 radio-group">
                        <div class="radio-group__item J-radio-item selected">
                            <div class="select-circle content" tabindex="0" aria-label="Where are you delivering to: <spring:theme
                            code='asiamiles.check.out.stype.nav.myself'/> radio button selected.">
                                <div></div>
                            </div>
                            <span class="font-SemiBold"><spring:theme
                                    code="asiamiles.check.out.stype.nav.myself"/></span>
                        </div>
                        <div class="radio-group__item J-radio-item">
                            <div class="select-circle" tabindex="0" aria-label="Where are you delivering to: <spring:theme
                            code='asiamiles.check.out.stype.nav.someone'/> radio button unselected.">
                                <div></div>
                            </div>
                            <span class="font-SemiBold"><spring:theme
                                    code="asiamiles.check.out.stype.nav.someone"/></span>
                        </div>
                    </div>
                </div>
            </div>
            <form class="step-one__mySelf" id="mySelf" action="add" method="post">
                <input class="validationResult" type="hidden"
                       - value='${DeliveryInfo.validationResultString}'/>
                <input type="hidden" name="CSRFToken"
                       value="${ycommerce:encodeJavaScript(CSRFToken.token)}"/>
                <checkout:selfRecipient recipientInfo="${DeliveryInfo.recipientInfo}"
                                        phoneCountryCode="${DeliveryInfo.countryDataList}"/>
                <checkout:selfAddress
                        physicalDeliveryInfo="${DeliveryInfo.physicalDeliveryInfo}"/>
                <checkout:selfEmailDeliveryInfo
                        emailDeliveryInfo="${DeliveryInfo.emailDeliveryInfo}"/>
                <checkout:selfSmsDeliveryInfo
                        smsDeliveryInfo="${DeliveryInfo.smsDeliveryInfo}"
                        phoneCountryCode="${DeliveryInfo.countryDataList}"/>
                <checkout:orderDetails cartInfo="${DeliveryInfo.cartInfo}"/>
                <checkout:confirmEmail baseInfo="${DeliveryInfo.baseInfo}"/>
                <checkout:total cartInfo="${DeliveryInfo.cartInfo}"/>
            </form>
            <form class="step-one__other" id="other" action="add" method="post">
                <input class="validationResult" type="hidden"
                       - value='${DeliveryInfo.validationResultString}'/>
                <input type="hidden" name="CSRFToken"
                       value="${ycommerce:encodeJavaScript(CSRFToken.token)}"/>
                <checkout:otherRecipient
                        recipientInfo="${DeliveryInfo.otherRecipientInfo}"
                        phoneCountryCode="${DeliveryInfo.countryDataList}"/>
                <checkout:otherAddress
                        physicalDeliveryInfo="${DeliveryInfo.otherPhysicalDeliveryInfo}"/>
                <checkout:otherEmailDeliveryInfo
                        emailDeliveryInfo="${DeliveryInfo.otherEmailDeliveryInfo}"/>
                <checkout:otherSmsDeliveryInfo
                        smsDeliveryInfo="${DeliveryInfo.otherSmsDeliveryInfo}"
                        phoneCountryCode="${DeliveryInfo.countryDataList}"/>
                <checkout:orderDetails cartInfo="${DeliveryInfo.cartInfo}"/>
                <checkout:confirmEmail baseInfo="${DeliveryInfo.baseInfo}"/>
                <checkout:total cartInfo="${DeliveryInfo.cartInfo}"/>
            </form>
        </div>
        <template:javaScriptVariables/>
    </jsp:body>

</template:page>