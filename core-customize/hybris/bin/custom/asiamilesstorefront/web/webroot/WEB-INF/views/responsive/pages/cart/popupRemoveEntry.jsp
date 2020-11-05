<%@ page trimDirectiveWhitespaces="true" contentType="application/json" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="remove-cart clearfix">
    <svg class="icon-close J-close-popup" tabindex='0' width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
      <g stroke="none" stroke-width="1" fill-rule="evenodd">
          <g>
              <g transform="translate(2.000000, 2.000000)">
                  <path d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                  <path fill-rule="nonzero" d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                  <g>
                      <mask>
                          <path d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                      </mask>
                  </g>
              </g>
          </g>
      </g>
    </svg>
    <h2 class="title font-light"><spring:theme code="text.cart.page.remove.from.cart"/> </h2>
    <div class="main">
        <p class="brand-name font-bold">${fn:escapeXml(orderEntryData.product.brandName)}</p>
        <p class="product-name">${fn:escapeXml(orderEntryData.product.name)} </p>
        <div class="button-wrap clearfix">
            <c:url value="/cart/entry/${orderEntryData.entryNumber}/remove" var="cartEntryRemoveAction" />
            <a class="button-yellow remove-button font-SemiBold J-remove-cartItem J-close-popup" tabindex='0' data-url="${cartEntryRemoveAction }"><spring:theme code="text.cart.page.remove.from.cart.remove"/> </a>
            <a class="button-white cancel-button font-SemiBold J-close-popup" tabindex='0'><spring:theme code="text.cart.page.remove.from.cart.cancel"/></a>
        </div>
    </div>
</div>

