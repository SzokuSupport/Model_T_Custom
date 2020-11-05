<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format"%>
<%@ taglib prefix="component" tagdir="/WEB-INF/tags/shared/component"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="htmlmeta" uri="http://hybris.com/tld/htmlmeta"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:choose>
	<c:when test="${not empty productData}">
		<div class="container home-product-card">
   		<h3 class="font-SemiBold">${title}</h3>
			<div class="home-product-card-content J-homeProductCard">
				<c:forEach items="${productData}" var="product"  begin="1" varStatus="looper">
					<c:if test="${product.dispalyHomePage}">
						<spring:htmlEscape defaultHtmlEscape="true" />
						<c:url var="productUrl" value="${not empty product ? product.url : 'javascript:;'}" />
						<!-- item list -->
						<div class="item-list">
							<a class="product-card" href="${productUrl }" event_component="promotion_nav" event_value="${fn:escapeXml(title)}:${fn:escapeXml(product.name)}" event_position="${looper.index}">
							<div class="product-img J-product-card-img whiteBg">
									<c:set var="productImageUrl" value="/_ui/responsive/theme-alpha/images/missing_product_EN_300x300.jpg" />
									<c:set var="imageCount" value="0"/>
									<c:set var="productImageUrlHover" value=""/>
									<c:forEach items="${product.images}" var="image">
										<c:choose>
											<c:when test="${imageCount eq '0' and 'GALLERY' eq image.imageType }">
												<c:set var="productImageUrl" value="${fn:escapeXml(image.url)}"/>
												<c:set var="imageCount" value="1"/>
											</c:when>
											<c:when test="${'GALLERY' eq image.imageType}">
												<c:set var="productImageUrlHover" value="${fn:escapeXml(image.url)}"/>
											</c:when>
										</c:choose>
									</c:forEach>
									<img class="product-img-origin" src="${productImageUrl}" alt="${fn:escapeXml(product.name)}"/>
									<c:if test="${empty productImageUrlHover }">
										<c:set var="productImageUrlHover" value="${productImageUrl}"/>
									</c:if>
                    			<img class="product-img-hover" src="${productImageUrlHover}" alt="${fn:escapeXml(product.name)}"/>
                    			<c:if test="${not empty product.productTag }">
	                   			<div class="product-img-tag font-bold">${product.productTag}</div>
                    			</c:if>
								</div>
								<c:if test="${not empty product.productTagGroupB}">
                            <c:choose>
                                <c:when test="${product.productTagGroupB.colour eq 'GREEN'}">
                                    <p class="product-tag font-bold"
                                       style="background: -webkit-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                background: -moz-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                background: -o-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                background: -ms-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                                background: linear-gradient(right, #428c85, #00645a, #00645a, #428c85);">
                                            ${product.productTagGroupB.name}
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <p class="product-tag font-bold"
                                       style="background: -webkit-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                background: -moz-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                background: -o-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                background: -ms-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                                background: linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);">
                                            ${product.productTagGroupB.name}
                                    </p>
                                </c:otherwise>
                            </c:choose>
			                </c:if>
								<div class="product-description">
			                    <h5 class="product-description-title font-bold">${fn:escapeXml(product.brandName)}</h5>
			                    <p class="product-description__p">${fn:escapeXml(product.name)}</p>
			               </div>
			               <div class="product-sale">
			                	 <c:if test="${product.stock.stockLevel lt 1 }">
			                   	 <p class="product-sale-stock"><spring:theme code="text.product.detail.page.variant.out.of.stock"/></p>
			                	 </c:if>
			                	 <c:if test="${product.variantPriceFromDisplay}">
				                   <p class="product-sale-from"><spring:theme code="text.product.list.page.product.card.from" /></p>
			                	 </c:if>
							   <c:if test="${product.havePublishedPotentialBonusRules eq true}">
								   <div class="product-sale-earn-miles">
									   <span class="icon-yellow"><img src="/_ui/responsive/aml/img/earn.svg"/></span>
									   <p class="font-bold"><spring:theme code="text.product.list.page.bonus.message"/></p>
								   </div>
							   </c:if>
							   <c:set var="promotionPrice" value="${product.price}"/>
			                   <c:if test="${not empty product.promotionPrice}">
				                	 <c:set var="promotionPrice" value="${product.promotionPrice}"/>
	                       		 <div class="product-sale-delete">
			                      		<svg class="icon-yellow">
				                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-yellow" />
				                        </svg>
				                        <del class="price J-format-price"> <fmt:formatNumber value="${product.price.value}" maxFractionDigits="0" /></del>
				                        <c:if test="${product.cashOnly eq true}">
				                        </c:if>
				                        <del class="price-per">/${product.currency}&nbsp;</del>
				                        <del class="price-per J-format-price"><fmt:formatNumber value="${product.originFullCashPrice}" minFractionDigits="2" maxFractionDigits="2" /></del>
				                    </div>
					             </c:if>
					             <c:if test="${not empty promotionPrice}">
						             <div class="product-sale-price">
			                        <svg class="icon-yellow">
			                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-yellow" />
			                        </svg>
			                        <p class="price font-bold J-format-price"> <fmt:formatNumber value="${promotionPrice.value}" maxFractionDigits="0" /></p>
			                      </div>
									 <div class="product-sale-discount J-see-all-discount" <c:if test="${!empty product.discountRows || product.havePublishedPotentialBonusRules eq true}"> data-url="/product/${product.code }/tooltip" tabindex='0'</c:if>>
										 <c:if test="${!empty product.discountRows || product.havePublishedPotentialBonusRules eq true}">
											 <p class="title">
												 <c:choose>
													 <c:when test="${customerAccountBalance ge 0}"><spring:theme code="text.product.list.page.product.discount.all"/>
													 </c:when>
													 <c:otherwise>
														 <spring:theme code="text.product.detail.page.discount.detail"/>
													 </c:otherwise>
												 </c:choose>
											 </p>
				                       <svg class="icon-info-small"><use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-info-small" /></svg>
			                        </c:if>
			                   	</div>
					             </c:if>
			               </div>
							</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<component:emptyComponent/>
	</c:otherwise>
</c:choose>

