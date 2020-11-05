<%@ page trimDirectiveWhitespaces="true" contentType="application/json" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product"%>

{"addedItemQuantity": "${not empty cartModification.quantityAdded ? cartModification.quantityAdded : quantity}",
"errorMsg": "<spring:theme code="${errorMsg}" arguments="${cartItemMax}"/>",
"cartData": {
    "code": "${cartData.code}",
    "totalUnitCount": "<fmt:formatNumber value="${cartData.totalUnitCount}" maxFractionDigits="3"/>",
    "totalPrice": "<fmt:formatNumber value="${cartData.totalPrice.value}" maxFractionDigits="3"/>",
    "totalPriceCash": "<fmt:formatNumber value="${cartData.totalPriceCash.value}" maxFractionDigits="3"/>",
"page":
"<spring:escapeBody javaScriptEscape="true">
<div class="info">
   ${cartModification.quantityAdded} item has been added
</div>
<c:url value="/cart" var="cartUrl"/>

<div class="cart-items">
  <product:productPrimaryImage product="${cartModification.entry.product}" format="thumbnail"/>
  <p>${fn:escapeXml(cartModification.entry.product.name)}</p>
</div>

<div class="cart-link">
  <a href="${cartUrl}" class="view-cart fl">View Cart</a>
  <a href="" class="proceed-to-redeem fr">Proceed to redeem</a>
</div>
<img class="close J-close" src="/_ui/responsive/assets/svg/cross.svg" alt="">
</spring:escapeBody>"
}}



