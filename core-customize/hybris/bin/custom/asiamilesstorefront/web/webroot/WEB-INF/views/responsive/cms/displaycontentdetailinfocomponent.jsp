<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:url value="${component.url}" var="productUrl"/>
<c:forEach items="${medias}" var="mediax">
	<c:choose>
		<c:when test="${empty imagerData}">
			<c:set var="imagerData">"${ycommerce:encodeJSON(mediax.width)}":"${ycommerce:encodeJSON(mediax.url)}"</c:set>
		</c:when>
		<c:otherwise>
			<c:set var="imagerData">${imagerData},"${ycommerce:encodeJSON(mediax.width)}":"${ycommerce:encodeJSON(mediax.url)}"</c:set>
		</c:otherwise>
	</c:choose>
	<c:if test="${empty altText}">
		<c:set var="altTextHtml" value="${fn:escapeXml(mediax.altText)}"/>
	</c:if>
</c:forEach>
<!-- lists -->
 	<div class="item-list" event_component="hero_banner" event_value="${fn:escapeXml(displayName)}" event_position="${requestScope.looper.index}">
      <div class="img">
	      <c:set var="imagerDataJson" value="{${imagerData}}"/>	
	      <c:choose>
				<c:when test="${empty productUrl || productUrl eq '#'}">
					<img class="js-responsive-image cross-sale" alt="" data-media='${fn:escapeXml(imagerDataJson)}' style="">
				</c:when>
				<c:otherwise>
					<a href="${fn:escapeXml(productUrl)}">
						<img class="js-responsive-image cross-sale" alt="" data-media='${fn:escapeXml(imagerDataJson)}' style="">
					</a>
				</c:otherwise>
			</c:choose>
      </div>
      <c:if test="${ not empty displayName ||  not empty displayDescription}">
	      <div class="description">
	          <h2 class="headline font-bold">${fn:escapeXml(displayName)}</h2>
	          <p class="font-light info">${fn:escapeXml(displayDescription)}</p>
	      </div>
      </c:if>
  	</div>
