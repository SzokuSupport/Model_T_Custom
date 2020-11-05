<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:if test="${not empty component.promotionCards}">
	<div class="container promotion-product"> 
   	<h3 class="font-SemiBold">${component.title}</h3>
    	<div class="promotion-product-content J-latestGadgets">
    		<c:forEach items="${component.promotionCards}" var="promotionCart" begin="1" varStatus="looper">
	 			<c:if test="${not empty promotionCart }">
	 				<c:set var="looper" scope="request" value="${looper}"/>
					<c:set var="topTitle" scope="request" value="${component.title}"/>
	 				<cms:component component="${promotionCart}" class="no-space yComponentWrapper"/>
	 			</c:if>
	 		</c:forEach>
    	</div>
	</div>
</c:if>