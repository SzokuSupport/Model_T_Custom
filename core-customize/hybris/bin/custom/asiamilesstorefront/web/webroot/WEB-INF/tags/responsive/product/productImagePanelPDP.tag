<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="galleryImages" required="true" type="java.util.List" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>

<!-- product images -->
<product:productGalleryThumbnail galleryImages="${galleryImages}"/>
<div class="product-img--nav J-sliderFor">
    <c:forEach items="${galleryImages}" end="0" var="container" varStatus="varStatus">
        <div class="item-list">
            <img src="${fn:escapeXml(container.product.url)}"
                 data-zoom-image="${fn:escapeXml(container.superZoom.url)}"
                 alt="${fn:escapeXml(container.thumbnail.altText)}">
        </div>
    </c:forEach>
</div>


<%--
<div class="product-image-display col-xs-12 col-sm-5 col-md-6">
    <c:choose>
        <c:when test="${galleryImages == null || galleryImages.size() == 0}">
	        <div class="main-image">
                 <spring:theme code="img.missingProductImage.responsive.product" var="imagePath" htmlEscape="false"/>
                 <img class="lazyOwl" src="${fn:escapeXml(imagePath)}" width="100%"/>
	                
        </div>
        </c:when>
        <c:otherwise>
                <c:forEach items="${galleryImages}" end="0" var="container" varStatus="varStatus">
                <div class="main-image">
                    <div class="item">
                        <div>
                            <img class="lazyOwl" src="${fn:escapeXml(container.product.url)}"
                                 data-zoom-image="${fn:escapeXml(container.superZoom.url)}"
                                 alt="${fn:escapeXml(container.thumbnail.altText)}" width="100%">
                        </div>
                    </div>
                    </div>
                </c:forEach>
            <product:productGalleryThumbnail galleryImages="${galleryImages}"/>
        </c:otherwise>
    </c:choose>
</div>--%>
