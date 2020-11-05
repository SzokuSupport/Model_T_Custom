<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:if test="${not empty medias }">
	<c:forEach items="${medias}" var="media">
		<c:choose>
			<c:when test="${empty imagerData}">
				<c:set var="imagerData">"${ycommerce:encodeJSON(media.width)}":"${ycommerce:encodeJSON(media.url)}"</c:set>
			</c:when>
			<c:otherwise>
				<c:set var="imagerData">${imagerData},"${ycommerce:encodeJSON(media.width)}":"${ycommerce:encodeJSON(media.url)}"</c:set>
			</c:otherwise>
		</c:choose>
		<c:if test="${empty altText}">
			<c:set var="altTextHtml" value="${fn:escapeXml(media.altText)}"/>
		</c:if>
	</c:forEach>
</c:if>
<div class="our-promise clearfix">
    <div class="container our-promise-container">
        <div class="row">
            <!-- lists -->
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 item-list">  
            	<c:set var="imagerDataJson" value="{${imagerData}}"/>      
                <div class="img-wrap">
                    <!-- <picture>
                        <source media="(max-width: 766px)" data-srcset="/_ui/responsive/aml/img/Mobile_We_offer.png">
                        <source media="(min-width: 768px) and (max-width: 1280px)" data-srcset="/_ui/responsive/aml/img/Desktop_we_offer.png">
                        <img class="lazy" data-src="/_ui/responsive/aml/img/Desktop_we_offer.png" data-srcset="" alt="this is a picture">
                    </picture> -->
                    <img class="js-responsive-image lazy" data-media='${fn:escapeXml(imagerDataJson)}' alt='${altTextHtml}' style="">  
                </div>
            </div>
            <!-- /lists -->
        </div>
    </div>
</div>
