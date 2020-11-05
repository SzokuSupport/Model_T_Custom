<%@ page trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/responsive/common/header"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="orderDetail" tagdir="/WEB-INF/tags/responsive/order/orderDetail"%>

<template:page pageTitle="${pageTitle}">
	<c:choose>
		<c:when test="${'IREDEEM_V1' eq orderData.orderType }">
			<orderDetail:orderDetailVersion1 order="${orderData}"/>
		</c:when>
		<c:otherwise>
			<orderDetail:orderDetailVersion2 order="${orderData}" orderDetail="${orderDetailData}"/>
		</c:otherwise>
	</c:choose>
</template:page>