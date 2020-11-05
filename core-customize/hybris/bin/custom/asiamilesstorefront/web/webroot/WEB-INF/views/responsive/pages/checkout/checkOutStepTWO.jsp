<%@ page trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart"%>
<%@ taglib prefix="checkout" tagdir="/WEB-INF/tags/responsive/checkout"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="header"
	tagdir="/WEB-INF/tags/responsive/common/header"%>
<%@ taglib prefix="footer"
	tagdir="/WEB-INF/tags/responsive/common/footer"%>
<spring:htmlEscape defaultHtmlEscape="true" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Asia Miles iRedeem</title>
	<meta name="viewport"
		content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
	<link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
	<link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
	<link href="/_ui/responsive/aml/css/checkOutStepTwo.css" rel="stylesheet">
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
							<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-location" />
						</svg>
					</div>
					<div class="position-detail">
						<p class="font-regular">Deliver to</p>
						<p class="font-SemiBold">
							Hong Kong <span class="font-regular">(HKD)</span>
							<svg>
								<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown" />
							</svg>
						</p>
					</div>
				</div>
				<div class="header__nav--right__icon--desktop">
					<a href="#" class="icon-header-language"> <span class="font-SemiBold">EN</span>
					</a> <a href="#" class="icon-header-search__desktop"> <svg class="header-icon">
							<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-search" />
						</svg>
					</a> <a href="#" class="icon-header-inactive"> <svg class="header-icon">
							<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-heart" />
						</svg>
					</a> <a href="#" class="icon-header-cart"> <svg class="header-icon">
							<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-cart" />
						</svg>
					</a> <a href="#" class="font-SemiBold icon-header-join"> Join </a> <a href="#"
						class="font-SemiBold icon-header-log"> Log in </a> <a class="header-user">
						<div class="header-user__mes">
							<p class="font-SemiBold">Hi&nbsp;Shelriy</p>
							<svg class="header-user__icon" xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
								<g fill="none" fill-rule="evenodd">
									<path fill="#FACF00"
										d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z" />
									<path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z" />
									<path fill="#FACF00"
										d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z" />
								</g>
							</svg>
							<span class="font-SemiBold">80,857</span>
						</div>
						<div class="header-user__dropDown">
							<svg>
								<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown" />
							</svg>

						</div>
					</a>
				</div>
				<ul class="header__nav--right__icon--mobile">
					<li><svg class="icon-header-search">
							<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-cart-header" />
						</svg></li>
					<li><svg class="icon-header-search">
							<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-menu" />
						</svg></li>
					<li><svg class="icon-header-search">
							<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-profile" />
						</svg></li>
				</ul>
			</div>
		</div>
		<div class="header__search">
			<input type="text" placeholder="Search Bose,Dyson" class="search-input" />
			<div class="search-btn">
				<svg class="search-btn__svg">
					<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-searchMobile" />
				</svg>
			</div>
		</div>
	</div>
	<div class="">
		<div class="checkOut-step-nav--desktop">
			<h1 class="checkOut-step-nav__head font-SemiBold">Check Out</h1>
			<div class="checkOut-step-nav__detail font-bold">
				<div class="checkOut-step-nav__detail--yet ">
					<span> <svg class="nav__icon--tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
						<title>svg/web/tick_small copy 5</title>
						<desc>Created with Sketch.</desc>
						<g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
							<g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
								<g>
									<g transform="translate(17.000000, 308.000000)">
										<g transform="translate(3.000000, 4.000000)">
											<polygon transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
										</g>
									</g>
								</g>
							</g>
						</g>
						</svg>
					</span> <span>Delivery Address</span>
				</div>
				<div class="checkOut-step-nav__detail--ing">
					<span>2</span> <span>Membership Verification</span>
				</div>
				<div class="checkOut-step-nav__detail--un">
					<span>3</span> <span>Payment</span>
				</div>
			</div>
		</div>

		<div class="checkOut-step-nav--mobile J-step-two-show"
			data-url="/_ui/responsive/aml/html/layout/checkOutStepTwoNav.html">
			<div class="checkOut-step-nav--mobile__cur">
				<span class="font-regular">2/3</span> <span class="font-bold font-letter-spacing">Membership
					Verification</span> <span> <svg class="checkOut-nav__icon">
						<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown" />
					</svg>
				</span>
			</div>
		</div>
	</div>
	<div class="container step-two">
		<p class="step-two__title">Asia Miles Membership Verification</p>
		<div class="step-two__topWarn J-warning-box">
			<div>
				<svg class="icon-warning">
					<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-small-warning" />
				</svg>
				<p class="J-error-message">Sorry, you have exceeded the maximum
					number of failed attempts, please click “Resend SMS” to get a new
					verification code.</p>
			</div>
		</div>
		<div class="step-two__content">
			<p>The verification code was sent to (+852) 9000 9999.</p>
			<p>
				You could request again in <span class="font-SemiBold J-count-down">1:20</span>.
			</p>
			<p class="J-count-again">If you cannot receive verification code,
				request again:</p>
			<div class="step-two__content__sendBtn J-send-btn" tabindex="0">
				<div>
					<svg class="icon-sendMes" xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30">
						<g fill="#000000" fill-rule="nonzero">
							<path
								d="M8.714 21.233H23.33c1.569 0 2.69-.901 2.69-2.248V7.249C26.02 6.009 25.01 5 23.772 5H5.25C4.01 5 3 6.01 3 7.249v17.284c0 .89 1.077 1.337 1.707.707l4.007-4.007zM5 22.118V7.248C5 7.115 5.114 7 5.25 7h18.522c.134 0 .249.114.249.249v11.736c0 .049-.01.07-.05.102-.102.083-.313.146-.64.146H8.3a1 1 0 0 0-.707.293L5 22.118z" />
							<path
								d="M7.54 12.32v-2h13.313v2H7.54zm0-2h13.313v2H7.54v-2zM7.54 15.88v-2h13.313v2H7.54zm0-2h13.313v2H7.54v-2z" />
						</g>
					</svg>
					<span class="font-SemiBold">Resend SMS</span>
				</div>
			</div>
			<div class="step-two__content__sendBtn--disabled J-send-disBtn">
				<div>
					<svg class="icon-sendMes" xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30">
						<g fill="#A9ACAF" fill-rule="nonzero">
							<path d="M8.714 21.233H23.33c1.569 0 2.69-.901 2.69-2.248V7.249C26.02 6.009 25.01 5 23.772 5H5.25C4.01 5 3 6.01 3 7.249v17.284c0 .89 1.077 1.337 1.707.707l4.007-4.007zM5 22.118V7.248C5 7.115 5.114 7 5.25 7h18.522c.134 0 .249.114.249.249v11.736c0 .049-.01.07-.05.102-.102.083-.313.146-.64.146H8.3a1 1 0 0 0-.707.293L5 22.118z"/>
							<path d="M7.54 12.32v-2h13.313v2H7.54zm0-2h13.313v2H7.54v-2zM7.54 15.88v-2h13.313v2H7.54zm0-2h13.313v2H7.54v-2z"/>
						</g>
					</svg>
					<span class="font-SemiBold">Resend SMS</span>
				</div>
			</div>
		</div>
		<div class="step-two__submit">
			<div class="step-two__submit--code">
				<div class="input-component J-input-transform">
					<input type="text" id="code" class="J-code" /> <label class=" placeholder J-input-placeholder"
						for="code">Verification
						code</label>
					<p>
						<svg class="icon-warning">
							<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
						</svg>
						<span class="J-error-code">Sorry, your verification code is
							incorrect, please try again.</span>
					</p>
				</div>
			</div>
			<div class="J-verification half" data-url="/www.baiDu.com" tabindex="0">
				<button class="button-yellow font-SemiBold">Verify and
					Place Order</button>
			</div>
			<div class="J-backHome half disappear">
				<button class="button-yellow font-SemiBold">Back to home</button>
			</div>

		</div>
	</div>


	<!-- <div class="J-overlayout"></div>
	<div class="J-share-bar-overLayout"></div> -->
	<!-- <script async="" src="https://www.youtube.com/iframe_api"></script> -->

	<script src="/_ui/responsive/aml/js/common.js"></script>

	<script src="/_ui/responsive/aml/js/checkOutStepTwo.js"></script>
	<script src="/_ui/responsive/aml/js/applyAllPages.js"></script>


</body>

</html>