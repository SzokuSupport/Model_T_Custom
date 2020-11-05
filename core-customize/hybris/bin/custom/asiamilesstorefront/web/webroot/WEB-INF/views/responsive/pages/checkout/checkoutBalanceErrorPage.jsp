<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/responsive/formElement" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<template:page pageTitle="${pageTitle}">
    <link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
    <link href="/_ui/responsive/aml/css/orderSummaryFail.css" rel="stylesheet">
    <div class="order-summary-fail">
        <div class="order-summary-fail__content">
            <div class="order-summary-fail__content--detail">
                <div class="background">
                    <h2 class="title font-SemiBold">
                        <spring:theme code="text.miles.error.page.title"/>
                    </h2>
                    <!-- <svg class="icon-order-fail">
                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-order-fail"></use>
                    </svg> -->
                    <img class="icon-order-fail" alt="" src="/_ui/responsive/aml/img/order-error.gif"/>
                </div>
                <div class="error">

                    <p class="error__message--two">
                        <spring:theme code="text.miles.error.page.description"/></p>

                    <div class="enough">
                        <div class="enough__required">
                            <p class="font-SemiBold">
                                <spring:theme code="text.miles.error.page.miles.required"/>
                            </p>
                            <div class="enough__number--icon">
                                <svg class="icon-money" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                                    <g fill="none" fill-rule="evenodd">
                                        <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                        <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                        <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                    </g>
                                </svg>
                                <span class="font-SemiBold">
                                        <fmt:formatNumber value="${require}" maxFractionDigits="3"/>
                                    </span>
                            </div>
                        </div>
                        <div class="enough__operation">
                            <span></span>
                        </div>
                        <div class="enough__balance bottom">
                            <p class="font-SemiBold">
                                <spring:theme code="text.miles.error.page.miles.balance"/></p>
                            <div class="enough__number--icon">
                                <svg class="icon-money" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                                    <g fill="none" fill-rule="evenodd">
                                        <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                        <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                        <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                    </g>
                                </svg>
                                <span class="font-SemiBold ">
                                        <fmt:formatNumber value="${available}" maxFractionDigits="3"/>
                                    </span>
                            </div>
                            <span class="font-SemiBold minus"></span>
                        </div>
                        <div class="enough__operation--equal">
                            <span></span>
                            <span></span>
                        </div>
                        <div class="enough__still">
                            <p class="font-SemiBold">
                                <spring:theme code="text.miles.error.page.still.require"/>
                            </p>
                            <div class="enough__number--icon">
                                <svg class="icon-money" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                                    <g fill="none" fill-rule="evenodd">
                                        <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                        <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                        <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                    </g>
                                </svg>
                                <span class="font-SemiBold">
                                        <fmt:formatNumber value="${need}" maxFractionDigits="3"/>
                                    </span>
                            </div>
                        </div>
                    </div>

                    <div class="line-btn__two font-SemiBold J-back-home content">
                        <spring:theme code="text.order.summary.page.back.to.home"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/_ui/responsive/aml/js/common.js"></script>
    <script src="/_ui/responsive/aml/js/orderSummaryFail.js"></script>
    <script src="/_ui/responsive/aml/js/applyAllPages.js"></script>
</template:page>
