<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/responsive/formElement" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>

<template:page pageTitle="${pageTitle}">
  <link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
  <link href="/_ui/responsive/aml/css/orderSummaryFail.css" rel="stylesheet">
  <div class="order-summary-fail">
     <div class="order-summary-fail__content">
        <div class="order-summary-fail__content--detail">
            <div class="background">
                <h2 class="title font-SemiBold"><spring:theme code="text.miles.error.page.title"/></h2>
                <!-- <svg class="icon-order-fail">
                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-order-fail"></use>
                </svg> -->
                <img class="icon-order-fail" alt="" src="/_ui/responsive/aml/img/order-error.gif" />
            </div>
             <div class="error">
	            <c:choose>
	                    <c:when test="${language eq 'zh_TW' || language eq 'zh'}">
	                        <p class="error__message"><spring:theme code="text.miles.error.page.failure.description1"/>
	                            <a href="#"><spring:theme code="text.miles.error.page.failure.description2"/></a>
	                        </p>
	                    </c:when>
	                    <c:otherwise>
	                        <p class="error__message"><spring:theme code="text.miles.error.page.failure.description1"/>
	                            <a href="#"><spring:theme code="text.miles.error.page.failure.description2"/></a>
	                            <spring:theme code="text.miles.error.page.failure.description3"/>
	                        </p>
	                    </c:otherwise>
	           		 </c:choose>
               <div class="line-btn font-SemiBold J-back-home"><spring:theme code="text.order.summary.page.back.to.home"/></div>
           </div>
        </div>
     </div>
  </div>
  <script src="/_ui/responsive/aml/js/common.js"></script>
  <script src="/_ui/responsive/aml/js/orderSummaryFail.js"></script>
  <script src="/_ui/responsive/aml/js/applyAllPages.js"></script>
</template:page>
