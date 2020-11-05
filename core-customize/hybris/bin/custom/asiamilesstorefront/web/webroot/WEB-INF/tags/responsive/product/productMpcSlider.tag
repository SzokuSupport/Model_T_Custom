<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<c:choose>
    <c:when test="${language eq 'zh' || language eq 'zh_TW'||language eq 'ja'}">
        <c:set var="timePattern" value="yyyy年 MM月 dd日"/>
    </c:when>
    <c:when test="${language eq 'ko'}">
        <c:set var="timePattern" value="yyyy년 MM월 dd일"/>
    </c:when>
    <c:otherwise>
        <c:set var="timePattern" value="d MMM yyy"/>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${isSalable}">
        <c:if test="${empty accErrorMsgs && product.paymentMethod eq 'MilesPlusCash' and not empty product.cashConversionValue}">
            <div class="mpc-slider">
                <c:if test="${((!empty product.promotionPrice) and (product.minimumMilesSpend le product.promotionPrice.value)) or ((empty product.promotionPrice) and product.minimumMilesSpend le product.price.value)}">
                    <div class="title ">
                        <span class="font-light J-bubbling-before"><spring:theme
                                code="text.product.detail.page.mpc.slider.how.would.you.like.to.pay"/></span>
                        <svg class="icon-info-small J-bubbling-icon" tabindex="0"
                             aria-label="<spring:theme code='text.product.detail.page.title.for.mpc.explanation'/><spring:theme code='text.product.detail.page.mpc.explanation'/>"
                             xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">
                            <g fill="none" fill-rule="evenodd">
                                <path fill="#D4D5D7" d="M14.643 7.295A7.322 7.322 0 0 1 0 7.295C0 3.252 3.277 0 7.321 0s7.322 3.252 7.322 7.295"/>
                                <path fill="#272F38" d="M6.447 3.993a.875.875 0 1 0 1.749 0 .875.875 0 0 0-1.75 0z"/>
                                <path fill="#272F38" fill-rule="nonzero" d="M6.55 6v5.696h1.5V6z"/>
                            </g>
                        </svg>
                        <div class="bubbling">
                            <p class="bubbling-title font-SemiBold"><spring:theme code="text.product.detail.page.title.for.mpc.explanation"/></p>
                            <p class="bubbling-text"><spring:theme code="text.product.detail.page.mpc.explanation"/></p>
                        </div>
                    </div>
                    <p class="mile-suggestion"><spring:theme code="text.product.detail.page.mpc.slider.suggestion"/></p>
                    <div class="mile-cash-slider">
                        <c:if test="${product.promotionPrice!=null}">
                            <c:set var="miles" value="${product.promotionPrice.value}"/>
                        </c:if>
                        <c:if test="${product.promotionPrice==null}">
                            <c:set var="miles" value="${product.price.value}"/>
                        </c:if>
                        <c:set var="earnRate" value="0"/>
                        <c:if test="${not empty product.baseMilesRate}">
                        	<c:set var="earnRate" value="${product.baseMilesRate.rate}"/>
                        </c:if>
                        <div class="nstSlider J-mile-cash-slider"
                             single="true"
                             data-range_min="-<fmt:formatNumber value="${miles}" pattern="#" type="number"/>"
                             data-range_max="-${product.minimumMilesSpend}"
                             data-cur_max="-${product.maxMilesSpend}"
                             data-cur_min="-<fmt:formatNumber value="${miles}" pattern="#" type="number"/>"
                             data-rate="${product.cashConversionValue}"
                             data-earn_miles_rate="${earnRate}"
                             event_component="miles_selection"
                             event_value="${product.maxMilesSpend}"
                             data-aria_enabled="true">
                            <div class="bar"></div>
                            <div class="leftGrip" style="display:none"></div>
                            <div class="rightGrip"></div>
                        </div>
                        <div class="mile-cash-slider-label">
                            <p><spring:theme code="text.product.detail.page.mpc.slider.miles"/></p>
                            <p><spring:theme code="text.product.detail.page.mpc.slider.cash"/></p>
                        </div>
                    </div>
                    <div class="row slider-input">
                        <div class="col-lg-6 col-sm-5 col-xs-6">
                            <div class="field-group">
                                <label class="field-label" for="miles"></label>
                                <input type="hidden" value="maxmiles">
                                <input type="hidden" value="minmiles">
                                <input class="field-input font-bold J-input-miles" type="number" id="miles"
                                       name="miles"
                                       placeholder="${product.maxMilesSpend}"
                                       min="${product.minimumMilesSpend}"
                                       max="${product.maxMilesSpend}"
                                       event_component="miles_entry"
                                       event_value="miles entry">
                                <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40"
                                     height="48" viewBox="0 0 40 48">
                                    <g fill="none" fill-rule="evenodd">
                                        <path fill="#FACF00"
                                              d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                        <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                        <path fill="#FACF00"
                                              d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                    </g>
                                </svg>
                            </div>
                            <p class="miles-reminder font-SemiBold J-miles-reminder">
                                <spring:theme code="text.product.detail.page.mpc.slider.minimum.miles"/>
                                <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40"
                                     height="48" viewBox="0 0 40 48">
                                    <g fill="none" fill-rule="evenodd">
                                        <path fill="#FACF00"
                                              d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                        <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                        <path fill="#FACF00"
                                              d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                    </g>
                                </svg>
                                <span class="J-miles-min">${product.minimumMilesSpend }</span>
                            </p>
                        </div>
                        <div class="col-lg-1 col-sm-1 col-xs-1 slider-plus">
                            <svg class="icon-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M12.155 10.809h6.358v1.2h-6.358v6.329h-1.2V12.01H4.625v-1.201h6.328V4.45h1.201z"/>
                            </svg>
                        </div>
                        <div class="col-lg-5 col-sm-6 col-xs-5 slider-cash font-SemiBold">
                            <span class="J-mile-cash-slider-currency currency">${countryData.currencyIsoCode} </span>
                            <span class="J-mile-cash-slider-price">0.00</span>
                        </div>

                    </div>
                    <c:if test="${not empty product.baseMilesRate && product.baseMilesRate.rate ne 0}">
                        <div class="earn-miles">
                            <div class="earn-miles-content">
                                <div class="earn-miles-content__row J-no-offers">
                                    <span class="font-SemiBold"><spring:theme code="text.product.page.earn.miles.message"/></span>
                                </div>
                                <div class="earn-miles-content__wrapper J-earn-miles-offer J-earn-miles-offer--hide">
                                    <div class="earn-miles-content__row earn-miles__title">
                                        <div class="earn-miles-content__row-content-left">
                                            <span class="font-SemiBold"><spring:theme code="text.product.page.earn.miles.title"/></span>
                                        </div>
                                        <div class="earn-miles-content__row-content-right">
                                            <span class="J-earn-miles-title-total-wrapper">
                                                <svg class="am-icon">
                                                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num"/>
                                                </svg>
                                                <span class="font-bold J-total-miles-to-earn">200</span>
                                            </span>
                                            <svg class="icon-dropdown J-expand-earn-miles-details">
                                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown"></use>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="earn-miles-content-details-wrapper J-earn-miles-content-details-wrapper earn-miles-content-details-wrapper--hide">
                                        <div class="earn-miles-content__row">
                                            <div class="earn-miles-content__row-content-left">
                                                <span class="font-SemiBold"><spring:theme
                                                        code="text.product.page.base.earn.miles.cash.spending.text"/></span>
                                                <c:if test="${not empty product.baseMilesRate}">
                                                    <svg
                                                            class="icon-promo J-promo-popup-multiple"
                                                            data-popup-content-id="cash-spending-rule-1"
                                                            data-popup-close-btn-id="close-btn-rule-1"
                                                    >
                                                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-info-small"></use>
                                                    </svg>
                                                </c:if>
                                                <div id="cash-spending-rule-1" class="popup disappear J-promotion-popup-multiple">
                                                    <div class="promotion">
                                                        <div class="title">
                                                            <h2><spring:theme code="text.product.page.base.earn.miles.cash.spending.text"/></h2>
                                                        </div>
                                                        <div class="main">
                                                            <div class="section">
                                                                <div class="earn-miles-offer-title-row">
                                                                    <div class="earn-miles-offer-title-row-left-item">
                                                                       <img src='/_ui/responsive/aml/img/earn-yellow.svg'/>
                                                                    </div>
                                                                    <div class="earn-miles-offer-title-row-middle-item font-bold">
                                                                            ${product.baseMilesRate.title}
                                                                    </div>

                                                                    <div>
                                                                        <c:if test="${not empty product.baseMilesRate.textBeforeIcon || not empty product.baseMilesRate.textAfterIcon || not empty product.baseMilesRate.summary}">
                                                                            <div class="icon-tooltip-right">
                                                                                <span class="earn-miles-icon">
                                                                                    <img src="/_ui/responsive/aml/img/earn-yellow.svg"/>
                                                                                </span>
                                                                                <c:if test="${not empty product.baseMilesRate.textBeforeIcon || not empty product.baseMilesRate.textAfterIcon}">
                                                                                    <span class="earn-miles-tag-content-block">
                                                                                    <c:if test="${not empty product.baseMilesRate.textBeforeIcon}">
                                                                                        <span>${product.baseMilesRate.textBeforeIcon}</span>
                                                                                    </c:if>
                                                                                        <svg class="am-icon">
                                                                                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num"/>
                                                                                        </svg>
                                                                                        <c:if test="${not empty product.baseMilesRate.textAfterIcon}">
                                                                                            <span>${product.baseMilesRate.textAfterIcon}</span>
                                                                                        </c:if>
                                                                                    </span>
                                                                                </c:if>
                                                                                <c:if test="${not empty product.baseMilesRate.summary}">
                                                                                    <span class="earn-miles-tag-content-block">
                                                                                        <span>${product.baseMilesRate.summary}</span>
                                                                                    </span>
                                                                                </c:if>
                                                                            </div>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                                <div class="detail">${product.baseMilesRate.description}</div>
                                                                <c:if test="${not empty product.baseMilesRate.startDate and not empty product.baseMilesRate.endDate}">
                                                                <p class="time font-bold"><spring:theme
                                                                        code="text.product.detail.page.promotion.details.period"/>:
                                                                    <fmt:formatDate value="${product.baseMilesRate.startDate}" pattern="${timePattern}"/> - <fmt:formatDate
                                                                            value="${product.baseMilesRate.endDate}" pattern="${timePattern}"/></p>
                                                                </c:if>
                                                                <c:if test="${not empty product.baseMilesRate.termsAndCondition}">
                                                                    <a class="terms-conditions" href="${product.baseMilesRate.termsAndCondition}"><spring:theme
                                                                            code="text.product.detail.page.terms.and.conditions"/></a>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <svg id="close-btn-rule-1" class="icon-close J-close-tooltip">
                                                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-close"/>
                                                    </svg>
                                                </div>

                                            </div>
                                            <div class="earn-miles-content__row-content-right J-cash-spending-from">
                                                <c:if test="${isAnonymousUser && language eq 'en'}">
                                                    <span class="font-bold cash-spending-from J-bubbling-static-icon" tabindex="0">
                                                        <spring:theme code="text.product.page.base.earn.miles.from"/>
                                                    </span>
                                                </c:if>
                                                <svg class="am-icon">
                                                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num"/>
                                                </svg>
                                                <span class="font-bold J-total-miles-to-earn">200</span>
                                                <!-- if put at the back, use this block -->
                                                <div class="bubbling-static-wrapper bubbling-static-wrapper--back">
                                                    <div class="bubbling-static">
                                                        <div class="from-wrapper">
                                                            <p>
                                                                <spring:theme code="text.product.page.base.earn.miles.bubbling"/>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:if test="${isAnonymousUser && language ne 'en'}">
                                                    <span class="font-bold cash-spending-from cash-spending-from--back J-bubbling-static-icon"
                                                          tabindex="0">
                                                        <spring:theme code="text.product.page.base.earn.miles.from"/>
                                                    </span>
                                                </c:if>
                                                <!-- /if put at the back, use this block -->
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:if>
            </div>
        </c:if>
        <!-- /wine checkbox -->
        <c:if test="${country eq 'HK' && not empty product.specialProductType && product.specialProductType eq 'ELECTRONIC'}">
            <div class="J-regulated-electronics-equipment">
                <div class="col-lg-12 col-sm-12">
                    <div>
                        <spring:theme code="text.product.detail.page.electronic.product.claim.message"/>
                    </div>
                    <div class="alert-error-message-ree" style="color: #e32020!important;">
                        <svg class="icon-alert-small">
                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-small-warning"></use>
                        </svg>
                        <span class="error-message-text font-SemiBold"><spring:theme
                                code="text.product.detail.page.electronic.ree.error.message"/> </span>
                    </div>
                    <div class="radio-group " data-signup="ACCEPTED" tabindex="1" style="margin-top: 15px;">
                        <input type="radio" class="ui-radio" id="accepted" name="statutory-free-removal-service">
                        <label for="accepted" class="field-label"><spring:theme code="text.product.detail.page.electronic.ree.accepted"/></label>
                    </div>
                    <div class="radio-group " data-signup="DECLINED" tabindex="1" style="margin-top: 15px;">
                        <input type="radio" class="ui-radio" id="declined" name="statutory-free-removal-service">
                        <label for="declined" class="field-label"><spring:theme code="text.product.detail.page.electronic.ree.declined"/></label>
                    </div>
                    <div class="radio-group " data-signup="TO_BE_DETERMINED" tabindex="1" style="margin-top: 15px;">
                        <input type="radio" class="ui-radio" id="to-be-determined" name="statutory-free-removal-service">
                        <label for="to-be-determined" class="field-label">
                            <spring:theme code="text.product.detail.page.electronic.ree.to.be.determined"/>
                        </label>
                        <div class="field-label"
                             style="font-size: 12px;line-height: 1.0625rem; margin-top: .375rem; color: #525960; margin-top: 10px;">
                            <c:choose>
                                <c:when test="${language eq 'en'}">
                                    <spring:theme code="text.product.detail.page.electronic.ree.info1"/> <a id="go-to-contact-details"
                                                                                                            href="javascript:void(0);"
                                                                                                            style="text-decoration: underline;"><spring:theme
                                        code="text.product.detail.page.electronic.ree.info2"/></a>&nbsp;<spring:theme
                                        code="text.product.detail.page.electronic.ree.info3"/>
                                </c:when>
                                <c:otherwise>
                                    <spring:theme code="text.product.detail.page.electronic.ree.info1"/> <a id="go-to-contact-details"
                                                                                                            href="javascript:void(0);"
                                                                                                            style="text-decoration: underline;"><spring:theme
                                        code="text.product.detail.page.electronic.ree.info2"/></a><spring:theme
                                        code="text.product.detail.page.electronic.ree.info3"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <!-- REE checkbox-->
                <div class="col-lg-12 col-sm-12" style="padding-top: 10px; padding-bottom: 10px;">
                    <div class="checkbox-group J-product-checkbox-group" style="border-top: solid 1px #d4d5d7; padding-top: 15px;">
                        <input class="J-agree-checkbox tnc-for-ree" type="checkbox" id="tncforree">
                        <c:choose>
                            <c:when test="${language eq 'ja' || language eq 'ko'}">
                                <label class="agree-form" for="tncforree" id="tncforree-label">
                                    <a
                                            href="https://www.asiamiles.com/en/terms-and-conditions/service/lifestyle-award-redemption-general-conditions.html"
                                            style="text-decoration: underline;"
                                            target="_blank"
                                    ><spring:theme code="text.product.detail.page.electronic.terms.and.conditions1"/></a><spring:theme
                                        code="text.product.detail.page.electronic.terms.and.conditions2"/>
                                </label>
                            </c:when>
                            <c:otherwise>
                                <label class="agree-form" for="tncforree" id="tncforree-label">
                                    <spring:theme code="text.product.detail.page.electronic.terms.and.conditions1"/>
                                    <a
                                            href="https://www.asiamiles.com/en/terms-and-conditions/service/lifestyle-award-redemption-general-conditions.html"
                                            style="text-decoration: underline;"
                                            target="_blank"
                                    ><spring:theme code="text.product.detail.page.electronic.terms.and.conditions2"/> </a>
                                </label>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <p class="alert-message agree-term-condition J-agree-term-condition font-SemiBold">
                        <svg class="icon-triangle-important">
                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-alert-small"></use>
                        </svg>
                        <spring:theme code="text.product.detail.page.electronic.terms.and.conditions.alert"/>
                    </p>
                </div>
                <!-- /REE checkbox -->
            </div>
        </c:if>
        <c:if test="${not empty accErrorMsgs}">
            <c:forEach items="${accErrorMsgs}" var="msg">
                <div class="alert-error-message">
                    <svg class="icon-alert-small" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                        <g fill="none" fill-rule="evenodd">
                            <circle cx="12" cy="12" r="9" fill="#FACF00"/>
                            <path fill="#272F38"
                                  d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                        </g>
                    </svg>
                    <span class="error-message-text font-SemiBold"><spring:theme code="${msg.code}" arguments="${msg.attributes}"
                                                                                 htmlEscape="false"
                                                                                 var="errorMessages"/>
                            ${ycommerce:sanitizeHTML(errorMessages)}</span>
                </div>
            </c:forEach>
        </c:if>
        <div class="button-wrap J-add-box">
            <div class="addToCart">
                <c:url value="/cart/add" var="addToCartUrl"/>
                <input type="hidden" id="J-productCodePost" value="${fn:escapeXml(product.code)}"/>
                <input type="hidden" id="urlAddToCart" value="${addToCartUrl}"/>
                <button type="submit" class="button-yellow font-SemiBold J-add-to-cart" data-url="${addToCartUrl}"
                        <c:if test="${not empty accErrorMsgs}">disabled</c:if> >
                    <svg class="icon-cart" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="25"
                         viewBox="0 0 24 25">
                        <g fill-rule="evenodd" transform="translate(1 .3)">
                            <path stroke="#272F38" stroke-width=".5"
                                  d="M7.639 22.17c.563 0 1.022-.45 1.022-1.002s-.459-1.001-1.022-1.001c-.564 0-1.023.449-1.023 1 0 .553.459 1.002 1.023 1.002zm0-3.334c1.312 0 2.38 1.046 2.38 2.332 0 1.286-1.068 2.332-2.38 2.332-1.313 0-2.381-1.046-2.381-2.332 0-1.286 1.068-2.332 2.38-2.332zm9.203 3.333c.563 0 1.022-.449 1.022-1.001 0-.552-.459-1.001-1.022-1.001-.564 0-1.023.449-1.023 1 0 .553.459 1.002 1.023 1.002zm0-3.333c1.312 0 2.38 1.046 2.38 2.332 0 1.286-1.068 2.332-2.38 2.332-1.313 0-2.382-1.046-2.382-2.332 0-1.286 1.069-2.332 2.382-2.332zm1.989-6.534l1.595-6.23H5.112L6.861 13.3l11.97-.998zm3.083-7.367a.693.693 0 0 1 .13.604l-1.943 7.593a.715.715 0 0 1-.637.53L6.691 14.727l-.303 1.789h12.69v1.408H5.54a.727.727 0 0 1-.548-.249.692.692 0 0 1-.16-.57l.532-3.148a.68.68 0 0 1 .114-.267L2.73 2.337 0 1.317.513 0l3.086 1.154a.71.71 0 0 1 .444.495l.729 3.015h16.576c.22 0 .43.1.566.271z"/>
                        </g>
                    </svg>
                    <span><spring:theme code="text.product.detail.page.add.to.cart"/></span>
                </button>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <c:if test="${empty accErrorMsgs && product.paymentMethod eq 'MilesPlusCash' and not empty product.cashConversionValue }">
            <div class="mpc-slider">
                <c:choose>
                    <c:when test="${isSalable}">
                        <c:if test="${product.paymentMethod eq 'MilesPlusCash'}">
                            <c:if test="${((!empty product.promotionPrice) and (product.minimumMilesSpend le product.promotionPrice.value)) or ((empty product.promotionPrice) and product.minimumMilesSpend le product.price.value)}">
                                <div class="title ">
                                    <span class="font-light J-bubbling-before"><spring:theme
                                            code="text.product.detail.page.mpc.slider.how.would.you.like.to.pay"/></span>
                                    <svg class="icon-info-small J-bubbling-icon" tabindex="0"
                                         aria-label="<spring:theme code='text.product.detail.page.title.for.mpc.explanation'/><spring:theme code='text.product.detail.page.mpc.explanation'/>"
                                         xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">
                                        <g fill="none" fill-rule="evenodd">
                                            <path fill="#D4D5D7"
                                                  d="M14.643 7.295A7.322 7.322 0 0 1 0 7.295C0 3.252 3.277 0 7.321 0s7.322 3.252 7.322 7.295"/>
                                            <path fill="#272F38" d="M6.447 3.993a.875.875 0 1 0 1.749 0 .875.875 0 0 0-1.75 0z"/>
                                            <path fill="#272F38" fill-rule="nonzero" d="M6.55 6v5.696h1.5V6z"/>
                                        </g>
                                    </svg>
                                    <div class="bubbling">
                                        <p class="bubbling-title font-SemiBold"><spring:theme
                                                code="text.product.detail.page.title.for.mpc.explanation"/></p>
                                        <p class="bubbling-text"><spring:theme code="text.product.detail.page.mpc.explanation"/></p>
                                    </div>
                                </div>
                                <p class="mile-suggestion"><spring:theme code="text.product.detail.page.mpc.slider.suggestion"/></p>
                                <div class="mile-cash-slider">
                                    <c:if test="${product.promotionPrice!=null}">
                                        <c:set var="miles" value="${product.promotionPrice.value}"/>
                                    </c:if>
                                    <c:if test="${product.promotionPrice==null}">
                                        <c:set var="miles" value="${product.price.value}"/>
                                    </c:if>
                                    <div class="nstSlider J-mile-cash-slider"
                                         single="true"
                                         data-range_min="-<fmt:formatNumber value="${miles}" pattern="#" type="number"/>"
                                         data-range_max="-${product.minimumMilesSpend}"
                                         data-cur_min="-${product.maxMilesSpend}"
                                         data-cur_max="-${product.maxMilesSpend}"
                                         data-rate="${product.cashConversionValue}"
                                         data-earn_miles_rate="${product.baseMilesRate.rate}"
                                         event_component="miles_selection"
                                         event_value="${product.maxMilesSpend}"
                                         data-aria_enabled="true">
                                        <div class="bar"></div>
                                        <div class="leftGrip" style="display:none"></div>
                                        <div class="rightGrip"></div>
                                    </div>
                                    <div class="mile-cash-slider-label">
                                        <p><spring:theme code="text.product.detail.page.mpc.slider.miles"/></p>
                                        <p><spring:theme code="text.product.detail.page.mpc.slider.cash"/></p>
                                    </div>
                                </div>
                                <div class="row slider-input">
                                    <div class="col-lg-6 col-sm-5 col-xs-6">
                                        <div class="field-group">
                                            <label class="field-label" for="miles"></label>
                                            <input type="hidden" value="maxmiles">
                                            <input type="hidden" value="minmiles">
                                            <input class="field-input font-bold J-input-miles" type="number" id="miles"
                                                   name="miles"
                                                   placeholder="${product.price.value }"
                                                   min="${product.minimumMilesSpend}"
                                                   max="${product.maxMilesSpend}"
                                                   event_component="miles_entry"
                                                   event_value="miles entry">
                                            <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                                 width="40" height="48" viewBox="0 0 40 48">
                                                <g fill="none" fill-rule="evenodd">
                                                    <path fill="#FACF00"
                                                          d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                                    <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                                    <path fill="#FACF00"
                                                          d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                                </g>
                                            </svg>
                                        </div>
                                        <p class="miles-reminder font-SemiBold J-miles-reminder">
                                            <spring:theme code="asiamiles.pdp.how.many.miles"/>
                                            <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                                 width="40" height="48" viewBox="0 0 40 48">
                                                <g fill="none" fill-rule="evenodd">
                                                    <path fill="#FACF00"
                                                          d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                                    <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                                    <path fill="#FACF00"
                                                          d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                                </g>
                                            </svg>
                                            <span class="J-miles-min">${product.minimumMilesSpend }</span>
                                        </p>
                                    </div>
                                    <div class="col-lg-1 col-sm-1 col-xs-1 slider-plus">
                                        <svg class="icon-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path d="M12.155 10.809h6.358v1.2h-6.358v6.329h-1.2V12.01H4.625v-1.201h6.328V4.45h1.201z"/>
                                        </svg>
                                    </div>
                                    <div class="col-lg-5 col-sm-6 col-xs-5 slider-cash font-SemiBold">
                                        <span class="J-mile-cash-slider-currency currency">${countryData.currencyIsoCode} </span>
                                        <span class="J-mile-cash-slider-price">0.00</span>
                                    </div>

                                </div>
                                <c:if test="${product.baseMilesRate.rate ne 0}">
                                    <div class="earn-miles">
                                        <div class="earn-miles-content">
                                            <div class="earn-miles-content__row J-no-offers">
                                                <span class="font-SemiBold"><spring:theme code="text.product.page.earn.miles.message"/></span>
                                            </div>
                                            <div class="earn-miles-content__row J-earn-miles-offer earn-miles-content__row--hide">
                                                <div class="earn-miles-content__row-content-left">
                                                    <span class="font-SemiBold"><spring:theme code="text.product.page.earn.miles.title"/> </span>
                                                </div>
                                                <div class="earn-miles-content__row-content-right">
                                                    <svg class="am-icon">
                                                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num"/>
                                                    </svg>
                                                    <span class="font-bold J-total-miles-to-earn">0</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:if>
                    </c:when>
                </c:choose>
            </div>
        </c:if>
        <!-- /wine checkbox -->
        <c:if test="${country eq 'HK' && not empty product.specialProductType && product.specialProductType eq 'ELECTRONIC'}">
            <div class="J-regulated-electronics-equipment">
                <div class="col-lg-12 col-sm-12">
                    <div>
                        <spring:theme code="text.product.detail.page.electronic.product.claim.message"/>
                    </div>
                    <div class="alert-error-message-ree" style="color: #e32020!important;">
                        <svg class="icon-alert-small">
                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-small-warning"></use>
                        </svg>
                        <span class="error-message-text font-SemiBold"><spring:theme
                                code="text.product.detail.page.electronic.ree.error.message"/> </span>
                    </div>
                    <div class="radio-group " data-signup="ACCEPTED" tabindex="1" style="margin-top: 15px;">
                        <input type="radio" class="ui-radio" id="accepted" name="statutory-free-removal-service">
                        <label for="accepted" class="field-label"><spring:theme code="text.product.detail.page.electronic.ree.accepted"/></label>
                    </div>
                    <div class="radio-group " data-signup="DECLINED" tabindex="1" style="margin-top: 15px;">
                        <input type="radio" class="ui-radio" id="declined" name="statutory-free-removal-service">
                        <label for="declined" class="field-label"><spring:theme code="text.product.detail.page.electronic.ree.declined"/></label>
                    </div>
                    <div class="radio-group " data-signup="TO_BE_DETERMINED" tabindex="1" style="margin-top: 15px;">
                        <input type="radio" class="ui-radio" id="to-be-determined" name="statutory-free-removal-service">
                        <label for="to-be-determined" class="field-label">
                            <spring:theme code="text.product.detail.page.electronic.ree.to.be.determined"/>
                        </label>
                        <div class="field-label"
                             style="font-size: 12px;line-height: 1.0625rem; margin-top: .375rem; color: #525960; margin-top: 10px;">
                            <c:choose>
                                <c:when test="${language eq 'en'}">
                                    <spring:theme code="text.product.detail.page.electronic.ree.info1"/> <a id="go-to-contact-details"
                                                                                                            href="javascript:void(0);"
                                                                                                            style="text-decoration: underline;"><spring:theme
                                        code="text.product.detail.page.electronic.ree.info2"/></a>&nbsp;<spring:theme
                                        code="text.product.detail.page.electronic.ree.info3"/>
                                </c:when>
                                <c:otherwise>
                                    <spring:theme code="text.product.detail.page.electronic.ree.info1"/> <a id="go-to-contact-details"
                                                                                                            href="javascript:void(0);"
                                                                                                            style="text-decoration: underline;"><spring:theme
                                        code="text.product.detail.page.electronic.ree.info2"/></a><spring:theme
                                        code="text.product.detail.page.electronic.ree.info3"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <!-- REE checkbox-->
                <div class="col-lg-12 col-sm-12" style="padding-top: 10px; padding-bottom: 10px;">
                    <div class="checkbox-group J-product-checkbox-group" style="border-top: solid 1px #d4d5d7; padding-top: 15px;">
                        <input class="J-agree-checkbox tnc-for-ree" type="checkbox" id="tncforree">
                        <c:choose>
                            <c:when test="${language eq 'ja' || language eq 'ko'}">
                                <label class="agree-form" for="tncforree" id="tncforree-label">
                                    <a
                                            href="https://www.asiamiles.com/en/terms-and-conditions/service/lifestyle-award-redemption-general-conditions.html"
                                            style="text-decoration: underline;"
                                            target="_blank"
                                    ><spring:theme code="text.product.detail.page.electronic.terms.and.conditions1"/></a><spring:theme
                                        code="text.product.detail.page.electronic.terms.and.conditions2"/>
                                </label>

                            </c:when>
                            <c:otherwise>
                                <label class="agree-form" for="tncforree" id="tncforree-label">
                                    <spring:theme code="text.product.detail.page.electronic.terms.and.conditions1"/>
                                    <a
                                            href="https://www.asiamiles.com/en/terms-and-conditions/service/lifestyle-award-redemption-general-conditions.html"
                                            style="text-decoration: underline;"
                                            target="_blank"
                                    ><spring:theme code="text.product.detail.page.electronic.terms.and.conditions2"/> </a>
                                </label>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <p class="alert-message agree-term-condition J-agree-term-condition font-SemiBold">
                        <svg class="icon-triangle-important">
                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-alert-small"></use>
                        </svg>
                        <spring:theme code="text.product.detail.page.electronic.terms.and.conditions.alert"/>
                    </p>
                </div>
                <!-- /REE checkbox -->
            </div>
        </c:if>
        <!-- Mileonly -->
        <c:if test="${not empty accErrorMsgs}">
            <c:forEach items="${accErrorMsgs}" var="msg">
                <div class="alert-error-message">
                    <svg class="icon-alert-small" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                        <g fill="none" fill-rule="evenodd">
                            <circle cx="12" cy="12" r="9" fill="#FACF00"/>
                            <path fill="#272F38"
                                  d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                        </g>
                    </svg>
                    <span class="error-message-text font-SemiBold"><spring:theme code="${msg.code}" arguments="${msg.attributes}"
                                                                                 htmlEscape="false"
                                                                                 var="errorMessages"/>
                            ${ycommerce:sanitizeHTML(errorMessages)}</span>
                </div>
            </c:forEach>
        </c:if>
        <div class="button-wrap J-add-box">
            <div class="addToCart">
                <button type="submit" class="button-yellow font-SemiBold J-add-to-cart" data-url="/cart/add"
                        disabled>
                    <svg class="icon-cart" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="25"
                         viewBox="0 0 24 25">
                        <g fill-rule="evenodd" transform="translate(1 .3)">
                            <path stroke="#272F38" stroke-width=".5"
                                  d="M7.639 22.17c.563 0 1.022-.45 1.022-1.002s-.459-1.001-1.022-1.001c-.564 0-1.023.449-1.023 1 0 .553.459 1.002 1.023 1.002zm0-3.334c1.312 0 2.38 1.046 2.38 2.332 0 1.286-1.068 2.332-2.38 2.332-1.313 0-2.381-1.046-2.381-2.332 0-1.286 1.068-2.332 2.38-2.332zm9.203 3.333c.563 0 1.022-.449 1.022-1.001 0-.552-.459-1.001-1.022-1.001-.564 0-1.023.449-1.023 1 0 .553.459 1.002 1.023 1.002zm0-3.333c1.312 0 2.38 1.046 2.38 2.332 0 1.286-1.068 2.332-2.38 2.332-1.313 0-2.382-1.046-2.382-2.332 0-1.286 1.069-2.332 2.382-2.332zm1.989-6.534l1.595-6.23H5.112L6.861 13.3l11.97-.998zm3.083-7.367a.693.693 0 0 1 .13.604l-1.943 7.593a.715.715 0 0 1-.637.53L6.691 14.727l-.303 1.789h12.69v1.408H5.54a.727.727 0 0 1-.548-.249.692.692 0 0 1-.16-.57l.532-3.148a.68.68 0 0 1 .114-.267L2.73 2.337 0 1.317.513 0l3.086 1.154a.71.71 0 0 1 .444.495l.729 3.015h16.576c.22 0 .43.1.566.271z"/>
                        </g>
                    </svg>
                    <span><spring:theme code="text.product.detail.page.add.to.cart"/></span>
                </button>
            </div>
        </div>
    </c:otherwise>
</c:choose>

