<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="productmarketplace" tagdir="/WEB-INF/tags/addons/marketplaceaddon/responsive/product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/responsive/common/header"%>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer"%>

<!-- aisamiles -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Asia Miles iRedeem</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="/_ui/responsive/assets/css/jquery-ui.min.css">
    <link rel="stylesheet" href="/_ui/responsive/assets/css/common.css">
  </head>
  <body>
    <header:asiamilesHeader/>
    <div id="skip-to-content" class="filter main-content">
    <div class="product-grid-container ng-scope" data-ng-app="QSCategroyApp">
        <div class="container">
            <div class="row listing-title no-margin-l">
                <div>
                    <h2 class="page-title">${categoryName}</h2>
                </div>
                <hr>
                <div class="nav-filter">
					<div class="nav-filter-wrapper">
                    	<div class="dropdown-container">
                        <div class="filter-dropdown">
                            <select name="Product type" id="product-type">
                                <option value="" disabled selected>Product type</option>
                                <option value="Travel">Travel</option>
                                <option value="Travel">Travel</option>
                                <option value="Travel">Travel</option>
                            </select>
                            <em class="fa fa-chevron-down" style="font-size: 14px; color: #272f38;"></em>
                        </div>
                        <div class="filter-dropdown">
                            <select name="Avaliable country" id="avaliable-country">
                                <option value="" disabled selected>Avaliable country</option>
                                <option value="Hong Kong">Hong Kong</option>
                                <option value="Hong Kong">Hong Kong</option>
                                <option value="Hong Kong">Hong Kong</option>
                            </select>
                            <em class="fa fa-chevron-down" style="font-size: 14px; color: #272f38;"></em>
                        </div>
                        <div class="filter-dropdown">
                            <select name="Brand" id="brand">
                                <option value="" disabled selected>Brand</option>
                                <option value="Dyson">Dyson</option>
                                <option value="Dyson">Dyson</option>
                                <option value="Dyson">Dyson</option>
                            </select>
                            <em class="fa fa-chevron-down" style="font-size: 14px; color: #272f38;"></em>
                        </div>
					</div>
					<div class="filter-slider">
							<div id="filter-range"></div>
						</div> 
						<div class="search">
							<input type="text" placeholder="Enter keywords...">
							<img src="/_ui/responsive/assets/svg/search.svg" class="icon" alt="">
						</div>
					<div class="col-xs-12 col-md-12 col-lg-12 info">
						<div class="nav-product-filter js-nav-product-filter">
							<ul class="nav nav-pills">
								<li class="active visible-xs visible-sm">
									<a @click="changeArrow()" href="#product-facet" class="nav-facet js-nav-facet" data-toggle="collapse" aria-expanded="true">
										<span class="txt">Filter</span>
										<span class="qs-icon-arrow-up dropdown-facet pull-right" aria-hidden="true">
											<em class="fa" :class="{'fa-chevron-down':this.arrowDown,'fa-chevron-up':!this.arrowDown}"></em>
										</span>
										<span class="aria-visible">Toggle filter</span>
									</a>
								</li>
								<li>
									<div class="nav-facet nav-sort js-nav-sort border-none float-r filter-info">
										<span class="total-items hidden-xs hidden-sm" >
											<span class="ng-binding" >${searchPageData.pagination.totalNumberOfResults}</span> results |
										</span>
										
										
										<span class="category-dropdown J-toggle-arrow">
											Sort by: <span class="sort">${categoryName}</span>
											<em class="fa fa-chevron-down J-open " style="font-size: 14px; color: #272f38;"></em>
											<em class="fa fa-chevron-up J-close hide" style="font-size: 14px; color: #272f38;"></em>
											<div class="category-container hide">
											<c:if test="${not empty searchPageData.breadcrumbs}">
												<ul class="selected">
													
													<div class="facet js-facet">
													<div class="facet__name js-facet-name">
														<span class="glyphicon facet__arrow"></span>
														<spring:theme code="search.nav.applied.facets"/>
													</div>
														<div class="facet__values js-facet-values">
															<ul class="facet__list">
																<c:forEach items="${searchPageData.breadcrumbs}" var="breadcrumb">
																	<li>
																		<c:url value="${breadcrumb.removeQuery.url}" var="removeQueryUrl"/>
																		${fn:escapeXml(breadcrumb.facetValueName)}&nbsp;<a href="${fn:escapeXml(removeQueryUrl)}" ><span class="glyphicon glyphicon-remove"></span></a>
																	</li>
																</c:forEach>
															</ul>
														</div>
													</div>
												</ul>
												</c:if>
												
												<ul>
													<c:forEach items="${searchPageData.facets}" var="facet">
													<c:choose>
														<c:when test="${facet.code eq 'category'}">
	<%-- 														<nav:facetNavRefinementFacet facetData="${facet}"/> --%>
															
															<c:if test="${not empty facet.values}">
																<ycommerce:testId code="facetNav_title_${facet.name}">
																	<div class="facet js-facet">
																		<div class="facet__name js-facet-name">
																			<span class="glyphicon facet__arrow"></span>
																			<spring:theme code="search.nav.facetTitle" arguments="${facet.name}"/>
																		</div>
																		<div class="facet__values js-facet-values js-facet-form">
																			<c:if test="${not empty facet.topValues}">
																				<ul class="facet__list js-facet-list js-facet-top-values">
																					<c:forEach items="${facet.topValues}" var="facetValue">
																						<li>
																							<c:if test="${facet.multiSelect}">
																								<form action="#" method="get">
																								<!-- facetValue.query.query.value and searchPageData.freeTextSearch are html output encoded in the backend -->
																									<input type="hidden" name="q" value="${facetValue.query.query.value}"/>
																									<input type="hidden" name="text" value="${searchPageData.freeTextSearch}"/>
																									<label>
																										<input class="facet__list__checkbox" type="checkbox" ${facetValue.selected ? 'checked="checked"' : ''} class="facet-checkbox" />
																										<span class="facet__list__label">
																											<span class="facet__list__mark"></span>
																											<span class="facet__list__text">
																												${fn:escapeXml(facetValue.name)}
																												<ycommerce:testId code="facetNav_count">
																													<span class="facet__value__count"><spring:theme code="search.nav.facetValueCount" arguments="${facetValue.count}"/></span>
																												</ycommerce:testId>
																											</span>
																										</span>
																									</label>
																								</form>
																							</c:if>
																							<c:if test="${not facet.multiSelect}">
																								<c:url value="${facetValue.query.url}" var="facetValueQueryUrl"/>
																								<span class="facet__text">
																								<!-- searchPageData.freeTextSearch is html output encoded in the backend -->
																									<a href="${fn:escapeXml(facetValueQueryUrl)}&amp;text=${searchPageData.freeTextSearch}">${fn:escapeXml(facetValue.name)}</a>&nbsp;
																									<ycommerce:testId code="facetNav_count">
																										<span class="facet__value__count"><spring:theme code="search.nav.facetValueCount" arguments="${facetValue.count}"/></span>
																									</ycommerce:testId>
																								</span>
																							</c:if>
																						</li>
																					</c:forEach>
																				</ul>
																			</c:if>
																			<ul class="facet__list js-facet-list <c:if test="${not empty facet.topValues}">facet__list--hidden js-facet-list-hidden</c:if>">
																				<c:forEach items="${facet.values}" var="facetValue">
																					<li>
																						<c:if test="${facet.multiSelect}">
																							<ycommerce:testId code="facetNav_selectForm">
																							<form action="#" method="get">
																							<!-- facetValue.query.query.value and searchPageData.freeTextSearch are html output encoded in the backend -->
																								<input type="hidden" name="q" value="${facetValue.query.query.value}"/>
																								<input type="hidden" name="text" value="${searchPageData.freeTextSearch}"/>
																								<label>
																									<input type="checkbox" ${facetValue.selected ? 'checked="checked"' : ''}  class="facet__list__checkbox js-facet-checkbox sr-only" />
																									<span class="facet__list__label">
																										<span class="facet__list__mark"></span>
																										<span class="facet__list__text">
																											${fn:escapeXml(facetValue.name)}&nbsp;
																											<ycommerce:testId code="facetNav_count">
																												<span class="facet__value__count"><spring:theme code="search.nav.facetValueCount" arguments="${facetValue.count}"/></span>
																											</ycommerce:testId>
																										</span>
																									</span>
																								</label>
																							</form>
																							</ycommerce:testId>
																						</c:if>
																						<c:if test="${not facet.multiSelect}">
																							<c:url value="${facetValue.query.url}" var="facetValueQueryUrl"/>
																							<span class="facet__text">
																								<a href="${fn:escapeXml(facetValueQueryUrl)}">${fn:escapeXml(facetValue.name)}</a>
																								<ycommerce:testId code="facetNav_count">
																									<span class="facet__value__count"><spring:theme code="search.nav.facetValueCount" arguments="${facetValue.count}"/></span>
																								</ycommerce:testId>
																							</span>
																						</c:if>
																					</li>
																				</c:forEach>
																			</ul>
																
																			<c:if test="${not empty facet.topValues}">
																				<span class="facet__values__more js-more-facet-values">
																					<a href="#" class="js-more-facet-values-link" ><spring:theme code="search.nav.facetShowMore_${facet.code}" /></a>
																				</span>
																				<span class="facet__values__less js-less-facet-values">
																					<a href="#" class="js-less-facet-values-link"><spring:theme code="search.nav.facetShowLess_${facet.code}" /></a>
																				</span>
																			</c:if>
																		</div>
																	</div>
																</ycommerce:testId>
																</c:if>
															
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												</ul>

											</div>
										</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
            </div>
        </div>
    </div>
</div> 
   </div>
    <div class="products-lists">
    <div class="product-listing product-grid js-product-grid">
        <span class="total-items visible-xs visible-sm ng-binding">{{ itemNum }} items</span>
        <div class="row">
            <div class="row shown-product">
     <c:forEach items="${searchPageData.results}" var="product" varStatus="status">
		  <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 product-item">
		        <div class="shadow-wrapper">
		        <a class="item-link" href="${product.url}" tabindex="-1">
		            <div class="img-box">			
					<product:productPrimaryImage_PLP product="${product}" format="product"/>
		            </div>
		            
		            <div class="product-detail">
		                <h3>${product.name}</h3>
		                <p class="product-descript" v-html="item.description"></p>
		                <div class="last">
		                    <span class="item-price-current current-price">
		                    <img src="/_ui/responsive/assets/svg/logo.svg" alt="" style="position: relative;width:20px; top: -3px; left: -3px; display: inline-block;">
		                    		<%-- if product is multidimensional with different prices, show range, else, show unique price --%>
								<c:choose>
									<c:when test="${product.multidimensional and (product.priceRange.minPrice.value ne product.priceRange.maxPrice.value)}">
										<format:price priceData="${product.priceRange.minPrice}"/> - <format:price priceData="${product.priceRange.maxPrice}"/>
									</c:when>
									<c:otherwise>
										<%--<format:price priceData="${product.price}"/>--%>
                                        <format:price priceData="${product.deliveryRegionPrice}"/>
									</c:otherwise>
								</c:choose>
		                    </span>
<!-- 		                    <p class="loc">Hong Kong</p> -->
		                </div>
		            </div>
		        </a>
		    </div>
		
		 </div>
     </c:forEach>               
        </div>
    </div>
<!--     <div class="more-btn"> -->
<!--         <a href="javascript:;"> -->
<!--             <button>Load more</button> -->
<!--         </a> -->
<!--     </div> -->
</div>
</div>
  <footer:asiamilesFooter/>
  </body>
  </html>
