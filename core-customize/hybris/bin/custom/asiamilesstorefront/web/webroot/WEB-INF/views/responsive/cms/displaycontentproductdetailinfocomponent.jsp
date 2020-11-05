<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:url value="${component.url}" var="productUrl"/>
<!-- item list -->

<div class="item-list">
   <a class="promotion-product-card content" href="${fn:escapeXml(productUrl)}" tabindex="0" aria-label="${fn:escapeXml(displayName)}-${fn:escapeXml(displayDescription)} - Graphics- Open in a new window" event_component="promotion_nav" event_value="${fn:escapeXml(topTitle)}:${fn:escapeXml(displayDescription)}" event_position="${looper.index}">
       <div class="promotion-product-img">
          <picture>
              <source media="(max-width: 768px)" data-srcset="${fn:escapeXml(component.displayImage.url)}">
              <source media="(min-width: 768px) and (max-width: 1280px)" data-srcset="${fn:escapeXml(component.displayImage.url)}">
              <img class="cross-sale" src="${fn:escapeXml(component.displayImage.url)}" alt="this is a picture">
          </picture>
      </div>
      <div class="description">
          <p class="brand-name font-bold">${fn:escapeXml(displayName)}</p>
          <p class="product-name">${fn:escapeXml(displayDescription)}</p>
          <c:if test="${not empty contentFrom}">
          <p class="text-from">${fn:escapeXml(contentFrom)}</p>
          </c:if>
          <c:if test="${not empty component.strikeThroughMilesPrice}">
          <p class="original-price">
              <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                <g fill="none" fill-rule="evenodd">
                    <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                    <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                    <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                </g>
              </svg>
              <del class="price">${fn:escapeXml(component.strikeThroughMilesPrice)}</del>
              <!-- <del class="price-HKD">/ HKD9,900</del> -->
          </p>
          </c:if>
          <c:if test="${not empty component.milesPrice}">
          <p class="discounted-price">
              <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                    <g fill="none" fill-rule="evenodd">
                        <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                        <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                        <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                    </g>
              </svg>
              <span class="price font-bold"><fmt:formatNumber value="${component.milesPrice}" maxFractionDigits="0"/></span>
              <span class="price-HKD">/&nbsp;${fn:escapeXml(component.contentCurrency)}&nbsp;<span class="font-bold">${fn:escapeXml(component.cashPrice)}</span></span>
              <!-- <span class="price-HKD">/ HKD <span class="font-bold">9,900</span></span> -->
          </p>
          </c:if>
          <c:if test="${not empty earnMilesRelatedMessage}">
        	 <p class="eligible-to-earn-miles">
              <span class="icon-yellow">
                  <img src="/_ui/responsive/aml/img/earn.svg" />
              </span>
              <span class="font-bold">${earnMilesRelatedMessage}</span>
          </p>
         </c:if>
       </div>    
   </a>
</div>