<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:choose>
	<c:when test="${not empty displayContentImageComponentInfoData}">
		<div class="container promotion-fullwidth clearfix J-promotionFullWidth">
	    <!-- lists -->
	    <c:forEach items="${displayContentImageComponentInfoData}" var="contentImageInfo">
	    	<cms:component component="${contentImageInfo}" class="no-space yComponentWrapper"/>
	    </c:forEach>
	    <!-- /lists -->
		</div>
	</c:when>
	<c:otherwise>
		<component:emptyComponent/>
	</c:otherwise>
</c:choose>
