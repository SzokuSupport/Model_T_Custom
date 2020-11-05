<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:choose>
	<c:when test="${not empty component.paragraphContent || not empty title}">
	 <div class="container promotion-campaign clearfix all-electrionic"> 
	    <div class="promotion-campaign-content">
	        <div class="electrionic-sports">
	        		<c:if test="${not empty title }">
	            <h5 class="font-SemiBold title electrionic-sports-title">${title }</h5>
	            </c:if>
	            <cms:component component="${component.paragraphContent}" class="no-space yComponentWrapper"/>
	        </div>
	    </div>
	</div>
	</c:when>
	<c:otherwise>
		<component:emptyComponent/>
	</c:otherwise>
</c:choose>
