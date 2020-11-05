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
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/responsive/common/header" %>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer" %>
<%@ page import="com.asiamiles.core.enums.PaymentMethod" %>

<c:set var="MILESPLUSCASH" value="<%=PaymentMethod.MILESPLUSCASH %>" scope="session"/>

<template:page pageTitle="${pageTitle}">

    <jsp:attribute name="pageCss">
        <link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
        <link href="/_ui/responsive/aml/css/cartPage.css" rel="stylesheet">
        <link href="/_ui/responsive/aml/css/emptyCart.css" rel="stylesheet">
    </jsp:attribute>
    <jsp:attribute name="pageScripts">
        <script src="/_ui/responsive/aml/js/common.js"></script>
        <script src="/_ui/responsive/aml/js/cartPage.js"></script>
        <script src="/_ui/responsive/aml/js/cartPagePlugin.js"></script>
        <script src="/_ui/responsive/aml/js/applyAllPages.js"></script>
    </jsp:attribute>
    <jsp:body>
        <c:choose>
            <c:when test="${not empty cartData.entries}">
                <div class="cartPage">
                    <cart:cartMessages/>
                    <cart:cartItems cartData="${cartData}"/>
                    <cart:cartTotals cartData="${cartData}"/>
                </div>
                </div>
                </div>
                <!-- /cart item -->
                </div>
            </c:when>
            <c:otherwise>
                <cart:emptyCart/>
            </c:otherwise>
        </c:choose>
        <template:javaScriptVariables/>
    </jsp:body>

</template:page>
