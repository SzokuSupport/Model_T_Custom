<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<spring:htmlEscape defaultHtmlEscape="true" />

<c:choose>
	<c:when test="${not empty component.displayContentDetailInfoComponents}">
    <div class="top-banner clearfix J-topBanner">
	   <c:forEach items="${component.displayContentDetailInfoComponents}" var="contentDetailInfo" begin="1" varStatus="looper">
		 <!-- lists -->
		   <c:set var="looper" scope="request" value="${looper}"/>
	   	<cms:component component="${contentDetailInfo}" class="no-space yComponentWrapper"/>
	    </c:forEach>
    </div>	
	</c:when>
	<c:otherwise>
		<component:emptyComponent/>
	</c:otherwise>
</c:choose>
