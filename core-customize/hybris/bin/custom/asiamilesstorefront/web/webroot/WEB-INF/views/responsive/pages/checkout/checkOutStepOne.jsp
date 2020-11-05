<%@ page trimDirectiveWhitespaces="true" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="checkout" tagdir="/WEB-INF/tags/responsive/checkout" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="header"
           tagdir="/WEB-INF/tags/responsive/common/header" %>
<%@ taglib prefix="footer"
           tagdir="/WEB-INF/tags/responsive/common/footer" %>
<spring:htmlEscape defaultHtmlEscape="true"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Asia Miles iRedeem</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
    <link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
    <link href="/_ui/responsive/aml/css/checkOutStepOne.css"
          rel="stylesheet">
</head>
<body>
<div class="header">
    <div class="container header__nav">
        <div class="header__nav--left">
            <div class="header__nav--left__icon">LOGO</div>
        </div>
        <div class="header__nav--right">
            <div class="header__nav--right__position" tabindex="0">
                <div class="position-img">
                    <svg class="header-icon">
                        <use
                                xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-location"/>
                    </svg>
                </div>
                <div class="position-detail">
                    <p class="font-regular">Deliver to</p>
                    <p>${DeliveryInfo.baseInfo.deliveryArea}
                        <span>(${DeliveryInfo.baseInfo.areaAlias})</span>
                        <svg>
                            <use
                                    xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown"/>
                        </svg>
                    </p>
                </div>
            </div>
            <div class="header__nav--right__icon--desktop">
                <a href="#" class="icon-header-language"> <span
                        class="font-SemiBold">EN</span>
                </a> <a href="#" class="icon-header-search__desktop">
                <svg
                        class="header-icon">
                    <use
                            xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-search"/>
                </svg>
            </a> <a href="#" class="icon-header-inactive">
                <svg
                        class="header-icon">
                    <use
                            xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-heart"/>
                </svg>
            </a> <a href="#" class="icon-header-cart">
                <svg class="header-icon">
                    <use
                            xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-cart"/>
                </svg>
            </a> <a href="#" class="font-SemiBold icon-header-join">Join</a> <a
                    href="#" class="font-SemiBold icon-header-log">Log in</a> <a
                    class="header-user">
                <div class="header-user__mes">
                    <div>${DeliveryInfo.baseInfo.userName}</div>
                    <svg class="header-user__icon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                        <g fill="none" fill-rule="evenodd">
                            <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                            <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                            <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                        </g>
                    </svg>
                    <span> ${DeliveryInfo.baseInfo.restMiles}</span>
                </div>
                <div class="header-user__dropDown">
                    <svg>
                        <use
                                xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown"/>
                    </svg>
                </div>
            </a>
            </div>
            <ul class="header__nav--right__icon--mobile">
                <li>
                    <svg class="icon-header-search">
                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-cart-header"/>
                    </svg>
                </li>
                <li>
                    <svg class="icon-header-search">
                        <use
                                xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-menu"/>
                    </svg>
                </li>
                <li>
                    <svg class="icon-header-search">
                        <use
                                xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-profile"/>
                    </svg>
                </li>
            </ul>
        </div>
    </div>
    <div class="header__search">
        <input type="text" placeholder="Search Bose,Dyson"
               class="search-input"/>
        <div class="search-btn">
            <svg class="search-btn__svg">
                <use
                        xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-searchMobile"/>
            </svg>
        </div>
    </div>
</div>
<div class="checkOut-step-nav">
    <div class="checkOut-step-nav--desktop">
        <h1 class="checkOut-step-nav__head font-SemiBold">Check Out</h1>
        <div class="checkOut-step-nav__detail font-bold">
            <div class="checkOut-step-nav__detail--ing ">
                <span>1</span> <span>Delivery Address</span>
            </div>
            <div class="checkOut-step-nav__detail--un ">
                <span>2</span> <span>Membership Verification</span>
            </div>
            <div class="checkOut-step-nav__detail--un">
                <span>3</span> <span>Payment</span>
            </div>
        </div>
    </div>

    <div class="checkOut-step-nav--mobile J-checkOut-step"
         data-url="/_ui/responsive/aml/html/layout/checkOutStepOneNav.html">
        <div class="checkOut-step-nav--mobile__cur">
            <span class="font-regular">1/3</span> <span class="font-bold font-letter-spacing">Delivery
					Address</span> <span> <svg class="checkOut-nav__icon">
						<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown"/>
					</svg>
				</span>
        </div>
    </div>
</div>
<div class="container step-one">
    <form action="/CheckOutConfirm/save" id="deliveryInfo" method="post">
        <input type="hidden" name="CSRFToken"
               value="${ycommerce:encodeJavaScript(CSRFToken.token)}"/>
        <div class="row step-one__deliver">
            <div class="step-one__deliver--left">
                <span class="font-regular">Where are you delivering to?</span>
            </div>
            <div class="step-one__deliver--right">
                <div class="radio-group">
                    <div class="radio-group__item J-radio-item selected">
                        <input name="deliverTo" type="radio" value="mySelf"
                               checked="checked" class="select-circle" tabindex="0"/> <span>Myself</span>
                    </div>
                    <div class="radio-group__item J-radio-item">
                        <input name="deliverTo" type="radio" value="other"
                               class="select-circle" tabindex="0"/> <span>Other</span>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="CSRFToken"
               value="${ycommerce:encodeJavaScript(CSRFToken.token)}"/>
        <div class="step-one__mySelf">
            <checkout:recipient recipientInfo="${DeliveryInfo.recipientInfo}"/>
            <checkout:enAddress
                    physicalDeliveryInfo="${DeliveryInfo.physicalDeliveryInfo}"/>
            <checkout:localAddress/>
            <checkout:emailDeliveryInfo
                    emailDeliveryInfo="${DeliveryInfo.emailDeliveryInfo}"/>
            <checkout:smsDeliveryInfo
                    smsDeliveryInfo="${DeliveryInfo.smsDeliveryInfo}"/>
        </div>
        <div class="step-one__other" action="/deliveryInfo/save">
            <checkout:recipient recipientInfo="${DeliveryInfo.recipientInfo}"/>
            <checkout:enAddress
                    physicalDeliveryInfo="${DeliveryInfo.physicalDeliveryInfo}"/>
            <checkout:localAddress/>
            <checkout:emailDeliveryInfo
                    emailDeliveryInfo="${DeliveryInfo.emailDeliveryInfo}"/>
            <checkout:smsDeliveryInfo
                    smsDeliveryInfo="${DeliveryInfo.smsDeliveryInfo}"/>
        </div>
    </form>
</div>
<checkout:orderDetails cartInfo="${DeliveryInfo.cartInfo}"/>
<div class="container">
    <div class="confirm__email">
        A confirmation email will be sent to you email <span
            class="font-SemiBold">"${DeliveryInfo.baseInfo.emailAddress}"</span>
        <div class="col-lg-6 col-sm-12" style="padding: 0px; display: none">
            <div class="input-component">
                <input type="text" id="confirm-email"/> <label
                    class=" placeholder" for="confirm-email">Email address</label>
                <p>
                    <svg class="icon-warning">
                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning"/>
                    </svg>
                    <span>Please enter your family name</span>
                </p>
            </div>
        </div>
    </div>
    <div class="total-mes">
        <div class="total-mes__price">
            <p class="font-SemiBold total-mes__price--left">Total</p>
            <div class="total-mes__price--right">
                <p class="total-mes__price--right__money">
                    <svg class="icon-price__one">
                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num"/>
                    </svg>
                    <span>${DeliveryInfo.cartInfo.milesCashProportion}</span>
                </p>
                <p>
                    +${DeliveryInfo.cartInfo.totalPrice.currencyIso}${DeliveryInfo.cartInfo.totalPrice.formattedValue}</p>
                <p class="total-mes__price--right__discount">
                    <span class="font-SemiBold">Total Discounts</span>
                    <svg class="icon-price__two">
                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num"/>
                    </svg>
                    <span>${DeliveryInfo.cartInfo.totalDiscounts.formattedValue}</span>
                </p>
            </div>
        </div>
        <div class="total-mes__check">
            <p>For security reasons,a one time password(OTP)is required and
                will be sent to your registered mobile number.Click the button
                below when you are ready to receive your OTP.</p>
            <button class="total-mes__check--btn font-SemiBold J-save-address"
                    data-url="/checkout/save">Verify membership1
            </button>
            <a href="/checkout/checkOutStepTWO">next</a>
        </div>
    </div>
</div>

<!-- <div class="J-overlayout"></div>
<div class="J-share-bar-overLayout"></div> -->
<!--<script async=""src="https://www.youtube.com/iframe_api"></script>-->

<script
        src="/_ui/responsive/aml/js/common_79dfa5fcde613be39a4316483d11a4fc.js"></script>

<script src="/_ui/responsive/aml/js/checkOutStepOne.js"></script>
<script src="/_ui/responsive/aml/js/checkOutStepOnePlugin.js"></script>
<script type="text/javascript">
    var $addToCartbtn = $('.J-save-address');
    $addToCartbtn
        .on(
            'click',
            function () {
                var $deliverTo = $(
                    'input:radio[name="deliverTo"]:checked')
                    .val();
                console.log($deliverTo);

                var $recipientInfo = new Object();
                $recipientInfo.familyName = $('#familyName').val();
                $recipientInfo.givenName = $('#givenName').val();
                $recipientInfo.countryCode = $('#countryCode').attr("value");
                $recipientInfo.phoneNo = $('#phoneNo').val();
                console.log($recipientInfo);

                var $physicalDeliveryInfo = new Object();
                $physicalDeliveryInfo.country = $('#country').val();
                $physicalDeliveryInfo.companyName = $('#companyName').val();
                $physicalDeliveryInfo.enAddress1 = $('#enAddress1').val();
                $physicalDeliveryInfo.enAddress2 = $('#enAddress2').val();
                $physicalDeliveryInfo.enAddress3 = $('#enAddress3').val();
                $physicalDeliveryInfo.enCity = $('#enCity').val();
                $physicalDeliveryInfo.enState = $('#enState').val();
                $physicalDeliveryInfo.enPostalCode = $('#enPostalCode').val();
                $physicalDeliveryInfo.localAddress1 = $('#localAddress1').val();
                $physicalDeliveryInfo.localAddress2 = $('#localAddress2').val();
                $physicalDeliveryInfo.localAddress3 = $('#localAddress3').val();
                $physicalDeliveryInfo.localCity = $('#localCity').val();
                $physicalDeliveryInfo.localState = $('#localState').val();
                $physicalDeliveryInfo.localPostalCode = $('#localPostalCode').val();
                console.log($physicalDeliveryInfo);

                var $localAddressExit = $('#localAddressExit')[0].checked;
                console.log($localAddressExit);

                var $emailDeliveryInfo = new Object();
                $emailDeliveryInfo.needEmailDelivery = $('#needEmailDelivery').val();
                $emailDeliveryInfo.emailAddress = $('#email').val();
                console.log($emailDeliveryInfo);

                var $smsDeliveryInfo = new Object();
                $smsDeliveryInfo.countryCode = $('#sms-countryCode')[0]
                    .getAttribute("value");
                $smsDeliveryInfo.phoneNo = $('#sms-phoneNo').val();
                $smsDeliveryInfo.needSmsDeliveryInfo = $('#sms-needSmsDeliveryInfo').val();
                console.log($smsDeliveryInfo);

                var $this = $(this), url = $this.data('url');

                var $param = new Object();
                $param.deliverTo = $deliverTo;
                $param.recipientInfo = $recipientInfo;
                $param.physicalDeliveryInfo = $physicalDeliveryInfo;
                $param.localAddressExit = $localAddressExit;
                $param.emailDeliveryInfo = $emailDeliveryInfo;
                $param.smsDeliveryInfo = $smsDeliveryInfo;

                var $paramJson = JSON.stringify($param);
                var $recipientInfo = JSON.stringify($recipientInfo);

                var $buffer = new Object();
                $.ajax({
                    url: url,
                    type: 'post',
                    data: {
                        deliverTo: $deliverTo,
                        "recipientInfo.familyName": $('#familyName').val(),
                        //givenName : $('#givenName').val(),
                        //countryCode : $('#countryCode').attr("value"),
                        //phoneNo : $('#phoneNo').val(),
                        //deliveryInfoRequest:&param,
                        //"recipientInfo":$recipientInfo,
                        CSRFToken: $('#CSRFToken').val()
                    },
                    dataType: 'json',
                    async: true,
                    success: function success() {
                        _showMiniCart();
                        _hideMiniCart();
                    },
                    error: function error(data) {
                        $errorMsg.text(data.errorMsg);
                    }
                });
            });
</script>
</body>
</html>
