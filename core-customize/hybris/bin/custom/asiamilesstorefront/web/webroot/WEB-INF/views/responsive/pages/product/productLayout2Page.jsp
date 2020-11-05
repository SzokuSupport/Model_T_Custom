<%@ page trimDirectiveWhitespaces="true" pageEncoding="utf-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/responsive/common/header" %>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="htmlmeta" uri="http://hybris.com/tld/htmlmeta" %>

<template:page pageTitle="${pageTitle}">
     <jsp:attribute name="pageCss">
		<link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
  		<link href="/_ui/responsive/aml/css/productLayout.css" rel="stylesheet">
  	</jsp:attribute>
    <jsp:attribute name="pageScripts">
        <script src="/_ui/responsive/aml/js/common.js"></script>
        <script src="/_ui/responsive/aml/js/productLayout.js"></script>
        <script src="/_ui/responsive/aml/js/productLayoutPlugin.js"></script>
        <script src="/_ui/responsive/aml/js/applyAllPages.js"></script>
        <script type="text/javascript"
                src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5d5e0eb7892483b2"></script>
    </jsp:attribute>
    <jsp:body>
        <div class="mini-card-container container container-fluid-mobile">
            <div class="mini-card J-mini-card">
                <div class="mini-card-title">
                    <span class="title">0&nbsp;<spring:theme
                            code="text.product.detail.page.add.to.cart.items.number"/></span>
                    <svg class="icon-close J-close-mini-cart" width="24px" height="24px" viewBox="0 0 24 24"
                         version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <g stroke="none" stroke-width="1" fill-rule="evenodd">
                            <g>
                                <g transform="translate(2.000000, 2.000000)">
                                    <path d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                                    <path fill-rule="nonzero"
                                          d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                                    <g>
                                        <mask>
                                            <path d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                                        </mask>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </svg>
                </div>
                <div class="mini-card-btns">
                    <c:url value="/cart" var="goCart"/>
                    <a class="mini-card-btn yellow font-bold" href="${goCart}"><span><spring:theme
                            code="text.product.detail.page.add.to.cart.view.cart"/></span></a>
                    <c:url value="/p/${product.code }" var="goPDP"/>
                    <a class="mini-card-btn font-bold" href="${goPDP}"><span><spring:theme
                            code="text.product.detail.page.add.to.cart.continue.shopping"/></span></a>
                </div>
            </div>
        </div>

        <c:if test="${not empty product.specialProductType && product.specialProductType eq 'ALCOHOLIC'}">
            <div class="container alcoholic-warning">
                <p><spring:theme code="text.asiamiles.plp.warningmessageforalcohol.en"/></p>
                <p style="font-family: PingFangHK;"><spring:theme
                        code="text.asiamiles.plp.warningmessageforalcohol.tc"/></p>
            </div>
        </c:if>
        <!-- product images and description -->
        <div class="container container-fluid-mobile product-detail-wrap">
            <div class="row">
                <div class="col-lg-6 col-sm-6 product-img">
                    <!-- product images -->
                    <c:if test="${empty product.externalRedirect}">
                        <div class="product-img--nav J-sliderNav">
                            <c:forEach items="${galleryImages}" var="container" varStatus="varStatus">
                                <div class="item-list ImgToBg">
                                    <img class="lazyOwl" src="${fn:escapeXml(container.product.url)}"
                                         alt="${fn:escapeXml(container.product.altText)}"/>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                    <div class="product-img--for <c:if test='${not empty product.productTagGroupB}'>addTag</c:if>">
                        <div class="item-lists J-sliderFor">
                            <c:set var="startIndex" value="0"/>
                            <c:if test="${empty product.externalRedirect and ( not empty product.vedioUrl)}">
                                <c:set var="startIndex" value="1"/>
                            </c:if>
                            <c:set var="endIndex" value="${fn:length(galleryImages)}"/>
                            <c:if test="${not empty product.externalRedirect}">
                                <c:set var="endIndex" value="0"/>
                            </c:if>
                            <c:if test="${fn:length(galleryImages) eq 0}">
                                <div class="item-list ImgToBg" data-url="/**/p/product/${product.code }/images">
                                    <div class="item-list__img <c:if test='${not empty product.productTagGroupB}'>addTagImg</c:if>">
                                        <img class="<c:if test='${empty product.productTagGroupB}'>productTagImg</c:if>"
                                             src="/_ui/responsive/theme-alpha/images/missing_product_EN_300x300.jpg"
                                             alt="${fn:escapeXml(container.zoom.altText)}"/>
                                    </div>
                                    <c:if test="${not empty product.productTag && product.switchOffGroupA eq false}">
                                        <div class="product-img-tag">${product.productTag}</div>
                                    </c:if>
                                    <c:if test="${not empty product.productTagGroupB}">
                                        <c:choose>
                                            <c:when test="${product.productTagGroupB.colour eq 'GREEN'}">
                                                <p class="product-tag font-bold"
                                                   style="background: -webkit-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                            background: -moz-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                            background: -o-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                            background: -ms-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                            background: linear-gradient(right, #428c85, #00645a, #00645a, #428c85);">
                                                        ${product.productTagGroupB.name}
                                                </p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="product-tag font-bold"
                                                   style="background: -webkit-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                            background: -moz-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                            background: -o-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                            background: -ms-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                            background: linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);">
                                                        ${product.productTagGroupB.name}
                                                </p>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </div>
                            </c:if>
                            <c:forEach items="${galleryImages}" var="container" varStatus="varStatus" begin="0"
                                       end="${endIndex}">
                                <div class="item-list J-zoomInImages ImgToBg"
                                     data-url="/**/p/product/${product.code }/images">
                                    <c:choose>
                                        <c:when test="${varStatus.index+1 eq endIndex}">
                                            <c:if test="${empty product.externalRedirect}">
                                                <c:if test="${not empty product.vedioUrl}">
                                                    <iframe height=100% title="" width=100% src="${product.vedioUrl}"
                                                            frameborder="0"
                                                            allowfullscreen="true"
                                                            event_component="PDP_video"  
                                                            event_value="product view"></iframe>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${empty product.vedioUrl}">
                                                <div class="item-list__img <c:if test='${not empty product.productTagGroupB}'>addTagImg</c:if>">
                                                    <img class="<c:if test='${empty product.productTagGroupB}'>productTagImg</c:if>"
                                                         src="${fn:escapeXml(container.zoom.url)}"
                                                         alt="${fn:escapeXml(container.zoom.altText)}"/>
                                                </div>
                                                <c:if test="${not empty product.productTag && product.switchOffGroupA eq false}">
                                                    <div class="product-img-tag">${product.productTag}</div>
                                                </c:if>
                                                <c:if test="${not empty product.productTagGroupB}">
                                                    <c:choose>
                                                        <c:when test="${product.productTagGroupB.colour eq 'GREEN'}">
                                                            <p class="product-tag font-bold"
                                                               style="background: -webkit-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                                            background: -moz-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                                            background: -o-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                                            background: -ms-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                                            background: linear-gradient(right, #428c85, #00645a, #00645a, #428c85);">
                                                                    ${product.productTagGroupB.name}
                                                            </p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p class="product-tag font-bold"
                                                               style="background: -webkit-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                                            background: -moz-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                                            background: -o-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                                            background: -ms-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                                            background: linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);">
                                                                    ${product.productTagGroupB.name}
                                                            </p>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="item-list__img <c:if test='${not empty product.productTagGroupB}'>addTagImg</c:if>">
                                                <img src="${fn:escapeXml(container.zoom.url)}"
                                                     alt="${fn:escapeXml(container.zoom.altText)}"/>
                                            </div>
                                            <c:if test="${not empty product.productTag && product.switchOffGroupA eq false}">
                                                <div class="product-img-tag">${product.productTag}</div>
                                            </c:if>
                                            <c:if test="${not empty product.productTagGroupB}">
                                                <c:choose>
                                                    <c:when test="${product.productTagGroupB.colour eq 'GREEN'}">
                                                        <p class="product-tag font-bold"
                                                           style="background: -webkit-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                                        background: -moz-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                                        background: -o-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                                        background: -ms-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                                        background: linear-gradient(right, #428c85, #00645a, #00645a, #428c85);">
                                                                ${product.productTagGroupB.name}
                                                        </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="product-tag font-bold"
                                                           style="background: -webkit-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                                        background: -moz-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                                        background: -o-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                                        background: -ms-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                                        background: linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);">
                                                                ${product.productTagGroupB.name}
                                                        </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- product tag B-->

                    <!-- Free delivery message -->
                    <c:if test="${product.productType eq 'HOME_DELIVERY'}">
                        <div class="free-delivery only-desktop">
                            <svg class="icon-delivery" width="24px" height="24px" viewBox="0 0 24 24" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <g>
                                        <g transform="translate(0.000000, 3.000000)">
                                            <g transform="translate(0.000000, 0.000000)">
                                                <mask fill="white">
                                                    <polygon
                                                            points="0 0.0949565217 16.7244625 0.0949565217 16.7244625 14.9758387 0 14.9758387"></polygon>
                                                </mask>
                                                <g></g>
                                                <path d="M1.15873164,13.8310482 C1.15806255,13.8310482 1.15337891,1.24034466 1.15337891,1.24034466 L13.8400116,1.23968063 L13.8400116,13.8310482 L7.49702982,13.8310482 L7.49702982,14.9758387 L16.7244625,14.9758387 L16.7244625,13.8310482 L14.9941935,13.8310482 L14.9941935,1.24034466 C14.9941935,0.612170751 14.4763171,0.0948901186 13.8400116,0.0948901186 L1.154048,0.0948901186 C0.521088,0.0948901186 -0.000133818182,0.608186561 -0.000133818182,1.24034466 L-0.000133818182,13.8303842 C-0.000133818182,14.4592221 0.521088,14.9758387 1.15873164,14.9758387 L2.883648,14.9758387 L2.883648,13.8310482 L1.15873164,13.8310482 Z"
                                                      stroke="#272F38" stroke-width="0.2" fill="#272F38"
                                                      mask="url(#mask-2)"></path>
                                            </g>
                                            <path d="M23.9797354,9.01872185 L24,9.01872185 L24,9.75071674 L24,14.085971 C24,14.7459704 23.5089805,15.2727273 22.8824628,15.2727273 L21.2197068,15.2727273 L21.2197068,14.0832095 C21.2197068,14.0832095 22.8876246,14.0887325 22.8876246,14.085971 L22.8876246,10.1818182 L18.6425572,10.1818182 C17.9805565,10.1818182 17.4545455,9.66946176 17.4545455,9.02952251 L17.4545455,5.51660707 C17.4545455,4.87396766 17.9853886,4.36363636 18.6391057,4.36363636 L20.3487762,4.36363636 L19.9150531,3.59018515 C19.8582729,3.48869989 19.6647041,3.37202635 19.5537246,3.37202635 L14.5454545,3.37202635 L14.5454545,2.18181818 L19.5537246,2.18181818 C20.0544226,2.18181818 20.6106103,2.51803128 20.868702,2.97851205 L23.6360907,7.91400984 C23.80129,8.20896857 23.9314667,8.63550961 23.9797354,9.01872185 Z M22.8507188,9.01872185 C22.8126013,8.83676266 22.749475,8.64519251 22.6830869,8.52637332 L21.0006003,5.52602318 C20.1289492,5.52395488 18.6453184,5.51994428 18.6453184,5.51660707 C18.6453184,5.51660707 18.6370348,9.01872185 18.6425572,9.01872185 L22.8507188,9.01872185 Z"
                                                  stroke="#272F38" stroke-width="0.2" fill="#272F38"></path>
                                            <g transform="translate(2.181818, 11.636364)">
                                                <mask fill="white">
                                                    <polygon
                                                            points="0.292712727 0.246432323 5.93489455 0.246432323 5.93489455 5.81818182 0.292712727 5.81818182"></polygon>
                                                </mask>
                                                <g></g>
                                                <path d="M3.11380364,4.70380606 C4.04849455,4.70380606 4.80645818,3.95584646 4.80645818,3.03204848 C4.80645818,2.10889697 4.04849455,1.36029091 3.11380364,1.36029091 C2.17911273,1.36029091 1.42114909,2.10889697 1.42114909,3.03204848 C1.42114909,3.95584646 2.17911273,4.70380606 3.11380364,4.70380606 M3.11380364,5.81831111 C4.67162182,5.81831111 5.93489455,4.57063434 5.93489455,3.03204848 C5.93489455,1.49346263 4.67162182,0.246432323 3.11380364,0.246432323 C1.55598545,0.246432323 0.292712727,1.49346263 0.292712727,3.03204848 C0.292712727,4.57063434 1.55598545,5.81831111 3.11380364,5.81831111"
                                                      stroke="#272F38" stroke-width="0.2" fill="#272F38"
                                                      mask="url(#mask-4)"></path>
                                            </g>
                                            <g transform="translate(16.000000, 11.636364)">
                                                <mask fill="white">
                                                    <polygon
                                                            points="0.0857858586 0.246432323 5.65831111 0.246432323 5.65831111 5.81818182 0.0857858586 5.81818182"></polygon>
                                                </mask>
                                                <g></g>
                                                <path d="M2.87204848,4.70380606 C3.7952,4.70380606 4.54380606,3.95584646 4.54380606,3.03204848 C4.54380606,2.10889697 3.7952,1.36029091 2.87204848,1.36029091 C1.94889697,1.36029091 1.20029091,2.10889697 1.20029091,3.03204848 C1.20029091,3.95584646 1.94889697,4.70380606 2.87204848,4.70380606 M2.87204848,5.81831111 C4.41063434,5.81831111 5.65831111,4.57063434 5.65831111,3.03204848 C5.65831111,1.49346263 4.41063434,0.246432323 2.87204848,0.246432323 C1.33346263,0.246432323 0.0857858586,1.49346263 0.0857858586,3.03204848 C0.0857858586,4.57063434 1.33346263,5.81831111 2.87204848,5.81831111"
                                                      stroke="#272F38" stroke-width="0.2" fill="#272F38"
                                                      mask="url(#mask-6)"></path>
                                            </g>
                                        </g>
                                    </g>
                                </g>
                            </svg>
                            <spring:theme code="text.product.detail.page.delivery.included"/>
                        </div>
                    </c:if>
                </div>
                <!-- product description -->
                <div class="col-lg-6 col-sm-6 product-info-wrap">
                    <p class="brand-name font-bold">
                        <c:if test="${not empty product.brandName}">
                            <span>${product.brandName}</span>
                        </c:if>
                        <svg class="icon-share J-shareThis content" tabindex="0"
                             aria-label="Share this product icon- clickable" xmlns="http://www.w3.org/2000/svg"
                             width="24" height="24" viewBox="0 0 24 24">
                            <path fill="#272F38" fill-rule="evenodd"
                                  d="M17.09 7.314l-8.173 4.983a3.008 3.008 0 0 1 .053 1.127l8.01 4.359a3 3 0 1 1-.939 1.724L8.07 15.17a3 3 0 1 1-.214-4.527l8.21-5.005a3 3 0 1 1 1.022 1.676z"/>
                        </svg>
                    </p>
                    <div class="J-share-bar">
                        <p class="share-bar-title font-bold">Share</p>
                        <div class="share-bar">
                            <c:set var="galleryImage" value=""/>
                            <c:if test="${not empty galleryImages}">
                                <c:set var="galleryImage" value="${domain}${galleryImages.get(0).zoom.url}"/>
                            </c:if>

                            <div class="addthis_inline_share_toolbox_855j" data-media="${galleryImage}"
                                 data-title="${product.name}" data-description="${product.name}"></div>
                            <svg class="icon-share-bar icon-share-close J-share-close" tabindex="0" width="24px"
                                 height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g stroke="none" stroke-width="1" fill-rule="evenodd">
                                    <g>
                                        <g transform="translate(2.000000, 2.000000)">
                                            <path d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                                            <path fill-rule="nonzero"
                                                  d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                                            <g>
                                                <mask>
                                                    <path d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                                                </mask>
                                            </g>
                                        </g>
                                    </g>
                                </g>
                            </svg>
                        </div>
                    </div>
                    <c:if test="${not empty product.name && empty product.externalRedirect }">
                        <p class="product-name">${product.name}</p>
                    </c:if>
                    <c:if test="${not empty product.code && empty product.externalRedirect }">
                        <p class="package-code font-light"><spring:theme
                                code="text.product.detail.page.package.code"/>:${product.code}</p>
                    </c:if>
                    <c:if test="${not empty product.specialNotice}">
                        <div class="special-notice">${product.specialNotice}</div>
                    </c:if>
                    <c:if test="${empty product.externalRedirect}">
                        <c:if test="${product.stock.stockLevel lt 1}">
                            <p class="outOfStock"><spring:theme
                                    code="text.product.detail.page.variant.out.of.stock"/></p>
                        </c:if>
                        <div class="product-price">
                            <c:choose>
                                <c:when test="${empty product.promotionPrice}">
                                    <p class="product--price__discounted J-original-price">
                                        <c:if test="${not empty product.price.value}">
                                            <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48"
                                                 viewBox="0 0 40 48">
                                                <g fill="none" fill-rule="evenodd">
                                                    <path fill="#FACF00"
                                                          d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                                    <path fill="#333D47"
                                                          d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                                    <path fill="#FACF00"
                                                          d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                                </g>
                                            </svg>
                                        </c:if>
                                        <span class="price font-bold"><fmt:formatNumber value="${product.price.value}"
                                                                                        maxFractionDigits="0"/></span>
                                        <c:if test="${product.cashOnly eq true}">
                                            <span>/${product.currency} </span>
                                            <span class="font-bold">&nbsp;
                                            <fmt:formatNumber
                                                    value="${product.fullCashPrice}" minFractionDigits="2"
                                                    maxFractionDigits="2"/>
                                            </span>
                                        </c:if>
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <p class="product--price__original">
                                        <c:if test="${not empty product.price.value}">
                                            <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48"
                                                 viewBox="0 0 40 48">
                                                <g fill="none" fill-rule="evenodd">
                                                    <path fill="#FACF00"
                                                          d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                                    <path fill="#333D47"
                                                          d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                                    <path fill="#FACF00"
                                                          d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                                </g>
                                            </svg>
                                        </c:if>
                                        <del><fmt:formatNumber value="${product.price.value}"
                                                               maxFractionDigits="0"/></del>
                                        <c:if test="${product.cashOnly eq true}">
                                            <del class="price-per">
                                                /${product.currency}<fmt:formatNumber
                                                    value="${product.originFullCashPrice}" minFractionDigits="2"
                                                    maxFractionDigits="2"/></del>
                                        </c:if>
                                    </p>
                                    <p class="product--price__discounted J-original-price">
                                        <c:if test="${not empty product.price.value}">
                                            <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48"
                                                 viewBox="0 0 40 48">
                                                <g fill="none" fill-rule="evenodd">
                                                    <path fill="#FACF00"
                                                          d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                                    <path fill="#333D47"
                                                          d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                                    <path fill="#FACF00"
                                                          d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                                </g>
                                            </svg>
                                        </c:if>
                                        <span class="price font-bold"><fmt:formatNumber
                                                value="${product.promotionPrice.value}" maxFractionDigits="0"/></span>
                                        <c:if test="${product.cashOnly eq true}">
                                            <span>/${product.currency} </span>
                                            <span class="font-bold">
                                            <fmt:formatNumber
                                                    value="${product.fullCashPrice}" minFractionDigits="2"
                                                    maxFractionDigits="2"/></span>
                                        </c:if>
                                    </p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <c:if test="${not empty product.discountRows || not empty product.potentialBonusRules}">
                            <div class="instant-discount" tabindex="0">
                                 <span class="text"><spring:theme code="text.product.detail.page.discount.detail"/>:
                                 </span>
                                <c:set var="falg" value="1"/>
                                <c:if test="${not empty product.discountRows}">
                                    <span class="icon-earn-miles">
                                        <img src="/_ui/responsive/aml/img/discount-yellow.svg" />
                                    </span>
                                </c:if>
                                <c:if test="${not empty product.potentialBonusRules}">
                                      <span class="icon-earn-miles">
                                           <img src="/_ui/responsive/aml/img/earn-yellow.svg" />
                                      </span>
                                </c:if>
                                <a class="discount-group">
                                    <div class="svgMask J-offer-details" data-url="/product/${product.code }/tooltip"></div>
                                    <svg class="icon-info-small">
                                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-info-small"></use>
                                    </svg>
                                </a>
                            </div>
                        </c:if>


                        <div class="row variance-padding">
                            <product:productVariantSelector product="${product}"/>
                            <!-- qty section start -->
                            <c:if test="${empty accErrorMsgs}">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="dropdown-group" id="J-quantity">
                                        <label class="dropdown-label"><spring:theme
                                                code="text.product.detail.page.variant.quantity"/></label>
                                        <a class="dropdown-selected J-selectTrigger" aria-hidden="false"
                                           tabindex="0">
                                            <span class="dropdown-selected-text J-quantity"> </span>
                                            <input type="hidden" class="J-select-input" id="quantity"/>
                                            <label for="quantity" style='opacity:0'><spring:theme
                                                    code="text.product.detail.page.variant.quantity"/></label>
                                            <svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24"
                                                 viewBox="0 0 24 24">
                                                <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                                                    <path d="M15 0v8.414H0V0z"/>
                                                    <path fill="#272F38"
                                                          d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                                                </g>
                                            </svg>
                                        </a>

                                        <c:set var="maxQty" value="${maxQuantity}"/>
                                        <c:if test="${product.stock.stockLevel le maxQuantity}">
                                            <c:set var="maxQty" value="${product.stock.stockLevel}"/>
                                        </c:if>
                                        <c:if test="${product.stock.stockLevel le 1}">
                                            <c:set var="maxQty" value="1"/>
                                        </c:if>
                                        <!-- desktop dropdown -->
                                        <div class="dropdown-selected-control J-selectedControl">
                                            <ul class="listbox" role="listbox" aria-expanded="true">
                                                <c:forEach var="i" begin="1" end="${maxQty}" step="1" varStatus="loop">
                                                    <c:choose>
                                                        <c:when test="${loop.index eq 1}">
                                                            <li class="option selected" role="option" data-href="">
                                                                <a class="link" href="javascript:;">${i}</a>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li class="option" role="option" data-href="">
                                                                <a class="link" href="javascript:;">${i}</a>
                                                            </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <!-- /desktop dropdown -->
                                        <!-- mobile dropdown -->
                                        <select use='qu'
                                                class="dropdown-selected-control--mobile J-selectedControlMobile"
                                                name="title"
                                                placeholder="qty">
                                            <c:forEach var="i" begin="1" end="${maxQty}" step="1" varStatus="loop">
                                                <c:choose>
                                                    <c:when test="${loop.index eq 1}">
                                                        <option class="option" selected>${i}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option class="option">${i}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                        <!-- /mobile dropdown -->
                                    </div>
                                </div>
                            </c:if>
                            <!-- qty section end -->
                            <!-- wine checkbox -->
                            <c:if test="${empty product.externalRedirect}">
                                <c:if test="${product.specialProductType eq 'ALCOHOLIC'}">
                                    <div class="col-lg-12 col-sm-12 product-wine">
                                        <div class="checkbox-group J-product-checkbox-group">
                                            <input class="J-agree-checkbox" type="checkbox" id="wineforpdp">
                                            <label class="agree-form" for="wineforpdp"><spring:theme
                                                    code="text.product.detail.page.wine.adult.claim.message"/></label>
                                        </div>
                                        <p class="alert-message agree-term-condition J-agree-term-condition font-SemiBold">
                                            <svg class="icon-triangle-important" xmlns="http://www.w3.org/2000/svg"
                                                 width="24" height="24" viewBox="0 0 24 24">
                                                <g fill="none" fill-rule="evenodd">
                                                    <circle cx="12" cy="12" r="9" fill="#FACF00"/>
                                                    <path fill="#272F38"
                                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                                </g>
                                            </svg>
                                            <spring:theme code="text.product.detail.page.wine.adult.check.box"/>
                                        </p>
                                    </div>
                                </c:if>
                            </c:if>
                        </div>

                        <product:productMpcSlider product="${product}"/>
                    </c:if>
                    <c:if test="${not empty product.externalRedirect}">
                        <div class="row button-wrap">
                            <div class="col-lg-7 col-sm-7 col-xs-10 addToCart">
                                <a href="${product.externalRedirect}" class="button-yellow font-SemiBold">
                                    <svg class="icon-cart" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                         viewBox="0 0 24 24">
                                        <g fill="none" fill-rule="evenodd" stroke="#272F38" stroke-linecap="square"
                                           stroke-linejoin="bevel" stroke-width="2">
                                            <path d="M1.591 8.728h20.234a.336.336 0 0 0 .237-.574l-6.564-6.563M22.832 14.35H2.6a.336.336 0 0 0-.237.574l6.563 6.563"/>
                                        </g>
                                    </svg>
                                    <span><spring:theme
                                            code="text.product.detail.page.external.link.conversion"/></span>
                                </a>
                            </div>
                        </div>
                    </c:if>
                </div>
                <!-- /product description -->

                <!-- Free delivery and gift message on mobile -->

                <div class="col-xs-12 only-mobile free-wrap--mobile">
                    <!-- Free delivery message -->
                    <c:if test="${product.productType eq 'HOME_DELIVERY'}">
                        <div class="free-delivery ">
                            <svg class="icon-delivery" width="24px" height="24px" viewBox="0 0 24 24" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <g>
                                        <g transform="translate(0.000000, 3.000000)">
                                            <g transform="translate(0.000000, 0.000000)">
                                                <mask fill="white">
                                                    <polygon
                                                            points="0 0.0949565217 16.7244625 0.0949565217 16.7244625 14.9758387 0 14.9758387"></polygon>
                                                </mask>
                                                <g></g>
                                                <path d="M1.15873164,13.8310482 C1.15806255,13.8310482 1.15337891,1.24034466 1.15337891,1.24034466 L13.8400116,1.23968063 L13.8400116,13.8310482 L7.49702982,13.8310482 L7.49702982,14.9758387 L16.7244625,14.9758387 L16.7244625,13.8310482 L14.9941935,13.8310482 L14.9941935,1.24034466 C14.9941935,0.612170751 14.4763171,0.0948901186 13.8400116,0.0948901186 L1.154048,0.0948901186 C0.521088,0.0948901186 -0.000133818182,0.608186561 -0.000133818182,1.24034466 L-0.000133818182,13.8303842 C-0.000133818182,14.4592221 0.521088,14.9758387 1.15873164,14.9758387 L2.883648,14.9758387 L2.883648,13.8310482 L1.15873164,13.8310482 Z"
                                                      stroke="#272F38" stroke-width="0.2" fill="#272F38"
                                                      mask="url(#mask-2)"></path>
                                            </g>
                                            <path d="M23.9797354,9.01872185 L24,9.01872185 L24,9.75071674 L24,14.085971 C24,14.7459704 23.5089805,15.2727273 22.8824628,15.2727273 L21.2197068,15.2727273 L21.2197068,14.0832095 C21.2197068,14.0832095 22.8876246,14.0887325 22.8876246,14.085971 L22.8876246,10.1818182 L18.6425572,10.1818182 C17.9805565,10.1818182 17.4545455,9.66946176 17.4545455,9.02952251 L17.4545455,5.51660707 C17.4545455,4.87396766 17.9853886,4.36363636 18.6391057,4.36363636 L20.3487762,4.36363636 L19.9150531,3.59018515 C19.8582729,3.48869989 19.6647041,3.37202635 19.5537246,3.37202635 L14.5454545,3.37202635 L14.5454545,2.18181818 L19.5537246,2.18181818 C20.0544226,2.18181818 20.6106103,2.51803128 20.868702,2.97851205 L23.6360907,7.91400984 C23.80129,8.20896857 23.9314667,8.63550961 23.9797354,9.01872185 Z M22.8507188,9.01872185 C22.8126013,8.83676266 22.749475,8.64519251 22.6830869,8.52637332 L21.0006003,5.52602318 C20.1289492,5.52395488 18.6453184,5.51994428 18.6453184,5.51660707 C18.6453184,5.51660707 18.6370348,9.01872185 18.6425572,9.01872185 L22.8507188,9.01872185 Z"
                                                  stroke="#272F38" stroke-width="0.2" fill="#272F38"></path>
                                            <g transform="translate(2.181818, 11.636364)">
                                                <mask fill="white">
                                                    <polygon
                                                            points="0.292712727 0.246432323 5.93489455 0.246432323 5.93489455 5.81818182 0.292712727 5.81818182"></polygon>
                                                </mask>
                                                <g></g>
                                                <path d="M3.11380364,4.70380606 C4.04849455,4.70380606 4.80645818,3.95584646 4.80645818,3.03204848 C4.80645818,2.10889697 4.04849455,1.36029091 3.11380364,1.36029091 C2.17911273,1.36029091 1.42114909,2.10889697 1.42114909,3.03204848 C1.42114909,3.95584646 2.17911273,4.70380606 3.11380364,4.70380606 M3.11380364,5.81831111 C4.67162182,5.81831111 5.93489455,4.57063434 5.93489455,3.03204848 C5.93489455,1.49346263 4.67162182,0.246432323 3.11380364,0.246432323 C1.55598545,0.246432323 0.292712727,1.49346263 0.292712727,3.03204848 C0.292712727,4.57063434 1.55598545,5.81831111 3.11380364,5.81831111"
                                                      stroke="#272F38" stroke-width="0.2" fill="#272F38"
                                                      mask="url(#mask-4)"></path>
                                            </g>
                                            <g transform="translate(16.000000, 11.636364)">
                                                <mask fill="white">
                                                    <polygon
                                                            points="0.0857858586 0.246432323 5.65831111 0.246432323 5.65831111 5.81818182 0.0857858586 5.81818182"></polygon>
                                                </mask>
                                                <g></g>
                                                <path d="M2.87204848,4.70380606 C3.7952,4.70380606 4.54380606,3.95584646 4.54380606,3.03204848 C4.54380606,2.10889697 3.7952,1.36029091 2.87204848,1.36029091 C1.94889697,1.36029091 1.20029091,2.10889697 1.20029091,3.03204848 C1.20029091,3.95584646 1.94889697,4.70380606 2.87204848,4.70380606 M2.87204848,5.81831111 C4.41063434,5.81831111 5.65831111,4.57063434 5.65831111,3.03204848 C5.65831111,1.49346263 4.41063434,0.246432323 2.87204848,0.246432323 C1.33346263,0.246432323 0.0857858586,1.49346263 0.0857858586,3.03204848 C0.0857858586,4.57063434 1.33346263,5.81831111 2.87204848,5.81831111"
                                                      stroke="#272F38" stroke-width="0.2" fill="#272F38"
                                                      mask="url(#mask-6)"></path>
                                            </g>
                                        </g>
                                    </g>
                                </g>
                            </svg>
                            <spring:theme code="text.product.detail.page.delivery.included"/>
                        </div>
                    </c:if>
                    <!-- /Free delivery message -->

                    <!-- free gift message -->
                        <%--                    <div class="free-gift">--%>
                        <%--                        <div class="free-gift__img">--%>
                        <%--                            <img src="/_ui/responsive/aml/img/product3x.jpg" alt="product1"/>--%>
                        <%--                        </div>--%>
                        <%--                        <div class="free-gift__message">--%>
                        <%--                            <h5 class="title font-bold">Free gift for you</h5>--%>
                        <%--                            <p class="info font-light">Hair comb zebra pattern</p>--%>
                        <%--                        </div>--%>
                        <%--                    </div>--%>
                    <!-- /free gift message -->
                </div>
                <!-- /Free delivery and gift message on mobile -->
            </div>
        </div>
        <!-- /product images and description -->
        <div class="container container-fluid-mobile">
            <div class="row">
                <div class="col-lg-12 col-sm-12 product-detail">
                    <div class="product-detail__tabs clearfix">
                        <ul>
                            <li class="tabs-list J-productDetailTab selected" aria-selected="true">
                                <a href="javascript:;">
                                    <spring:theme code="text.product.detail.page.product.description"/>
                                </a>
                            </li>
                            <li class="tabs-list J-productDetailTab" aria-selected="true">
                                <a href="javascript:;">
                                    <spring:theme code="text.product.detail.page.merchant.label"/>
                                </a>
                            </li>
                            <li class="tabs-list J-productDetailTab" aria-selected="true">
                                <a href="javascript:;">
                                    <spring:theme code="text.product.detail.page.how.to.redeem.label"/>
                                </a>
                            </li>
                            <li class="tabs-list J-productDetailTab" aria-selected="true">
                                <a href="javascript:;">
                                    <spring:theme code="text.product.detail.page.terms.and.conditions"/>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- tab content 1 -->
                    <div class="product-detail__control selected J-productDetailControl">
                        <span class="product-detail__tabs--mobile J-selectTrigger" aria-hidden="true">
                    <span class="text font-SemiBold"><spring:theme
                            code="text.product.detail.page.product.description"/></span>
                    <svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                      <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                          <path d="M15 0v8.414H0V0z"/>
                          <path fill="#272F38"
                                d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                      </g>
                  </svg>
                </span>
                        <div class="information clearfix J-information">
                            <dl class="overview">
                                <dt class="font-SemiBold"><spring:theme code="text.product.detail.page.overview"/></dt>
                                <dd>
                                        ${product.description}
                                </dd>
                            </dl>
                            <dl>
                                <dt class="font-SemiBold"><spring:theme
                                        code="text.product.detail.page.how.to.redeem.redemption.period"/></dt>
                                <c:if test="${not empty product.redemptionStartDate && not empty product.redemptionEndDate}">
                                    <c:choose>
                                        <c:when test="${language eq 'zh' || language eq 'zh_TW' }">
                                            <dd><fmt:formatDate value="${product.redemptionStartDate}"
                                                                pattern="yyyy年MM月dd日"/> -
                                                <fmt:formatDate value="${product.redemptionEndDate}"
                                                                pattern="yyyy年MM月dd日"/></dd>
                                        </c:when>
                                        <c:when test="${language eq 'ja'}">
                                            <dd><fmt:formatDate value="${product.redemptionStartDate}"
                                                                pattern="yyyy年 MM月 dd日"/> -
                                                <fmt:formatDate value="${product.redemptionEndDate}"
                                                                pattern="yyyy年 MM月 dd日"/></dd>
                                        </c:when>
                                        <c:when test="${language eq 'ko'}">
                                            <dd><fmt:formatDate value="${product.redemptionStartDate}"
                                                                pattern="yyyy년 MM월 dd일"/> -
                                                <fmt:formatDate value="${product.redemptionEndDate}"
                                                                pattern="yyyy년 MM월 dd일"/></dd>
                                        </c:when>
                                        <c:otherwise>
                                            <dd><fmt:formatDate value="${product.redemptionStartDate}"
                                                                pattern="d MMM yyyy"/> -
                                                <fmt:formatDate value="${product.redemptionEndDate}"
                                                                pattern="d MMM yyyy"/></dd>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </dl>
                            <c:if test="${not empty product.deliveryPeriod}">
                                <dl>
                                    <dt class="font-SemiBold"><spring:theme
                                            code="text.product.detail.page.how.to.redeem.delivery.period"/></dt>
                                    <dd>${product.deliveryPeriod}</dd>
                                </dl>
                            </c:if>
                            <c:if test="${not empty product.validityPeriod}">
                                <dl>
                                    <dt class="font-SemiBold"><spring:theme
                                            code="text.product.detail.page.how.to.redeem.validity.period"/></dt>
                                    <dd>${product.validityPeriod}</dd>
                                </dl>
                            </c:if>
                            <dl>
                                <dt class="font-SemiBold"><spring:theme
                                        code="text.product.detail.page.how.to.redeem.collection.method"/></dt>
                                <c:if test="${not empty product.collectionMethodTextForDisplay}">
                                    <dd>${product.collectionMethodTextForDisplay}</dd>
                                </c:if>
                                <c:if test="${not empty product.collectionMethod && empty product.collectionMethodTextForDisplay}">
                                    <dd><spring:theme code="text.product.type.${product.collectionMethod}"/></dd>
                                </c:if>
                            </dl>
                        </div>
                        <div class="show-more-wrap J-triggerShowMore" aria-controls="show-more">
                            <a href="javascript:;">
                                <span class="text-showMore"><spring:theme
                                        code="text.product.list.page.show.more"/></span>
                                <span class="text-showLess"><spring:theme
                                        code="text.product.list.page.show.less"/> </span>
                                <svg class="icon-arrow-down icon-arrow-down-showmore" xmlns="http://www.w3.org/2000/svg"
                                     width="24" height="24" viewBox="0 0 24 24">
                                    <g fill="none" fill-rule="nonzero">
                                        <path fill="#272F38"
                                              d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                        <path fill="#FACF00"
                                              d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                    </g>
                                </svg>
                            </a>
                        </div>
                    </div>
                    <!-- /tab content 1 -->
                    <!-- tab content 2 -->
                    <div class="product-detail__control J-productDetailControl">
                        <span class="product-detail__tabs--mobile J-selectTrigger" aria-hidden="true">
                    <span class="text font-SemiBold"><spring:theme
                            code="text.product.detail.page.merchant.label"/></span>
                    <svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                      <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                          <path d="M15 0v8.414H0V0z"/>
                          <path fill="#272F38"
                                d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                      </g>
                    </svg>
                </span>
                        <div class="information J-information clearfix">
                            <div class="merchant-contact clearfix">
                                <ul>
                                    <li class="title font-SemiBold"><spring:theme
                                            code="text.product.detail.page.merchant.name"/></li>
                                    <li>${product.productPartnerCompanyName}</li>
                                </ul>
                                <c:if test="${not empty product.productPartnerEmail}">
                                    <ul>
                                        <li><spring:theme code="text.product.detail.page.merchant.email"/></li>
                                        <li>${product.productPartnerEmail}</li>
                                    </ul>
                                </c:if>
                                <c:if test="${not empty product.productPartnerTelephone}">
                                    <ul>
                                        <li><spring:theme code="text.product.detail.page.merchant.telephone"/></li>
                                        <li>${product.productPartnerTelephone}</li>
                                    </ul>
                                </c:if>
                                <c:if test="${not empty product.productPartnerAddress}">
                                    <ul>
                                        <li><spring:theme
                                                code="text.product.detail.page.merchant.address"/></li>
                                        <li>${product.productPartnerAddress}</li>
                                    </ul>
                                </c:if>
                                <c:if test="${not empty product.productPartnerRemark}">
                                    <ul>
                                        <li><spring:theme
                                                code="text.product.detail.page.merchant.other.information"/></li>
                                        <li>${product.productPartnerRemark}</li>
                                    </ul>
                                </c:if>
                            </div>
                            <div class="merchant-contact clearfix">
                                <c:if test="${not empty product.deliveryPartnerCompanyName}">
                                    <ul>
                                        <li class="title font-SemiBold"><spring:theme
                                                code="text.product.detail.page.merchant.delivery.service"/></li>
                                        <li>${product.deliveryPartnerCompanyName}</li>
                                    </ul>
                                </c:if>
                                    <%--                                <c:if test="${not empty product.deliveryPartnerAddress}">--%>
                                    <%--                                    <ul>--%>
                                    <%--                                        <li><spring:theme--%>
                                    <%--                                                code="asiamiles.pdp.product.delivery"/></li>--%>
                                    <%--                                        <li>${product.deliveryPartnerAddress}</li>--%>
                                    <%--                                    </ul>--%>
                                    <%--                                </c:if>--%>
                                <c:if test="${not empty product.deliveryPartnerEmail}">
                                    <ul>
                                        <li><spring:theme code="text.product.detail.page.merchant.delivery.email"/>
                                        </li>
                                        <li>${product.deliveryPartnerEmail}</li>
                                    </ul>
                                </c:if>
                                <c:if test="${not empty product.deliveryPartnerTelephone}">
                                    <ul>
                                        <li><spring:theme code="text.product.detail.page.merchant.telephone"/></li>
                                        <li>${product.deliveryPartnerTelephone}</li>
                                    </ul>
                                </c:if>
                                <c:if test="${not empty product.deliveryPartnerAddress}">
                                    <ul>
                                        <li><spring:theme code="text.product.detail.page.merchant.address"/></li>
                                        <li>${product.deliveryPartnerAddress}</li>
                                    </ul>
                                </c:if>
                                <c:if test="${not empty product.deliveryPartnerRemark}">
                                    <ul>
                                        <li><spring:theme
                                                code="text.product.detail.page.merchant.other.information"/></li>
                                        <li>${product.deliveryPartnerRemark}</li>
                                    </ul>
                                </c:if>
                            </div>
                        </div>
                        <div class="show-more-wrap J-triggerShowMore" aria-controls="show-more">
                            <a href="javascript:;">
                                <span class="text-showMore"><spring:theme
                                        code="text.product.list.page.show.more"/></span>
                                <span class="text-showLess"><spring:theme
                                        code="text.product.list.page.show.less"/> </span>
                                <svg class="icon-arrow-down icon-arrow-down-showmore" xmlns="http://www.w3.org/2000/svg"
                                     width="24" height="24" viewBox="0 0 24 24">
                                    <g fill="none" fill-rule="nonzero">
                                        <path fill="#272F38"
                                              d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                        <path fill="#FACF00"
                                              d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                    </g>
                                </svg>
                            </a>
                        </div>
                    </div>
                    <!-- /tab content 2 -->
                    <!-- tab content 3 -->
                    <div class="product-detail__control J-productDetailControl">
                        <span class="product-detail__tabs--mobile J-selectTrigger" aria-hidden="true">
                    <span class="text font-SemiBold"><spring:theme
                            code="text.product.detail.page.how.to.redeem.label"/></span>
                    <svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                      <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                          <path d="M15 0v8.414H0V0z"/>
                          <path fill="#272F38"
                                d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                      </g>
                  </svg>
                </span>
                        <div class="information clearfix J-information">
                            <div class="free-text">
                                    ${product.howToRedeem}
                            </div>

                            <dl>
                                <dt class="font-SemiBold"><spring:theme
                                        code="text.product.detail.page.how.to.redeem.redemption.period"/></dt>
                                <c:if test="${not empty product.redemptionStartDate && not empty product.redemptionEndDate}">
                                    <c:choose>
                                        <c:when test="${language eq 'zh' || language eq 'zh_TW' }">
                                            <dd><fmt:formatDate value="${product.redemptionStartDate}"
                                                                pattern="yyyy年MM月dd日"/> -
                                                <fmt:formatDate value="${product.redemptionEndDate}"
                                                                pattern="yyyy年MM月dd日"/></dd>
                                        </c:when>
                                        <c:when test="${language eq 'ja'}">
                                            <dd><fmt:formatDate value="${product.redemptionStartDate}"
                                                                pattern="yyyy年 MM月 dd日"/> -
                                                <fmt:formatDate value="${product.redemptionEndDate}"
                                                                pattern="yyyy年 MM月 dd日"/></dd>
                                        </c:when>
                                        <c:when test="${language eq 'ko'}">
                                            <dd><fmt:formatDate value="${product.redemptionStartDate}"
                                                                pattern="yyyy년 MM월 dd일"/> -
                                                <fmt:formatDate value="${product.redemptionEndDate}"
                                                                pattern="yyyy년 MM월 dd일"/></dd>
                                        </c:when>
                                        <c:otherwise>
                                            <dd><fmt:formatDate value="${product.redemptionStartDate}"
                                                                pattern="d MMM yyyy"/> -
                                                <fmt:formatDate value="${product.redemptionEndDate}"
                                                                pattern="d MMM yyyy"/></dd>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </dl>
                            <c:if test="${not empty product.deliveryPeriod}">
                                <dl>
                                    <dt class="font-SemiBold"><spring:theme
                                            code="text.product.detail.page.how.to.redeem.delivery.period"/></dt>
                                    <dd>${product.deliveryPeriod}</dd>
                                </dl>
                            </c:if>
                            <c:if test="${not empty product.validityPeriod}">
                                <dl>
                                    <dt class="font-SemiBold"><spring:theme
                                            code="text.product.detail.page.how.to.redeem.validity.period"/></dt>
                                    <dd>${product.validityPeriod}</dd>
                                </dl>
                            </c:if>
                            <dl>
                                <dt class="font-SemiBold"><spring:theme
                                        code="text.product.detail.page.how.to.redeem.collection.method"/></dt>
                                <c:if test="${not empty product.collectionMethodTextForDisplay}">
                                    <dd>${product.collectionMethodTextForDisplay}</dd>
                                </c:if>
                                <c:if test="${not empty product.collectionMethod && empty product.collectionMethodTextForDisplay}">
                                    <dd><spring:theme code="text.product.type.${product.collectionMethod}"/></dd>
                                </c:if>
                            </dl>
                        </div>
                        <div class="show-more-wrap J-triggerShowMore" aria-controls="show-more">
                            <a href="javascript:;">
                                <span class="text-showMore"><spring:theme
                                        code="text.product.list.page.show.more"/></span>
                                <span class="text-showLess"><spring:theme
                                        code="text.product.list.page.show.less"/> </span>
                                <svg class="icon-arrow-down icon-arrow-down-showmore" xmlns="http://www.w3.org/2000/svg"
                                     width="24" height="24" viewBox="0 0 24 24">
                                    <g fill="none" fill-rule="nonzero">
                                        <path fill="#272F38"
                                              d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                        <path fill="#FACF00"
                                              d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                    </g>
                                </svg>
                            </a>
                        </div>
                    </div>
                    <!-- /tab content 3 -->
                    <!-- tab content 4 -->
                    <div class="product-detail__control J-productDetailControl">
                        <span class="product-detail__tabs--mobile J-selectTrigger" aria-hidden="true">
                    <span class="text font-SemiBold"><spring:theme
                            code="text.product.detail.page.terms.and.conditions"/></span>
                    <svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                      <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                          <path d="M15 0v8.414H0V0z"/>
                          <path fill="#272F38"
                                d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                      </g>
                    </svg>
                </span>
                        <div class="information termsConditions J-information clearfix">
                                ${product.termsAndconditions}
                        </div>
                        <div class="show-more-wrap J-triggerShowMore" aria-controls="show-more">
                            <a href="javascript:;">
                                <span class="text-showMore"><spring:theme
                                        code="text.product.list.page.show.more"/></span>
                                <span class="text-showLess"><spring:theme
                                        code="text.product.list.page.show.less"/> </span>
                                <svg class="icon-arrow-down icon-arrow-down-showmore" xmlns="http://www.w3.org/2000/svg"
                                     width="24" height="24" viewBox="0 0 24 24">
                                    <g fill="none" fill-rule="nonzero">
                                        <path fill="#272F38"
                                              d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                        <path fill="#FACF00"
                                              d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                    </g>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Special bundle offer -->
        <%--        <div class="container">--%>
        <%--            <h2 class="product-layout-title font-light"><spring:theme--%>
        <%--                    code="text.product.detail.page.other.people.also.view"/></h2>--%>
        <%--            <div class="row">--%>
        <%--                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">--%>
        <%--                    <a class="product-card" href="#"--%>
        <%--                       onClick="scEvent('product_banner|banner string')">--%>
        <%--                        <div class="product-img J-product-card-img">--%>
        <%--                            <img class="product-img-origin" src="/_ui/responsive/aml/img/product-img1.png" alt="**"/>--%>
        <%--                            <img class="product-img-hover" src="/_ui/responsive/aml/img/Moodshot_Dyson.png" alt="**"/>--%>
        <%--                            <div class="product-img-tag font-bold">Coming Soon</div>--%>
        <%--                        </div>--%>
        <%--                        <div class="product-tag"--%>
        <%--                             style="background: -webkit-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: -moz-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: -o-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: -ms-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);">--%>
        <%--                            <p class="product-tag__p font-SemiBold">Marco Polo Club Exclusive</p>--%>
        <%--                        </div>--%>
        <%--                        <div class="product-description">--%>
        <%--                            <h5 class="product-description-title font-bold">Dyson</h5>--%>
        <%--                            <p class="product-description__p">Supersonic™ Hair Dryer, White/SilverSupersonic™ Hair--%>
        <%--                                Dryer,--%>
        <%--                                White/SilverSupersonic™ Hair Dryer, White/Silver</p>--%>

        <%--                        </div>--%>
        <%--                        <div class="product-sale">--%>
        <%--                            <p class="product-sale-stock">Out of stock</p>--%>
        <%--                            <p class="product-sale-from">From</p>--%>
        <%--                            <div class="product-sale-delete">--%>
        <%--                                <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">--%>
        <%--                                  <g fill="none" fill-rule="evenodd">--%>
        <%--                                      <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>--%>
        <%--                                      <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>--%>
        <%--                                      <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>--%>
        <%--                                  </g>--%>
        <%--                                </svg>--%>
        <%--                                <del class="price">26,500</del>--%>
        <%--                                <del class="price-per">/HKD&nbsp;45</del>--%>
        <%--                            </div>--%>
        <%--                            <div class="product-sale-price">--%>
        <%--                                <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">--%>
        <%--                                  <g fill="none" fill-rule="evenodd">--%>
        <%--                                      <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>--%>
        <%--                                      <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>--%>
        <%--                                      <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>--%>
        <%--                                  </g>--%>
        <%--                                </svg>--%>
        <%--                                <p class="price font-bold">26,500</p>--%>
        <%--                                <!--<span class="price-per">/</span>--%>
        <%--                                <span class="price-per currency">HKD</span>--%>
        <%--                                <span class="price-per font-bold">45</span>-->--%>
        <%--                            </div>--%>
        <%--                            <div class="product-sale-discount J-see-all-discount" --%>
        <%--                                 data-url="/_ui/responsive/aml/html/layout/tooltip.html" tabindex='0'>--%>
        <%--                                <p class="title">See all discount</p>--%>
        <%--                                <svg class="icon-info-small" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">--%>
        <%--                                  <g fill="none" fill-rule="evenodd">--%>
        <%--                                      <path fill="#D4D5D7" d="M14.643 7.295A7.322 7.322 0 0 1 0 7.295C0 3.252 3.277 0 7.321 0s7.322 3.252 7.322 7.295"/>--%>
        <%--                                      <path fill="#272F38" d="M6.447 3.993a.875.875 0 1 0 1.749 0 .875.875 0 0 0-1.75 0z"/>--%>
        <%--                                      <path fill="#272F38" fill-rule="nonzero" d="M6.55 6v5.696h1.5V6z"/>--%>
        <%--                                  </g>--%>
        <%--                                </svg>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </a>--%>
        <%--                </div>--%>
        <%--                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">--%>
        <%--                    <a class="product-card" href="#"--%>
        <%--                       onClick="scEvent('product_banner|banner string')">--%>
        <%--                        <div class="product-img J-product-card-img">--%>
        <%--                            <img class="product-img-origin" src="/_ui/responsive/aml/img/product-img1.png" alt="**"/>--%>
        <%--                            <img class="product-img-hover" src="/_ui/responsive/aml/img/Moodshot_Dyson.png" alt="**"/>--%>
        <%--                            <div class="product-img-tag font-bold">Coming Soon</div>--%>
        <%--                        </div>--%>
        <%--                        <div class="product-tag"--%>
        <%--                             style="background: -webkit-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: -moz-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: -o-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: -ms-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);">--%>
        <%--                            <p class="product-tag__p font-SemiBold">Marco Polo Club Exclusive</p>--%>
        <%--                        </div>--%>
        <%--                        <div class="product-description">--%>
        <%--                            <h5 class="product-description-title font-bold">Dyson</h5>--%>
        <%--                            <p class="product-description__p">Dyson White/Silver</p>--%>

        <%--                        </div>--%>
        <%--                        <div class="product-sale">--%>
        <%--                            <p class="product-sale-stock">Out of stock</p>--%>
        <%--                            <p class="product-sale-from">From</p>--%>
        <%--                            <div class="product-sale-delete">--%>
        <%--                                <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">--%>
        <%--                                  <g fill="none" fill-rule="evenodd">--%>
        <%--                                      <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>--%>
        <%--                                      <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>--%>
        <%--                                      <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>--%>
        <%--                                  </g>--%>
        <%--                                </svg>--%>
        <%--                                <del class="price">26,500</del>--%>
        <%--                                <del class="price-per">/HKD&nbsp;45</del>--%>
        <%--                            </div>--%>
        <%--                            <div class="product-sale-price">--%>
        <%--                                <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">--%>
        <%--                                  <g fill="none" fill-rule="evenodd">--%>
        <%--                                      <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>--%>
        <%--                                      <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>--%>
        <%--                                      <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>--%>
        <%--                                  </g>--%>
        <%--                                </svg>--%>
        <%--                                <p class="price font-bold">26,500</p>--%>
        <%--                            </div>--%>
        <%--                            <div class="product-sale-discount J-see-all-discount" --%>
        <%--                                 data-url="/_ui/responsive/aml/html/layout/tooltip.html" tabindex='0'>--%>
        <%--                                <p class="title">See all discount</p>--%>
        <%--                                <svg class="icon-info-small" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">--%>
        <%--                                  <g fill="none" fill-rule="evenodd">--%>
        <%--                                      <path fill="#D4D5D7" d="M14.643 7.295A7.322 7.322 0 0 1 0 7.295C0 3.252 3.277 0 7.321 0s7.322 3.252 7.322 7.295"/>--%>
        <%--                                      <path fill="#272F38" d="M6.447 3.993a.875.875 0 1 0 1.749 0 .875.875 0 0 0-1.75 0z"/>--%>
        <%--                                      <path fill="#272F38" fill-rule="nonzero" d="M6.55 6v5.696h1.5V6z"/>--%>
        <%--                                  </g>--%>
        <%--                                </svg>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </a>--%>
        <%--                </div>--%>
        <%--                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">--%>
        <%--                    <a class="product-card" href="#"--%>
        <%--                       onClick="scEvent('product_banner|banner string')">--%>
        <%--                        <div class="product-img J-product-card-img">--%>
        <%--                            <img class="product-img-origin" src="/_ui/responsive/aml/img/product-img1.png" alt="**"/>--%>
        <%--                            <img class="product-img-hover" src="/_ui/responsive/aml/img/Moodshot_Dyson.png" alt="**"/>--%>
        <%--                            <div class="product-img-tag font-bold">Coming Soon</div>--%>
        <%--                        </div>--%>
        <%--                        <div class="product-tag"--%>
        <%--                             style="background: -webkit-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: -moz-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: -o-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: -ms-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);">--%>
        <%--                            <p class="product-tag__p font-SemiBold">Marco Polo Club Exclusive</p>--%>
        <%--                        </div>--%>
        <%--                        <div class="product-description">--%>
        <%--                            <h5 class="product-description-title font-bold">Dyson</h5>--%>
        <%--                            <p class="product-description__p">Dyson White/Silver</p>--%>

        <%--                        </div>--%>
        <%--                        <div class="product-sale">--%>
        <%--                            <p class="product-sale-stock">Out of stock</p>--%>
        <%--                            <p class="product-sale-from">From</p>--%>
        <%--                            <div class="product-sale-delete">--%>
        <%--                                <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">--%>
        <%--                                  <g fill="none" fill-rule="evenodd">--%>
        <%--                                      <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>--%>
        <%--                                      <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>--%>
        <%--                                      <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>--%>
        <%--                                  </g>--%>
        <%--                                </svg>--%>
        <%--                                <del class="price">26,500</del>--%>
        <%--                                <del class="price-per">/HKD&nbsp;45</del>--%>
        <%--                            </div>--%>
        <%--                            <div class="product-sale-price">--%>
        <%--                                <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">--%>
        <%--                                  <g fill="none" fill-rule="evenodd">--%>
        <%--                                      <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>--%>
        <%--                                      <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>--%>
        <%--                                      <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>--%>
        <%--                                  </g>--%>
        <%--                                </svg>--%>
        <%--                                <p class="price font-bold">26,500</p>--%>
        <%--                            </div>--%>
        <%--                            <div class="product-sale-discount J-see-all-discount" --%>
        <%--                                 data-url="/_ui/responsive/aml/html/layout/tooltip.html" tabindex='0'>--%>
        <%--                                <p class="title">See all discount</p>--%>
        <%--                                <svg class="icon-info-small" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">--%>
        <%--                                  <g fill="none" fill-rule="evenodd">--%>
        <%--                                      <path fill="#D4D5D7" d="M14.643 7.295A7.322 7.322 0 0 1 0 7.295C0 3.252 3.277 0 7.321 0s7.322 3.252 7.322 7.295"/>--%>
        <%--                                      <path fill="#272F38" d="M6.447 3.993a.875.875 0 1 0 1.749 0 .875.875 0 0 0-1.75 0z"/>--%>
        <%--                                      <path fill="#272F38" fill-rule="nonzero" d="M6.55 6v5.696h1.5V6z"/>--%>
        <%--                                  </g>--%>
        <%--                                </svg>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </a>--%>
        <%--                </div>--%>
        <%--                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">--%>
        <%--                    <a class="product-card" href="#"--%>
        <%--                       onClick="scEvent('product_banner|banner string')">--%>
        <%--                        <div class="product-img J-product-card-img">--%>
        <%--                            <img class="product-img-origin" src="/_ui/responsive/aml/img/product-img1.png" alt="**"/>--%>
        <%--                            <img class="product-img-hover" src="/_ui/responsive/aml/img/Moodshot_Dyson.png" alt="**"/>--%>
        <%--                            <div class="product-img-tag font-bold">Coming Soon</div>--%>
        <%--                        </div>--%>
        <%--                        <div class="product-tag"--%>
        <%--                             style="background: -webkit-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: -moz-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: -o-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: -ms-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);--%>
        <%--                             background: linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);">--%>
        <%--                            <p class="product-tag__p font-SemiBold">Marco Polo Club Exclusive</p>--%>
        <%--                        </div>--%>
        <%--                        <div class="product-description">--%>
        <%--                            <h5 class="product-description-title font-bold">Dyson</h5>--%>
        <%--                            <p class="product-description__p">Dyson White/Silver</p>--%>

        <%--                        </div>--%>
        <%--                        <div class="product-sale">--%>
        <%--                            <p class="product-sale-stock">Out of stock</p>--%>
        <%--                            <p class="product-sale-from">From</p>--%>
        <%--                            <div class="product-sale-delete">--%>
        <%--                                <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">--%>
        <%--                                  <g fill="none" fill-rule="evenodd">--%>
        <%--                                      <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>--%>
        <%--                                      <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>--%>
        <%--                                      <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>--%>
        <%--                                  </g>--%>
        <%--                                </svg>--%>
        <%--                                <del class="price">26,500</del>--%>
        <%--                                <del class="price-per">/HKD&nbsp;45</del>--%>
        <%--                            </div>--%>
        <%--                            <div class="product-sale-price">--%>
        <%--                                <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">--%>
        <%--                                  <g fill="none" fill-rule="evenodd">--%>
        <%--                                      <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>--%>
        <%--                                      <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>--%>
        <%--                                      <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>--%>
        <%--                                  </g>--%>
        <%--                                </svg>--%>
        <%--                                <p class="price font-bold">26,500</p>--%>
        <%--                            </div>--%>
        <%--                            <div class="product-sale-discount J-see-all-discount" --%>
        <%--                                 data-url="/_ui/responsive/aml/html/layout/tooltip.html" tabindex='0'>--%>
        <%--                                <p class="title">See all discount</p>--%>
        <%--                                <svg class="icon-info-small" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">--%>
        <%--                                  <g fill="none" fill-rule="evenodd">--%>
        <%--                                      <path fill="#D4D5D7" d="M14.643 7.295A7.322 7.322 0 0 1 0 7.295C0 3.252 3.277 0 7.321 0s7.322 3.252 7.322 7.295"/>--%>
        <%--                                      <path fill="#272F38" d="M6.447 3.993a.875.875 0 1 0 1.749 0 .875.875 0 0 0-1.75 0z"/>--%>
        <%--                                      <path fill="#272F38" fill-rule="nonzero" d="M6.55 6v5.696h1.5V6z"/>--%>
        <%--                                  </g>--%>
        <%--                                </svg>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </a>--%>
        <%--                </div>--%>

        <%--            </div>--%>
        <%--        </div>--%>
        <div>
            <cms:pageSlot position="SectionA3" var="feature" class="">
                <cms:component component="${feature}" class="no-space yComponentWrapper"/>
            </cms:pageSlot>
        </div>
        <c:if test="${not empty product.masterCategoryCode || not empty product.brandName}">
            <div class="container">
                <h2 class="product-layout-title font-light"><spring:theme
                        code="text.product.detail.page.discover.more"/></h2>
                <div class="more-product-box">
                    <c:if test="${not empty product.masterCategoryCode}">
                        <a href="${language}/c/${product.masterCategoryCode}"
                           class="more-product-item">${product.masterCategoryName}</a>
                    </c:if>
                    <c:if test="${not empty product.brandCode}">
                        <a href="${language}/c/${product.brandCode}" class="more-product-item">${product.brandName}</a>
                    </c:if>
                </div>
            </div>
        </c:if>
        <div>
            <cms:pageSlot position="SectionA4" var="feature" class="">
                <cms:component component="${feature}" class="no-space yComponentWrapper"/>
            </cms:pageSlot>
        </div>
        <div class="more-product">
            <!-- <div class="J-overlayout"></div> -->
            <template:javaScriptVariables/>
        </div>
    </jsp:body>
</template:page>
