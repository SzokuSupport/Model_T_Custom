<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="galleryImages" required="true" type="java.util.List" %>


<div class="product-img--for J-sliderNav">
    <c:forEach items="${galleryImages}" var="container" varStatus="varStatus">
        <div class="item-list J-zoomInImages" data-url="/_ui/responsive/aml/html/layout/productImagesZoomIn.html">
            <img class="item-list__img" src="${fn:escapeXml(container.thumbnail.url)}" alt="${fn:escapeXml(container.thumbnail.altText)}">
        </div>
    </c:forEach>
</div>
<%--<div class="sub-image">
    <c:forEach items="${galleryImages}" var="container" varStatus="varStatus">
    <div class="sub-image-item">
        <a href="#" class="item"> <img class="lazyOwl" src="${fn:escapeXml(container.thumbnail.url)}" alt="${fn:escapeXml(container.thumbnail.altText)}"></a>
    </div>
    </c:forEach>
</div>--%>
