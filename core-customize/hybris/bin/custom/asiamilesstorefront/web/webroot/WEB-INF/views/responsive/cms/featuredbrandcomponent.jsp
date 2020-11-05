<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<spring:htmlEscape defaultHtmlEscape="true" />
<div class="container promotion-brands"> 
  	<h3 class="font-SemiBold">${component.title}</h3>
  	<c:if test="${not empty brands }">
   	<div class="promotion-brands-content J-promotionBrands">
   		<c:forEach items="${brands}" var="brand"  varStatus="looper">
   			<c:set var="brandLogo" value="${brand.brandLogo}" />
       		<div class="item-list">
       			<c:url var="brandUrl" value="/c/${brand.code}" />
          		<a class="promotion-brands-card content" href="${brandUrl }" tabindex="0" aria-label="Clickable brand ${fn:escapeXml(brand.name)} - Graphics- Open in a new window"
				   event_component="promotion_nav" event_value="${brand.name}" event_position="${looper.index}">
              	<div class="promotion-brands-img">
              		<picture>
               			<source media="(max-width: 768px)" data-srcset="${fn:escapeXml(brandLogo.url)}">
                  		<source media="(min-width: 768px) and (max-width: 1280px)" data-srcset="${fn:escapeXml(brandLogo.url)}">
                    		<img class="lazy brands__img" data-src="${fn:escapeXml(brandLogo.url)}" alt="${fn:escapeXml(brand.name)}">
              		</picture>
              	</div>
           	</a>
      	 	</div>
		</c:forEach>
   	</div>
   	</c:if>
</div>

