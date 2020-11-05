<%@ page trimDirectiveWhitespaces="true" contentType="application/json" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:choose>
	<c:when test="${not empty cartData.entries}">
		<cart:cartMessages/>

		<cart:cartItems cartData="${cartData}"/>

		<cart:cartTotals cartData="${cartData}"/>
	</c:when>
	<c:otherwise>
		<cart:emptyCart/>
	</c:otherwise>
</c:choose>





