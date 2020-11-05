
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:url value="${component.url}" var="productUrl"/>
<!-- lists -->
	<c:choose>
	<c:when test="${true eq component.isFullImage}">
 		<div class="item-list <c:if test="${true eq component.textInWhite }">font-black</c:if>">  
 	</c:when>
 	<c:otherwise>
 		<div class="promotion-banner <c:if test="${true eq component.textInWhite }">font-black</c:if>">
 	</c:otherwise>
 	</c:choose>
 	<!-- <div class="item-list">  for fullimage    -->    
        <div class="img">
        <a href="${fn:escapeXml(productUrl)}" tabindex="0" aria-label="${fn:escapeXml(displayDescription1)}- Graphic- Clickable" event_component="promotion_nav_Images" event_value="${fn:escapeXml(displayDescription1)}:${fn:escapeXml(displayDescription2)}" event_position="1-1">
			<c:choose>
				<c:when test="${not empty component.displayMedia}">
	             <%--<iframe class="video lazy" title="" data-src="${component.displayMedia}" frameborder=0 'allowfullscreen'></iframe>--%>
					<div class="videoBox">
						<iframe class="video lazy" title="" data-src="${component.displayMedia}" frameborder=0 'allowfullscreen'></iframe>
					</div>
           	</c:when>
           	<c:otherwise>
           		<picture>
	                <source media="(max-width: 768px)" data-srcset="${fn:escapeXml(component.displayImage.url)}">
	                <source media="(min-width: 768px) and (max-width: 1280px)" data-srcset="${fn:escapeXml(component.displayImage.url)}">
	                <img class="cross-sale" src="${fn:escapeXml(component.displayImage.url)}" alt="This is a picture">
	            </picture>
           	</c:otherwise>
        </c:choose>
        </a>
        </div>
        <div class="description">
            <h2 class="headline font-SemiBold">${fn:escapeXml(displayDescription1)}</h2>
            <p class="info">${fn:escapeXml(displayDescription2)}</p>
            <c:if test="${not empty component.url}">
            	<a class="button-yellow font-SemiBold" href="${fn:escapeXml(productUrl)}" event_component="promotion_nav_CTA" event_position="1-1" event_value="${fn:escapeXml(displayDescription1)}:${fn:escapeXml(displayDescription2)}">${fn:escapeXml(displayButtonName)}</a>
            </c:if>
        </div>
    </div>
