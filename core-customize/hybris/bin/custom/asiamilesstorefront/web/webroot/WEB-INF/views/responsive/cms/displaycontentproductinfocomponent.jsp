<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:choose>
	<c:when test="${not empty displayContentProductComponentInfoData}">
	<div class="container promotion-product"> 
    <h3 class="font-SemiBold">${title}</h3>
    <div class="promotion-product-content J-inspiration">
     	<c:forEach items="${displayContentProductComponentInfoData}" var="contentProductInfo" begin="1" varStatus="looper">
			<c:set var="looper" scope="request" value="${looper}"/>
			<c:set var="topTitle" scope="request" value="${title}"/>
			<cms:component component="${contentProductInfo}" class="no-space yComponentWrapper"/>
      </c:forEach>
        <!-- /item list -->
    </div>
</div>
	</c:when>
	<c:otherwise>
		<component:emptyComponent/>
	</c:otherwise>
</c:choose>
