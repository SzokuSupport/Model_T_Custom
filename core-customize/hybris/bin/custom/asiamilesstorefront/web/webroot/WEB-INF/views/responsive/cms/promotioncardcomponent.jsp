<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="htmlmeta" uri="http://hybris.com/tld/htmlmeta"%>

<c:if test="${empty product || product.dispalyHomePage}">
<spring:htmlEscape defaultHtmlEscape="true" />
<c:url var="productUrl" value="${not empty product ? product.url : 'javascript:;'}" />
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
<!-- item list -->

<div class="item-list">
	<a class="promotion-product-card content" href="${productUrl }" tabindex="0" aria-label="Product Type:${fn:escapeXml(product.name)}.
	Mile required to Order:${product.price.value} Miles.Clickable" event_component="promotion_nav" event_value="Product Type:${fn:escapeXml(product.name)}.
   Mile required to Order:${product.price.value} Miles.Clickable" event_position="${requestScope.looper.index}">
	
		<div class="promotion-product-img">
		 	<c:set var="imagerDataJson" value="{${imagerData}}"/>	
          <img class="js-responsive-image cross-sale" data-media="${fn:escapeXml(imagerDataJson)}" alt="">
		</div>
      <div class="description">
         <p class="brand-name font-bold">${fn:escapeXml(product.brandName)}</p>
         <p class="product-name">${fn:escapeXml(product.name)}</p>
         <c:if test="${not empty contentFrom}">
	      	<p class="text-from">${fn:escapeXml(component.contentFrom)}</p>
	      </c:if>
      	<c:choose>
				<c:when test="${!empty product.promotionPrice}">
              <p class="original-price">
                  <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
					<g fill="none" fill-rule="evenodd">
						<path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
						<path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
						<path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
					</g>
                  </svg>
                  <del class="price"><fmt:formatNumber value="${product.price.value}" maxFractionDigits="0"/></del>
                  <c:if test="${product.cashOnly eq true }">
                  <del class="price-HKD">/&nbsp;${product.currency}&nbsp;<fmt:formatNumber
                                    value="${product.originFullCashPrice}" minFractionDigits="2"/></del>
                  </c:if>
              </p>
              <p class="discounted-price">
                  <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
					<g fill="none" fill-rule="evenodd">
						<path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
						<path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
						<path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
					</g>
                  </svg>
                  <span class="price font-bold"><fmt:formatNumber value="${product.promotionPrice.value}" maxFractionDigits="0"/> </span>
                   <c:if test="${product.cashOnly eq true}">
                  <span class="price-HKD">/&nbsp;${product.currency}&nbsp;<span class="font-bold"><fmt:formatNumber
                                    value="${product.fullCashPrice}" minFractionDigits="2"/></span></span>
                  </c:if>
              </p>
				</c:when>
				<c:otherwise>
				<p class="discounted-price">
				    <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
				        <g fill="none" fill-rule="evenodd">
							<path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
							<path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
							<path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
						</g>
				    </svg>
				    <span class="price font-bold"><fmt:formatNumber value="${product.price.value}" maxFractionDigits="0"/></span>
				     <c:if test="${product.cashOnly eq true}">
				    <span class="price-HKD">/&nbsp;${product.currency}&nbsp;<span class="font-bold"><fmt:formatNumber value="${product.fullCashPrice}" minFractionDigits="2"/></span></span>
				    </c:if>
				</p>
 				</c:otherwise>
			</c:choose>
			<c:if test="${not empty earnMilesRelatedMessage}">
        	 <p class="eligible-to-earn-miles">
              <span class="icon-yellow">
                  <img src="/_ui/responsive/aml/img/earn.svg" />
              </span>
              <span class="font-bold">${earnMilesRelatedMessage }</span>
          </p>
         </c:if>
		</div>    
    </a>
</div>
</c:if>