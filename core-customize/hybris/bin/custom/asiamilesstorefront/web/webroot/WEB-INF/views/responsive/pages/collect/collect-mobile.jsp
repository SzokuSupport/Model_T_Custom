<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/responsive/common/header"%>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Asia Miles iRedeem</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
  </head>
  <body> 
    <!-- show brands in the bottom of page -->
<div class="collect-mobile">
    <div style="padding:10px;border-bottom:1px solid #e8e8e8;">
        <img src="/_ui/responsive/assets/img/header-logo.png" width="40%" alt="iRedeem">
    </div>
    <div style="padding:10px;font-size:16px;color:#272f38;border-bottom:1px solid #e8e8e8">
        <p>Membership No.: <strong>${consignmentData.membershipNo}</strong></p>
        <p>Order No.: <strong>${consignmentData.orderCode}</strong></p>
        <p>Order Date: <strong>${consignmentData.orderDate}</strong></p>
        <p>Order Status: <strong><spring:theme code="asiamiles.consignment.status.display.${consignmentData.status.code}"/></strong></p>
    </div>
    <c:forEach var="entry" items="${consignmentData.entries}">
	    <div style="overflow:hidden;display:flex;padding:15px;margin-bottom:15px;border-bottom:1px solid #e8e8e8">
	        <div style="width:100px;margin-right:10px;">
	            <c:set var="product" value="${entry.orderEntry.product}" />
	            <c:set var="format" value="thumbnail" />
	            <c:set value="${ycommerce:productImage(product, format)}" var="primaryImage"/>
				<c:set value="${fn:escapeXml(product.name)}" var="productNameHtml"/>
				<c:choose>
					<c:when test="${not empty primaryImage}">
						<c:url value="${primaryImage.url}" var="primaryImageUrl" context="${originalContextPath}"/>
						<c:choose>
							<c:when test="${not empty primaryImage.altText}">
								<c:set value="${fn:escapeXml(primaryImage.altText)}" var="altTextHtml"/>
								<img src="${fn:escapeXml(primaryImageUrl)}" alt="${altTextHtml}" title="${altTextHtml}" width="100%"/>
							</c:when>
							<c:otherwise>
				                <img src="${fn:escapeXml(primaryImageUrl)}" alt="${productNameHtml}" width="100%"/>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<theme:image code="img.missingProductImage.responsive.${format}" alt="${productNameHtml}"/>
					</c:otherwise>
				</c:choose>
	        </div>
	        <div>
	            <p style="font-size:16px"><strong>${entry.orderEntry.product.name}</strong></p>
	            <p><spring:theme code="text.order.detail.page.one.order.quantity"/>: ${entry.orderEntry.quantity}</p>
	        </div>
	    </div>
    </c:forEach>
    <div style="background:#fff;padding:20px 0;position:fixed;bottom:0;left:0;right:0;">
    		<c:url var="confirmCollectUrl" value="/evoucher/confirm-collect" />
        <form action="${confirmCollectUrl}" method='post'>
        	    <input type="hidden" name="productCode" value="${productCode}">
            <input type="hidden" name="eVoucherCode" value="${eVoucherCode}">
            <input type="hidden" name="CSRFToken" value="${ycommerce:encodeJavaScript(CSRFToken.token)}"/>
            <c:choose>
            		<c:when test="${consignmentData.status.code eq 'COLLECTED'}">
            			<input value="Collected" disabled style="display:block;height:40px;line-height:40px;background-color:#777;text-align:center; margin:0 auto; width:90%;border: none;">
            		</c:when>
            		<c:otherwise>
            			<input type="submit" value="Collect" style="display:block;height:40px;line-height:40px;background-color:#facf04;text-align:center; margin:0 auto; width:90%;border: none;">
            		</c:otherwise>
            </c:choose>
            
        </form>
    </div>
</div>   
  </body>
</html>