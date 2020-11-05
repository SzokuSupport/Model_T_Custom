<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<template:page pageTitle="${pageTitle}">
    <jsp:attribute name="pageCss">
   	  <c:set var="catName" scope="request" value="${categoryName}"/> 
        <link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
        <link href="/_ui/responsive/aml/css/plp.css" rel="stylesheet">
    </jsp:attribute>
    <jsp:attribute name="pageScripts">
        <script src="/_ui/responsive/aml/js/common.js"></script>
        <script src="/_ui/responsive/aml/js/searchResults.js"></script>
        <script src="/_ui/responsive/aml/js/searchReaultsPlugin.js"></script>
        <script src="/_ui/responsive/aml/js/applyAllPages.js"></script>
    </jsp:attribute>

    <jsp:body>
        <div class="container container-fluid-mobile product-banner">
            <!-- backend input -->
            <input type="hidden" value="${pageUrl}/productList" id="J-initProductUrl"/>
            <input type="hidden" value="${pageUrl}" id="J-filterProductUrl"/>
            <input type="hidden" value="${searchText}" id="J-text"/>

            <div class="row product-banner-simple">
                <div class="product-banner-simple__title">
                    <h1 class="font-light"><spring:theme code="text.search.result.page.title"/></h1>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <c:choose>
                    <c:when test="${not empty resultSize && not empty searchText}">
                        <c:choose>
                            <c:when test="${language eq 'en'}">
                                <div class="col-lg-12 col-md-12 col-sm-12 search-results-num"><span
                                        class="font-bold">${resultSize} <spring:theme
                                        code="text.search.result.page.result.number1"/></span> <spring:theme
                                        code="text.search.result.page.result.number2"/>${searchText}<spring:theme code="text.search.result.page.result.number3"/>
                                </div>
                            </c:when>
                            <c:when test="${language eq 'ko'}">
                                <div class="col-lg-12 col-md-12 col-sm-12 search-results-num">"${searchText}"
                                    <spring:theme code="text.search.result.page.result.number1"/>
                                    <span class="font-bold">${resultSize} <spring:theme
                                            code="text.search.result.page.result.number2"/></span>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-lg-12 col-md-12 col-sm-12 search-results-num">${searchText}
                                    <spring:theme code="text.search.result.page.result.number1"/>
                                    <span class="font-bold">${resultSize} <spring:theme
                                            code="text.search.result.page.result.number2"/></span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                </c:choose>
            </div>
        </div>

        <div class="container container-fluid-mobile J-plp-main-content">
            <input type="hidden" id="resFlag" value="true"/>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-4 mobile-filter J-mobile-filter-disappear">

                    <div class="mile-slider">
                        <div class="mile-slider-title font-bold"><spring:theme
                                code="text.product.list.page.filter.miles.range"/></div>
                        <div class="nstSlider"
                             data-range_min="${minimumMiles}"
                             data-range_max="${maximumMiles}"
                             data-cur_min="${currentMinMiles}"
                             data-cur_max="${currentMaxMiles}"
                             event_component="miles_selection"
                             event_value="${currentMinMiles}-${currentMaxMiles}"
                             data-aria_enabled="true"
                        >
                            <div class="bar"></div>
                            <div class="leftGrip"></div>
                            <div class="rightGrip"></div>
                        </div>
                        <div class="mile-slider-label">
                            <span></span> <spring:theme code="text.search.miles.range.title"/>
                        </div>
                    </div>

                    <div class="product-selector">
                        <div class="product-selector">
                            <!-- best deal -->
                            <c:forEach items="${searchPageData.facets}" var="facet">
                                <c:choose>
                                    <c:when test="${facet.code eq 'best_deal'}">
                                        <div class="section">
                                            <c:if test="${true eq ifShowBestDealsTag}">
                                                <h5 class="title font-bold">${facet.name}</h5>
                                            </c:if>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <c:if test="${facetValue.code eq 'SPECIAL_OFFERS'}">
                                                    <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                         tabindex='0'
                                                         aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                    ${facetValue.count} items available when checkbox is checked."
                                                         event_component="filter_best_deal"
                                                         event_value="Best Deals:${facetValue.name}">
                                                        <input class="J-q" type="hidden" name="q"
                                                               value="${facetValue.query.query.value}"/>
                                                        <input type="hidden" name="text"
                                                               value="${searchPageData.freeTextSearch}"/>
                                                        <input class="J-plpFilter"
                                                               type="checkbox" ${facetValue.selected?'checked':''}
                                                               id="filter-brand_${facetValue.name}">
                                                        <label class="filter-in-plp"
                                                               for="filter-brand_${facetValue.name}"
                                                               aria-hidden="true">${facetValue.name}</label>
                                                        <span aria-hidden="true">(${facetValue.count})</span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>

                                            <c:if test="${true eq ifMatchMPODiscount}">
                                                <c:forEach items="${facet.values}" var="facetValue">
                                                    <c:if test="${facetValue.code eq 'MARCO_POLO_CLUB_DISCOUNT'}">
                                                        <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                             tabindex='0'
                                                             aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                        ${facetValue.count} items available when checkbox is checked."
                                                             event_component="filter_best_deal"
                                                             event_value="Best Deals:${facetValue.name}">
                                                            <input class="J-q" type="hidden" name="q"
                                                                   value="${facetValue.query.query.value}"/>
                                                            <input type="hidden" name="text"
                                                                   value="${searchPageData.freeTextSearch}"/>
                                                            <input class="J-plpFilter"
                                                                   type="checkbox" ${facetValue.selected?'checked':''}
                                                                   id="filter-brand_${facetValue.name}">
                                                            <label class="filter-in-plp"
                                                                   for="filter-brand_${facetValue.name}"
                                                                   aria-hidden="true">${facetValue.name}</label>
                                                            <span aria-hidden="true">(${facetValue.count})</span>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>

                                            <c:if test="${true eq ifMatchCoBrandDiscount}">
                                                <c:forEach items="${facet.values}" var="facetValue">
                                                    <c:if test="${facetValue.code eq 'COBRANDED_CREDIT_CARD_DISCOUNT'}">
                                                        <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                             tabindex='0'
                                                             aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                        ${facetValue.count} items available when checkbox is checked."
                                                             event_component="filter_best_deal"
                                                             event_value="Best Deals:${facetValue.name}">
                                                            <input class="J-q" type="hidden" name="q"
                                                                   value="${facetValue.query.query.value}"/>
                                                            <input type="hidden" name="text"
                                                                   value="${searchPageData.freeTextSearch}"/>
                                                            <input class="J-plpFilter"
                                                                   type="checkbox" ${facetValue.selected?'checked':''}
                                                                   id="filter-brand_${facetValue.name}">
                                                            <label class="filter-in-plp"
                                                                   for="filter-brand_${facetValue.name}"
                                                                   aria-hidden="true">${facetValue.name}</label>
                                                            <span aria-hidden="true">(${facetValue.count})</span>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>

                                            <div class="J-show-less hide" tabindex='0' aria-label='show less link.'>
                                                <div class="show-less-or-more">
                                                    <p class="show-less-or-more-content" aria-hidden="true">
                                                        <spring:theme
                                                                code="text.product.list.page.show.less"/></p>
                                                    <svg class="icon-arrow-down icon-rotate"
                                                         xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                         viewBox="0 0 24 24">
                                                        <g fill="none" fill-rule="nonzero">
                                                            <path fill="#272F38"
                                                                  d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                                            <path fill="#FACF00"
                                                                  d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                                        </g>
                                                    </svg>
                                                </div>
                                            </div>
                                            <div class="J-show-more hide" tabindex='0' aria-label='show more link.'>
                                                <div class="show-less-or-more">
                                                    <p class="show-less-or-more-content" aria-hidden="true">
                                                        <spring:theme
                                                                code="text.product.list.page.show.more"/></p>
                                                    <svg class="icon-arrow-down" xmlns="http://www.w3.org/2000/svg"
                                                         width="24" height="24" viewBox="0 0 24 24">
                                                        <g fill="none" fill-rule="nonzero">
                                                            <path fill="#272F38"
                                                                  d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                                            <path fill="#FACF00"
                                                                  d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                                        </g>
                                                    </svg>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <!-- way to shop -->
                            <c:forEach items="${searchPageData.facets}" var="facet">
                                <c:choose>
                                    <c:when test="${facet.code eq 'way_shop'}">
                                        <div class="section">
                                            <h5 class="title font-bold J-ways-to-shop">${facet.name}</h5>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <c:if test="${facetValue.code eq 'CATHAY_PACIFIC_EXCLUSIVE'}">
                                                    <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                         tabindex='0'
                                                         aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                    ${facetValue.count} items available when checkbox is checked."
                                                         event_component="filter_Popular_filters"
                                                         event_value="${facet.name}:${facetValue.name}">
                                                        <input class="J-q" type="hidden" name="q"
                                                               value="${facetValue.query.query.value}"/>
                                                        <input type="hidden" name="text"
                                                               value="${searchPageData.freeTextSearch}"/>
                                                        <input class="J-plpFilter"
                                                               type="checkbox" ${facetValue.selected?'checked':''}
                                                               id="filter-brand_${facetValue.name}">
                                                        <label class="filter-in-plp"
                                                               for="filter-brand_${facetValue.name}"
                                                               aria-hidden="true">${facetValue.name}</label>
                                                        <span aria-hidden="true">(${facetValue.count})</span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <c:if test="${facetValue.code eq 'MARCO_POLO_CLUB_EXCLUSIVE'}">
                                                    <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                         tabindex='0'
                                                         aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                    ${facetValue.count} items available when checkbox is checked."
                                                         event_component="filter_Popular_filters"
                                                         event_value="${facet.name}:${facetValue.name}">
                                                        <input class="J-q" type="hidden" name="q"
                                                               value="${facetValue.query.query.value}"/>
                                                        <input type="hidden" name="text"
                                                               value="${searchPageData.freeTextSearch}"/>
                                                        <input class="J-plpFilter"
                                                               type="checkbox" ${facetValue.selected?'checked':''}
                                                               id="filter-brand_${facetValue.name}">
                                                        <label class="filter-in-plp"
                                                               for="filter-brand_${facetValue.name}"
                                                               aria-hidden="true">${facetValue.name}</label>
                                                        <span aria-hidden="true">(${facetValue.count})</span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <c:if test="${facetValue.code eq 'ASIA_MILES_EXCLUSIVE'}">
                                                    <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                         tabindex='0'
                                                         aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                    ${facetValue.count} items available when checkbox is checked."
                                                         event_component="filter_Popular_filters"
                                                         event_value="${facet.name}:${facetValue.name}">
                                                        <input class="J-q" type="hidden" name="q"
                                                               value="${facetValue.query.query.value}"/>
                                                        <input type="hidden" name="text"
                                                               value="${searchPageData.freeTextSearch}"/>
                                                        <input class="J-plpFilter"
                                                               type="checkbox" ${facetValue.selected?'checked':''}
                                                               id="filter-brand_${facetValue.name}">
                                                        <label class="filter-in-plp"
                                                               for="filter-brand_${facetValue.name}"
                                                               aria-hidden="true">${facetValue.name}</label>
                                                        <span aria-hidden="true">(${facetValue.count})</span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <c:if test="${facetValue.code eq 'PRIORITY_BOOKING'}">
                                                    <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                         tabindex='0'
                                                         aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                    ${facetValue.count} items available when checkbox is checked."
                                                         event_component="filter_Popular_filters"
                                                         event_value="${facet.name}:${facetValue.name}">
                                                        <input class="J-q" type="hidden" name="q"
                                                               value="${facetValue.query.query.value}"/>
                                                        <input type="hidden" name="text"
                                                               value="${searchPageData.freeTextSearch}"/>
                                                        <input class="J-plpFilter"
                                                               type="checkbox" ${facetValue.selected?'checked':''}
                                                               id="filter-brand_${facetValue.name}">
                                                        <label class="filter-in-plp"
                                                               for="filter-brand_${facetValue.name}"
                                                               aria-hidden="true">${facetValue.name}</label>
                                                        <span aria-hidden="true">(${facetValue.count})</span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <c:if test="${facetValue.code eq 'PRE_ORDER'}">
                                                    <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                         tabindex='0'
                                                         aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                    ${facetValue.count} items available when checkbox is checked."
                                                         event_component="filter_Popular_filters"
                                                         event_value="${facet.name}:${facetValue.name}">
                                                        <input class="J-q" type="hidden" name="q"
                                                               value="${facetValue.query.query.value}"/>
                                                        <input type="hidden" name="text"
                                                               value="${searchPageData.freeTextSearch}"/>
                                                        <input class="J-plpFilter"
                                                               type="checkbox" ${facetValue.selected?'checked':''}
                                                               id="filter-brand_${facetValue.name}">
                                                        <label class="filter-in-plp"
                                                               for="filter-brand_${facetValue.name}"
                                                               aria-hidden='true'>${facetValue.name}</label>
                                                        <span aria-hidden='true'>(${facetValue.count})</span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <c:if test="${facetValue.code eq 'COMING_SOON'}">
                                                    <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                         tabindex='0'
                                                         aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                    ${facetValue.count} items available when checkbox is checked."
                                                         event_component="filter_Popular_filters"
                                                         event_value="${facet.name}:${facetValue.name}">
                                                        <input class="J-q" type="hidden" name="q"
                                                               value="${facetValue.query.query.value}"/>
                                                        <input type="hidden" name="text"
                                                               value="${searchPageData.freeTextSearch}"/>
                                                        <input class="J-plpFilter"
                                                               type="checkbox" ${facetValue.selected?'checked':''}
                                                               id="filter-brand_${facetValue.name}">
                                                        <label class="filter-in-plp"
                                                               for="filter-brand_${facetValue.name}"
                                                               aria-hidden="true">${facetValue.name}</label>
                                                        <span aria-hidden="true">(${facetValue.count})</span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <c:if test="${facetValue.code eq 'BY_INVITATION_ONLY'}">
                                                    <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                         tabindex='0'
                                                         aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                    ${facetValue.count} items available when checkbox is checked."
                                                         event_component="filter_Popular_filters"
                                                         event_value="${facet.name}:${facetValue.name}">
                                                        <input class="J-q" type="hidden" name="q"
                                                               value="${facetValue.query.query.value}"/>
                                                        <input type="hidden" name="text"
                                                               value="${searchPageData.freeTextSearch}"/>
                                                        <input class="J-plpFilter"
                                                               type="checkbox" ${facetValue.selected?'checked':''}
                                                               id="filter-brand_${facetValue.name}">
                                                        <label class="filter-in-plp"
                                                               for="filter-brand_${facetValue.name}"
                                                               aria-hidden="true">${facetValue.name}</label>
                                                        <span aria-hidden="true">(${facetValue.count})</span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <c:if test="${facetValue.code eq 'LIMITED_EDITION'}">
                                                    <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                         tabindex='0'
                                                         aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                    ${facetValue.count} items available when checkbox is checked."
                                                         event_component="filter_Popular_filters"
                                                         event_value="${facet.name}:${facetValue.name}">
                                                        <input class="J-q" type="hidden" name="q"
                                                               value="${facetValue.query.query.value}"/>
                                                        <input type="hidden" name="text"
                                                               value="${searchPageData.freeTextSearch}"/>
                                                        <input class="J-plpFilter"
                                                               type="checkbox" ${facetValue.selected?'checked':''}
                                                               id="filter-brand_${facetValue.name}">
                                                        <label class="filter-in-plp"
                                                               for="filter-brand_${facetValue.name}"
                                                               aria-hidden="true">${facetValue.name}</label>
                                                        <span aria-hidden="true">(${facetValue.count})</span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <c:if test="${facetValue.code eq 'HOT'}">
                                                    <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                         tabindex='0'
                                                         aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                    ${facetValue.count} items available when checkbox is checked."
                                                         event_component="filter_Popular_filters"
                                                         event_value="${facet.name}:${facetValue.name}">
                                                        <input class="J-q" type="hidden" name="q"
                                                               value="${facetValue.query.query.value}"/>
                                                        <input type="hidden" name="text"
                                                               value="${searchPageData.freeTextSearch}"/>
                                                        <input class="J-plpFilter"
                                                               type="checkbox" ${facetValue.selected?'checked':''}
                                                               id="filter-brand_${facetValue.name}">
                                                        <label class="filter-in-plp"
                                                               for="filter-brand_${facetValue.name}"
                                                               aria-hidden="true">${facetValue.name}</label>
                                                        <span aria-hidden="true">(${facetValue.count})</span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <c:if test="${facetValue.code eq 'NEW'}">
                                                    <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                         tabindex='0'
                                                         aria-label="${facetValue.name} check box-Unchecked in ${facet.name} section
                                                    ${facetValue.count} items available when checkbox is checked."
                                                         event_component="filter_Popular_filters"
                                                         event_value="${facet.name}:${facetValue.name}">
                                                        <input class="J-q" type="hidden" name="q"
                                                               value="${facetValue.query.query.value}"/>
                                                        <input type="hidden" name="text"
                                                               value="${searchPageData.freeTextSearch}"/>
                                                        <input class="J-plpFilter"
                                                               type="checkbox" ${facetValue.selected?'checked':''}
                                                               id="filter-brand_${facetValue.name}">
                                                        <label class="filter-in-plp"
                                                               for="filter-brand_${facetValue.name}"
                                                               aria-hidden="true">${facetValue.name}</label>
                                                        <span aria-hidden="true">(${facetValue.count})</span>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <div class="J-show-less hide" tabindex='0' aria-label='show less link.'>
                                                <div class="show-less-or-more">
                                                    <p class="show-less-or-more-content" aria-hidden="true">
                                                        <spring:theme
                                                                code="text.product.list.page.show.less"/></p>
                                                    <svg class="icon-arrow-down icon-rotate"
                                                         xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                         viewBox="0 0 24 24">
                                                        <g fill="none" fill-rule="nonzero">
                                                            <path fill="#272F38"
                                                                  d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                                            <path fill="#FACF00"
                                                                  d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                                        </g>
                                                    </svg>
                                                </div>
                                            </div>
                                            <div class="J-show-more hide" tabindex='0' aria-label='show more link.'>
                                                <div class="show-less-or-more">
                                                    <p class="show-less-or-more-content" aria-hidden="true">
                                                        <spring:theme
                                                                code="text.product.list.page.show.more"/></p>
                                                    <svg class="icon-arrow-down" xmlns="http://www.w3.org/2000/svg"
                                                         width="24" height="24" viewBox="0 0 24 24">
                                                        <g fill="none" fill-rule="nonzero">
                                                            <path fill="#272F38"
                                                                  d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                                            <path fill="#FACF00"
                                                                  d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                                        </g>
                                                    </svg>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </c:forEach>

                            <!-- categories -->
                            <div class="section">
                                <c:forEach items="${searchPageData.facets}" var="facet">
                                    <c:choose>
                                        <c:when test="${facet.code eq filterCategoryLevel}">
                                            <h5 class="title font-bold">${facet.name}</h5>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <div class="radio-group J-plp-radioGroup J-filter-option" tabindex='0'>
                                                    <input class="J-q" type="hidden" name="q"
                                                           value="${facetValue.query.query.value}"/>
                                                    <input type="radio" class="J-plpFilterRadio"
                                                           id="filter-category_${facetValue.name}" name="category">
                                                    <label class="filter-in-plp"
                                                           for="filter-category_${facetValue.name}">${facetValue.name}</label>
                                                    <span>(${facetValue.count})</span>
                                                </div>
                                            </c:forEach>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                <div class="J-show-less hide" tabindex='0' aria-label='show less link.'>
                                    <div class="show-less-or-more">
                                        <p class="show-less-or-more-content" aria-hidden="true"><spring:theme
                                                code="text.product.list.page.show.less"/></p>
                                        <svg class="icon-arrow-down icon-rotate" xmlns="http://www.w3.org/2000/svg"
                                             width="24" height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="nonzero">
                                                <path fill="#272F38"
                                                      d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                                <path fill="#FACF00"
                                                      d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                            </g>
                                        </svg>
                                    </div>
                                </div>
                                <div class="J-show-more hide" tabindex='0' aria-label='show more link.'>
                                    <div class="show-less-or-more">
                                        <p class="show-less-or-more-content" aria-hidden="true"><spring:theme
                                                code="text.product.list.page.show.more"/></p>
                                        <svg class="icon-arrow-down" xmlns="http://www.w3.org/2000/svg" width="24"
                                             height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="nonzero">
                                                <path fill="#272F38"
                                                      d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                                <path fill="#FACF00"
                                                      d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                            </g>
                                        </svg>
                                    </div>
                                </div>
                            </div>

                            <c:forEach items="${searchPageData.facets}" var="facet">
                                <c:choose>
                                    <c:when test="${facet.code eq 'brandName'}">
                                        <div class="section" data-code="${facet.code}">
                                            <h5 class="title font-bold">${facet.name}</h5>
                                            <c:forEach items="${facet.values}" var="facetValue">
                                                <div class="checkbox-group J-plp-checkGroup J-filter-option"
                                                     tabindex='0'
                                                     aria-label="${facetValue.name} check box-Unchecked in best deals section
                                                ${facetValue.count} items available when checkbox is checked.">
                                                    <input class="J-q" type="hidden" name="q"
                                                           value="${facetValue.query.query.value}"/>
                                                    <input type="hidden" name="text"
                                                           value="${searchPageData.freeTextSearch}"/>

                                                    <input class="J-plpFilter"
                                                           type="checkbox" ${facetValue.selected?'checked':''}
                                                           id="filter-brand_${facetValue.name}">
                                                    <label class="filter-in-plp"
                                                           for="filter-brand_${facetValue.name}"
                                                           aria-hidden="true">${facetValue.name}</label>
                                                    <span aria-hidden="true">(${facetValue.count})</span>
                                                </div>
                                            </c:forEach>

                                            <div class="J-show-less hide" tabindex='0' aria-label='show less link.'>
                                                <div class="show-less-or-more">
                                                    <p class="show-less-or-more-content" aria-hidden="true">
                                                        <spring:theme
                                                                code="text.product.list.page.show.less"/></p>
                                                    <svg class="icon-arrow-down icon-rotate"
                                                         xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                         viewBox="0 0 24 24">
                                                        <g fill="none" fill-rule="nonzero">
                                                            <path fill="#272F38"
                                                                  d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                                            <path fill="#FACF00"
                                                                  d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                                        </g>
                                                    </svg>
                                                </div>
                                            </div>
                                            <div class="J-show-more hide" tabindex='0' aria-label='show more link.'>
                                                <div class="show-less-or-more">
                                                    <p class="show-less-or-more-content" aria-hidden="true">
                                                        <spring:theme
                                                                code="text.product.list.page.show.more"/></p>
                                                    <svg class="icon-arrow-down" xmlns="http://www.w3.org/2000/svg"
                                                         width="24" height="24" viewBox="0 0 24 24">
                                                        <g fill="none" fill-rule="nonzero">
                                                            <path fill="#272F38"
                                                                  d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                                            <path fill="#FACF00"
                                                                  d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                                        </g>
                                                    </svg>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <div class="product-selector-btn">
                            <div class="apply font-bold J-close-product-filter">Apply</div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-9 col-md-9 col-sm-8">
                    <div class="row product-sort">
                        <!-- filter label -->


                        <div class="col-lg-8 col-md-8 col-sm-8 filtered-by">
                            <c:if test="${searchPageData.breadcrumbs.size()>0}">
                                <p class="title font-bold"><spring:theme
                                        code="text.product.list.page.text.link.filter"/></p>
                                <div class="label">
                                    <c:forEach items="${searchPageData.breadcrumbs}" var="breadcrumb">
                                        <c:url value="${breadcrumb.removeQuery.url}" var="removeQueryUrl"/>
                                        <c:url value="${breadcrumb.removeQuery.query.value}" var="removeQueryValue"/>
                                        <span class="label-item" tabindex="0"
                                              aria-label="${breadcrumb.facetValueName} link-clickable ">
							             <c:if test="${breadcrumb.facetCode eq 'zonePrice' }">PRICE </c:if>
                                        <span aria-hidden="true">${breadcrumb.facetValueName}</span>
							              <input class="J-q" type="hidden" name="q"
                                                 value="${fn:escapeXml(removeQueryValue)}">
                            <svg class="J-deleteLable icon-close" width="24px" height="24px" viewBox="0 0 24 24"
                                 version="1.1" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink">
                            <g stroke="none" stroke-width="1" fill-rule="evenodd">
                                <g>
                                    <g transform="translate(2.000000, 2.000000)">
                                        <path d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                                        <path fill-rule="nonzero"
                                              d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                                        <g>
                                            <mask>
                                                <path d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                                            </mask>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </svg>
							          </span>
                                    </c:forEach>
                                    <span class="label-item font-SemiBold clear-all" id="J-clearAll" tabindex="0"
                                          aria-label="Clear all link -clickable">
                                    <span aria-hidden="true"><spring:theme
                                            code="text.product.list.page.text.link.clear.all"/>
                                    </span></span>
                                </div>
                            </c:if>
                        </div>


                        <!-- mobile filter button -->
                        <div class="col-xs-4 product-sort-left J-open-product-filter" data-url="/list">
                            <svg class="icon-filter" width="24px" height="24px" viewBox="0 0 24 24" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <!-- Generator: sketchtool 54.1 (76490) - https://sketchapp.com -->
                                <title>15D05230-850F-4344-AB5A-6A0A86DF94D2</title>
                                <desc>Created with sketchtool.</desc>
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"
                                   stroke-linejoin="round">
                                    <g fill-rule="nonzero" stroke="#272F38" stroke-width="1.5">
                                        <path d="M2,2 L9.5582433,11.8431094 C9.73145255,12.0353453 9.82654879,12.2793756 9.82654879,12.5316191 L9.82654879,20.1380208 L13.0791325,22 L13.0791325,12.5316191 C13.0791325,12.2838174 13.1709148,12.0437956 13.3386274,11.8530091 L22,2 L2,2 Z"></path>
                                    </g>
                                </g>
                            </svg>
                            <p class="font-SemiBold filter-text"><spring:theme
                                    code="text.product.list.page.text.link.filter"/></p>
                        </div>
                        <!-- sort-by -->
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-8">
                            <div class="product-sort-right J-plpSort" event_component='sort_by_filter'>
                                <p class="sort-by"><spring:theme code="text.product.list.page.label.sort.by"/></p>
                                <div class="sort-dropdown">
                                    <div class="dropdown-group">
                                        <label class="dropdown-label">Date & Time</label>
                                        <a class="dropdown-selected J-selectTrigger" aria-hidden="false" tabindex="0">
                                            <span class="dropdown-selected-text"></span>
                                            <svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24"
                                                 viewBox="0 0 24 24">
                                                <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                                                    <path d="M15 0v8.414H0V0z"/>
                                                    <path fill="#272F38"
                                                          d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                                                </g>
                                            </svg>
                                        </a>
                                        <div class="dropdown-selected-control J-selectedControl">
                                            <ul class="listbox" role="listbox" aria-expanded="true">
                                                <c:forEach var="sort" items="${searchPageData.sorts}">
                                                    <c:choose>
                                                        <c:when test="${sort.code eq 'relevance'}">
                                                            <c:set var="active"
                                                                   value="${sort.selected ? 'selected':''}"/>
                                                            <li class="option ${active} J-option" role="option"
                                                                data-code="${sort.code}">
                                                                <a class="link" href="javascript:;">${sort.name}</a>
                                                            </li>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:forEach var="sort" items="${searchPageData.sorts}">
                                                    <c:choose>
                                                        <c:when test="${sort.code eq 'onlineDate-desc'}">
                                                            <c:set var="active"
                                                                   value="${sort.selected ? 'selected':''}"/>
                                                            <li class="option ${active} J-option" role="option"
                                                                data-code="${sort.code}">
                                                                <a class="link" href="javascript:;">${sort.name}</a>
                                                            </li>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:forEach var="sort" items="${searchPageData.sorts}">
                                                    <c:choose>
                                                        <c:when test="${sort.code eq 'onlineDate-asc'}">
                                                            <c:set var="active"
                                                                   value="${sort.selected ? 'selected':''}"/>
                                                            <li class="option ${active} J-option" role="option"
                                                                data-code="${sort.code}">
                                                                <a class="link" href="javascript:;">${sort.name}</a>
                                                            </li>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:forEach var="sort" items="${searchPageData.sorts}">
                                                    <c:choose>
                                                        <c:when test="${sort.code eq 'name-asc'}">
                                                            <c:set var="active"
                                                                   value="${sort.selected ? 'selected':''}"/>
                                                            <li class="option ${active} J-option" role="option"
                                                                data-code="${sort.code}">
                                                                <a class="link" href="javascript:;">${sort.name}</a>
                                                            </li>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:forEach var="sort" items="${searchPageData.sorts}">
                                                    <c:choose>
                                                        <c:when test="${sort.code eq 'name-desc'}">
                                                            <c:set var="active"
                                                                   value="${sort.selected ? 'selected':''}"/>
                                                            <li class="option ${active} J-option" role="option"
                                                                data-code="${sort.code}">
                                                                <a class="link" href="javascript:;">${sort.name}</a>
                                                            </li>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:forEach var="sort" items="${searchPageData.sorts}">
                                                    <c:choose>
                                                        <c:when test="${sort.code eq 'zonePrice-asc'}">
                                                            <c:set var="active"
                                                                   value="${sort.selected ? 'selected':''}"/>
                                                            <c:set var="params"
                                                                   value="sort=${sort.code}&q=${noUpdateSearchQuery}&text=${searchPageData.freeTextSearch}"/>
                                                            <li class="option ${active} J-option" role="option"
                                                                data-code="${sort.code}">
                                                                <a class="link" href="javascript:;">${sort.name}</a>
                                                            </li>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:forEach var="sort" items="${searchPageData.sorts}">
                                                    <c:choose>
                                                        <c:when test="${sort.code eq 'zonePrice-desc'}">
                                                            <c:set var="active"
                                                                   value="${sort.selected ? 'selected':''}"/>
                                                            <li class="option ${active} J-option" role="option"
                                                                data-code="${sort.code}">
                                                                <a class="link" href="javascript:;">${sort.name}</a>
                                                            </li>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <select class="dropdown-selected-control--mobile J-selectedControlMobile"
                                                name="title"
                                                use='sort'
                                                placeholder="">
                                            <c:forEach var="sort" items="${searchPageData.sorts}">
                                                <c:choose>
                                                    <c:when test="${sort.code eq 'relevance'}">
                                                        <c:set var="active" value="${sort.selected ? 'selected':''}"/>
                                                        <option class="option J-option" ${active}
                                                                value="${sort.code}">${sort.name}</option>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                            <c:forEach var="sort" items="${searchPageData.sorts}">
                                                <c:choose>
                                                    <c:when test="${sort.code eq 'onlineDate-desc'}">
                                                        <c:set var="active" value="${sort.selected ? 'selected':''}"/>
                                                        <option class="option J-option" ${active}
                                                                value="${sort.code}">${sort.name}</option>
                                                        　
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                            <c:forEach var="sort" items="${searchPageData.sorts}">
                                                <c:choose>
                                                    <c:when test="${sort.code eq 'onlineDate-asc'}">
                                                        <c:set var="active" value="${sort.selected ? 'selected':''}"/>
                                                        <option class="option J-option" ${active}
                                                                value="${sort.code}">${sort.name}</option>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                            <c:forEach var="sort" items="${searchPageData.sorts}">
                                                <c:choose>
                                                    <c:when test="${sort.code eq 'name-asc'}">
                                                        <c:set var="active" value="${sort.selected ? 'selected':''}"/>
                                                        <option class="option J-option" ${active}
                                                                value="${sort.code}">${sort.name}</option>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                            <c:forEach var="sort" items="${searchPageData.sorts}">
                                                <c:choose>
                                                    <c:when test="${sort.code eq 'name-desc'}">
                                                        <c:set var="active" value="${sort.selected ? 'selected':''}"/>
                                                        <option class="option J-option" ${active}
                                                                value="${sort.code}">${sort.name}</option>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                            <c:forEach var="sort" items="${searchPageData.sorts}">
                                                <c:choose>
                                                    <c:when test="${sort.code eq 'zonePrice-asc'}">
                                                        <c:set var="active" value="${sort.selected ? 'selected':''}"/>
                                                        <option class="option J-option" ${active}
                                                                value="${sort.code}">${sort.name}</option>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                            <c:forEach var="sort" items="${searchPageData.sorts}">
                                                <c:choose>
                                                    <c:when test="${sort.code eq 'zonePrice-desc'}">
                                                        <c:set var="active" value="${sort.selected ? 'selected':''}"/>
                                                        <option class="option J-option" ${active}
                                                                value="${sort.code}">${sort.name}</option>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="products J-product-list">
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</template:page>
