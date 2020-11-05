<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>
<%@ attribute name="format" required="true" type="java.lang.String" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<c:set value="${fn:escapeXml(product.name)}" var="productNameHtml"/>

<c:choose>
    <c:when test="${not empty product.img1ForPLP}">
        <c:choose>
            <c:when test="${not empty product.img2ForPLP}">
                <img class="product-img-origin" src="${fn:escapeXml(product.img1ForPLP)}" alt="" title=""/>
                <img class="product-img-hover" src="${fn:escapeXml(product.img2ForPLP)}" alt="" title=""/>
            </c:when>
            <c:otherwise>
                <img class="product-img-origin" src="${fn:escapeXml(product.img1ForPLP)}" alt="" title=""/>
                <img class="product-img-hover" src="${fn:escapeXml(product.img1ForPLP)}" alt="" title=""/>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <theme:image code="img.missingProductImage.responsive.${format}" alt="${productNameHtml}"/>
    </c:otherwise>
</c:choose>
