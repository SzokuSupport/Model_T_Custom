<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>

<input type="hidden" value="${forLoadmore+1}" id="J-getCurrentPage"/>
<input type="hidden" value="${pageSize}" id="J-getCurrentPageSize"/>
<input type="hidden" value="${qShown}" id="J-q"/>
<input type="hidden" value="${sortByShown}" id="J-sort"/>
<input type="hidden" value="${totalPage}" id="J-totalPage"/>

<div class="products J-product-list">
    <div class="product-list">
        <c:forEach items="${searchPageData.results}" var="product" varStatus="status">
            <c:if test="${pageType eq 'CATEGORY'}">
                <c:if test="${status.index eq 4 && not empty crossSaleImages1}">
                    <div class="item-list J-item-list item-list-image">
                        <a class="product-card cross-sale" href="${crossSaleImages1.url}" tabindex='0' event_component="promotion_nav_crosssell" event_value="CrossSell: ${categoryNameString}" event_position="1">
                            <div class="cross-sale-img-wrapper">
                                <picture>
                                    <source media="(max-width: 768px)" srcset="${crossSaleImages1.mobileImage}">
                                    <source media="(min-width: 768px) and (max-width: 1024px)"
                                            srcset="${crossSaleImages1.mobileImage}">
                                    <source media="(min-width: 1024px)" srcset="${crossSaleImages1.desktopImage}">
                                    <img src="${crossSaleImages1.desktopImage}" alt="this is a picture">
                                </picture>
                            </div>
                            <div class="product-img J-product-card-img ImgToBg">
                            </div>
                            <div class="product-description">
                            </div>
                        </a>
                    </div>
                </c:if>
                <c:if test="${status.index eq 12 && not empty crossSaleImages2}">
                    <div class="item-list J-item-list item-list-image">
                        <a class="product-card cross-sale" href="${crossSaleImages2.url}" tabindex='0' event_component="promotion_nav_crosssell" event_value=CrossSell: ${categoryNameString}" event_position="2">
                            <div class="cross-sale-img-wrapper">
                                <picture>
                                    <source media="(max-width: 768px)" srcset="${crossSaleImages2.mobileImage}">
                                    <source media="(min-width: 768px) and (max-width: 1024px)"
                                            srcset="${crossSaleImages2.mobileImage}">
                                    <source media="(min-width: 1024px)" srcset="${crossSaleImages2.desktopImage}">
                                    <img src="${crossSaleImages2.desktopImage}" alt="this is a picture">
                                </picture>
                            </div>
                            <div class="product-img J-product-card-img ImgToBg">
                            </div>
                            <div class="product-description">
                            </div>
                        </a>
                    </div>
                </c:if>
            </c:if>
            <div class="item-list J-item-list">
                <a class="product-card" tabindex="0" href=
                    <c:url value="${product.url}"/> event_component='product_banner' event_value='${product.brandName} ${fn:escapeXml(product.name)}'>
                    <div class="product-img J-product-card-img ImgToBg">
                        <product:productPrimaryImage_PLP product="${product}" format="product"/>
                        <c:if test="${not empty product.productTageGroupA && product.switchOffGroupA eq false}">
                            <div class="product-img-tag font-bold">${product.productTageGroupA}</div>
                        </c:if>
                    </div>
                    <c:if test="${not empty product.productTagGroupB}">
                        <c:choose>
                            <c:when test="${product.productTagGroupB.colour eq 'GREEN'}">
                                <div class="product-tag" style="background: -webkit-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                background: -moz-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                background: -o-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                background: -ms-linear-gradient(right, #428c85, #00645a, #00645a, #428c85);
                background: linear-gradient(right, #428c85, #00645a, #00645a, #428c85);">
                                    <p class="product-tag__p font-SemiBold">${product.productTagGroupB.name}</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="product-tag" style="background: -webkit-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                background: -moz-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                background: -o-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                background: -ms-linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);
                background: linear-gradient(right, #929292, #313131 31%, #313131 67%, #929292);">
                                    <p class="product-tag__p font-SemiBold">${product.productTagGroupB.name}</p>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </c:if>
                    <div class="product-description">
                        <h5 class="product-description-title font-bold">${product.brandName} </h5>
                        <p class="product-description__p">${fn:escapeXml(product.name)}</p>
                    </div>
                    <div class="product-sale">
                        <c:if test="${product.stock.stockLevelStatus eq 'outOfStock'}">
                            <p class="product-sale-stock"><spring:theme code="text.product.list.page.error.out.of.stock"/></p>
                        </c:if>
                        <c:if test="${product.stock.stockLevelStatus eq 'lowStock'}">
                            <p class="product-sale-stock"><spring:theme code="text.product.list.page.error.only.one.left"/></p>
                        </c:if>
                        <c:if test="${product.variantPriceFromDisplay}">
                            <p class="product-sale-from"><spring:theme code="text.product.list.page.product.card.from"/></p>
                        </c:if>
                        <c:choose>
                            <c:when test="${not empty product.promotionPrice}">
                                <div class="product-sale-delete">
                                    <svg class="icon-yellow">
                                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-yellow"/>
                                    </svg>
                                    <p class="price-text">
                                        <del class="price"><fmt:formatNumber value="${product.price.value}" maxFractionDigits="0"/></del>
                                        <c:if test="${product.cashOnly eq true}">
                                            <del class="price-per">/${product.currency}&nbsp;
                                                <fmt:formatNumber value="${product.originFullCashPrice}"
                                                                  minFractionDigits="2" maxFractionDigits="2"/></del>
                                        </c:if>
                                    </p>
                                </div>
                                <div class="product-sale-price">
                                    <svg class="icon-yellow">
                                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-yellow"/>
                                    </svg>
                                    <p class="price-text">
                                        <span class="price font-bold"><fmt:formatNumber value="${product.promotionPrice.value}"
                                                                                        maxFractionDigits="0"/></span>
                                        <c:if test="${product.cashOnly eq true}">
                                            <span class="price-per">/</span>
                                            <span class="price-per currency">${product.currency}</span>
                                            <span class="price-per font-bold"><fmt:formatNumber value="${product.fullCashPrice}" minFractionDigits="2"
                                                                                                maxFractionDigits="2"/></span>
                                        </c:if>
                                    </p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="product-sale-price">
                                    <svg class="icon-yellow">
                                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-yellow"/>
                                    </svg>
                                    <p class="price-text">
                                        <span class="price font-bold"><fmt:formatNumber value="${product.price.value}" maxFractionDigits="0"/></span>
                                        <c:if test="${product.cashOnly eq true}">
                                            <span class="price-per">/</span>
                                            <span class="price-per currency">${product.currency}</span>
                                            <span class="price-per font-bold">
                                            <fmt:formatNumber value="${product.fullCashPrice}" minFractionDigits="2"
                                                              maxFractionDigits="2"/></span>
                                        </c:if>
                                    </p>
                                </div>
                            </c:otherwise>
                        </c:choose>

                        <c:if test="${product.havePublishedPotentialBonusRules eq true}">
                            <div class="product-sale-earn-miles">
                                <span class="icon-yellow">
                                    <img src="/_ui/responsive/aml/img/earn-yellow.svg"/>
                                </span>
                                <p class="font-bold"><spring:theme code="text.product.list.page.bonus.message"/></p>
                            </div>
                        </c:if>

                        <div class="product-sale-discount J-offer-details"
                             <c:if test="${!empty product.discountRows || product.havePublishedPotentialBonusRules eq true}">data-url="/product/${product.code }/tooltip"
                             tabindex='0'</c:if>>
                            <c:if test="${!empty product.discountRows || product.havePublishedPotentialBonusRules eq true}">
                                <div class="discount-mask"/>
                                <p class="title">
                                    <spring:theme code="text.product.list.page.product.${product.discountText}"/>
                                </p>
                                <svg class="icon-info-small" xmlns="http://www.w3.org/2000/svg" width="15" height="15"
                                     viewBox="0 0 15 15">
                                    <g fill="none" fill-rule="evenodd">
                                        <path fill="#D4D5D7"
                                              d="M14.643 7.295A7.322 7.322 0 0 1 0 7.295C0 3.252 3.277 0 7.321 0s7.322 3.252 7.322 7.295"/>
                                        <path fill="#272F38"
                                              d="M6.447 3.993a.875.875 0 1 0 1.749 0 .875.875 0 0 0-1.75 0z"/>
                                        <path fill="#272F38" fill-rule="nonzero" d="M6.55 6v5.696h1.5V6z"/>
                                    </g>
                                </svg>
                            </c:if>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
        <c:if test="${searchPageData.results.size() eq 4  && not empty crossSaleImages1}">
            <div class="item-list J-item-list item-list-image">
                <a class="product-card cross-sale" href="${crossSaleImages1.url}" tabindex='0' event_component="promotion_nav_crosssell" event_value="CrossSell: ${categoryNameString}" event_position="1">
                    <div class="cross-sale-img-wrapper">
                        <picture>
                            <source media="(max-width: 768px)" srcset="${crossSaleImages1.mobileImage}">
                            <source media="(min-width: 768px) and (max-width: 1024px)"
                                    srcset="${crossSaleImages1.mobileImage}">
                            <source media="(min-width: 1024px)" srcset="${crossSaleImages1.desktopImage}">
                            <img src="${crossSaleImages1.desktopImage}" alt="this is a picture">
                        </picture>
                    </div>
                    <div class="product-img J-product-card-img ImgToBg">
                    </div>
                    <div class="product-description">
                    </div>
                </a>
            </div>
        </c:if>
    </div>
</div>

<div class="loading-img J-loadingImg">
    <img src="/_ui/responsive/aml/img/loading.gif" alt=""/>
</div>
<c:if test="${forLoadmore gt 4 and forLoadmore lt totalPage-1}">
    <p class="load-more-btn font-SemiBold" id="J-loadMore" tabindex='0'>
        <spring:theme code="text.product.list.page.load.more"/>
    </p>
</c:if>