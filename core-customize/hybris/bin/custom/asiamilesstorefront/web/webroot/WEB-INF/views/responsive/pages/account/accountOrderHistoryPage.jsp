<%@ page trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/responsive/common/header" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>

<template:page pageTitle="${pageTitle}">
    <link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
    <link href="/_ui/responsive/aml/css/orderList.css" rel="stylesheet">
    <link href="/_ui/responsive/aml/css/emptyCart.css" rel="stylesheet">

    <c:if test="${not empty searchPageData.results}">
        <div class="container order-list-container">
            <!-- backend input -->
            <input type="hidden" value="/my-account/order-list" id="J-initOrderListUrl"/>
            <input type="hidden" value="${searchPageData.pagination.numberOfPages}" id="J-totalPage"/>
            <input type="hidden" value="0" id="J-getCurrentPage"/>
            <input type="hidden" value="${searchPageData.pagination.pageSize }" id="J-getCurrentPageSize"/>
            <input type="hidden" id="resFlag" value="true"/>
            <!--/ -->
            <h1 class="title font-light"><spring:theme code="text.order.history.page.title"/></h1>
            <p class="text">
                <spring:theme code="text.order.history.page.text1"/>
                <br>
                <br>
                <spring:theme code="text.order.history.page.text2"/>
            </p>
            <div class="order-list-content clearfix J-order-list">
                <c:forEach items="${searchPageData.results}" var="order">
                    <order:accountOrderCard order="${order}"/>
                </c:forEach>
            </div>
            <div class="loading-img J-loadingImg">
                <img src="/_ui/responsive/aml/img/loading.png" alt=""/>
            </div>
            <p class="load-more-btn font-SemiBold" id="J-loadMore"><spring:theme
                    code="text.order.list.page.load.more"/></p>

        </div>
    </c:if>
    <c:if test="${empty searchPageData.results}">
        <div class="empty-cart">
            <h2 class="empty-cart-headline"><span class="text font-light"><spring:theme
                    code="text.order.history.page.title"/></span></h2>

            <div class="empty-cart--content">
                <p class="title"><spring:theme code="text.order.list.order.empty.title"/></p>
                <p class="detail"><spring:theme code="text.order.list.order.empty.description"/></p>
                <a href="javascript:;" class="button-yellow font-SemiBold J-back-home content"><spring:theme
                        code="text.order.list.order.empty.continue.shopping"/></a>
            </div>
        </div>
    </c:if>
    <script src="/_ui/responsive/aml/js/common.js"></script>
    <script src="/_ui/responsive/aml/js/orderList.js"></script>
    <script src="/_ui/responsive/aml/js/emptyCart.js"></script>
    <script src="/_ui/responsive/aml/js/orderListPlugin.js"></script>
    <script src="/_ui/responsive/aml/js/applyAllPages.js"></script>
</template:page>