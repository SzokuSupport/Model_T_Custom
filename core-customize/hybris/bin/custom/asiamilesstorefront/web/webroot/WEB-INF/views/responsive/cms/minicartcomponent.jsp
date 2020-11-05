<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<spring:htmlEscape defaultHtmlEscape="true" />

<spring:url value="/cart/miniCart/{/totalDisplay}" var="refreshMiniCartUrl" htmlEscape="false">
	<spring:param name="totalDisplay"  value="${totalDisplay}"/>
</spring:url>
<spring:url value="/cart/rollover/{/componentUid}" var="rolloverPopupUrl" htmlEscape="false">
	<spring:param name="componentUid"  value="${component.uid}"/>
</spring:url>
<c:url value="/cart" var="cartUrl"/>

<a href="${cartUrl}"
	class="header-cart"
		data-mini-cart-url="${fn:escapeXml(rolloverPopupUrl)}"
		data-mini-cart-refresh-url="${fn:escapeXml(refreshMiniCartUrl)}" 
		data-mini-cart-name="<spring:theme code='text.cart'/>"
		data-mini-cart-empty-name="<spring:theme code='popup.cart.empty'/>"
		data-mini-cart-items-text="<spring:theme code='basket.items'/>"
		tabindex='4' aria-label="${cartTotalUnitCount lt 100 ? fn:escapeXml(cartTotalUnitCount) : '99+'} item added in Cart"> 
    <svg class="header-icon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="25" viewBox="0 0 24 25">
      <g fill-rule="evenodd" transform="translate(1 .3)">
          <path stroke="#272F38" stroke-width=".5" d="M7.639 22.17c.563 0 1.022-.45 1.022-1.002s-.459-1.001-1.022-1.001c-.564 0-1.023.449-1.023 1 0 .553.459 1.002 1.023 1.002zm0-3.334c1.312 0 2.38 1.046 2.38 2.332 0 1.286-1.068 2.332-2.38 2.332-1.313 0-2.381-1.046-2.381-2.332 0-1.286 1.068-2.332 2.38-2.332zm9.203 3.333c.563 0 1.022-.449 1.022-1.001 0-.552-.459-1.001-1.022-1.001-.564 0-1.023.449-1.023 1 0 .553.459 1.002 1.023 1.002zm0-3.333c1.312 0 2.38 1.046 2.38 2.332 0 1.286-1.068 2.332-2.38 2.332-1.313 0-2.382-1.046-2.382-2.332 0-1.286 1.069-2.332 2.382-2.332zm1.989-6.534l1.595-6.23H5.112L6.861 13.3l11.97-.998zm3.083-7.367a.693.693 0 0 1 .13.604l-1.943 7.593a.715.715 0 0 1-.637.53L6.691 14.727l-.303 1.789h12.69v1.408H5.54a.727.727 0 0 1-.548-.249.692.692 0 0 1-.16-.57l.532-3.148a.68.68 0 0 1 .114-.267L2.73 2.337 0 1.317.513 0l3.086 1.154a.71.71 0 0 1 .444.495l.729 3.015h16.576c.22 0 .43.1.566.271z"/>
      </g>
  </svg>
  
  <c:choose>
    <c:when test="${cartTotalUnitCount == 0}">
      <span class="num font-SemiBold J-header-cart "></span>
    </c:when>
    <c:otherwise>
      <span class="num font-SemiBold J-header-cart ">${cartTotalUnitCount lt 100 ? fn:escapeXml(cartTotalUnitCount) : "99+"}</span>
    </c:otherwise>
  </c:choose>
  
</a>
