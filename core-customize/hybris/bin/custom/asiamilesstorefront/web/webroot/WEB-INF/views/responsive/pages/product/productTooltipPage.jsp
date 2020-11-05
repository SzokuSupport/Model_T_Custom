<%@ page trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="popup earn-miles_offer-details">
    <div class="tooltip">
        <div class="title">
            <h2><spring:theme code="text.product.detail.page.promotion.details.title"/></h2>
            <c:if test="${not empty discountRows && not empty bonusRuleRows}">
                <div class="tabs-wrapper">
                    <ul class="tabs">
                        <li class="tabs_tab-item selected">
                            <a
                                    class="J-tabs-item"
                                    href="javascript:void(0);"
                                    data-tab-id="promotion-details"
                            >
                                <spring:theme code="text.product.list.page.popup.discount.tag.name"/>
                            </a>
                        </li>
                        <li class="tabs_tab-item">
                            <a
                                    class="J-tabs-item"
                                    href="javascript:void(0);"
                                    data-tab-id="offer-details"
                            >
                                <spring:theme code="text.product.list.page.popup.earnedmiles.tag.name"/>
                            </a>
                        </li>
                    </ul>
                </div>
            </c:if>
        </div>
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
            <c:when test="${not empty discountRows && not empty bonusRuleRows}">
                <c:set var="tagClass" value="main"/>
                <c:set var="hideBonus" value="popup-tooltip-details--hide"/>
            </c:when>
            <c:otherwise>
                <c:set var="tagClass" value="main no-tabs"/>
            </c:otherwise>
        </c:choose>
        <div class="${tagClass}">
            <c:if test="${not empty discountRows}">
                <div class="popup-tooltip-details J-popup-tooltip-details" id="promotion-details">
                    <c:forEach var="discount" items="${discountRows}">
                        <c:set var="type" value="${discount.discountType}"/>
                        <div class="section">
                            <div class="earn-miles-offer-title-row">
                                <c:choose>
                                    <c:when test="${type eq 'OTHER' }">
                                        <div class="earn-miles-offer-title-row-left-item">
                                            <img src="/_ui/responsive/aml/img/discount-yellow.svg" />
                                        </div>
                                    </c:when>
                                    <c:when test="${type eq 'MPO' }">
                                        <div class="earn-miles-offer-title-row-left-item">
                                            <img src="/_ui/responsive/aml/img/discount-mpo-member.svg" />
                                        </div>
                                    </c:when>
                                    <c:when test="${type eq 'CO_BRAND' }">
                                        <div class="earn-miles-offer-title-row-left-item">
                                            <img src="/_ui/responsive/aml/img/discount-cobrand-card.svg" />
                                        </div>
                                    </c:when>
                                </c:choose>
                                <div class="earn-miles-offer-title-row-middle-item font-bold">
                                        ${discount.description}
                                </div>
                            </div>
                            <div class="detail">${discount.descriptionAML}</div>
                            <p class="time font-bold"><spring:theme
                                    code="text.product.detail.page.promotion.details.period"/>:
                                <fmt:formatDate value="${discount.startTime}" pattern="${timePattern}"/> - <fmt:formatDate value="${discount.endTime}"
                                                                                                                           pattern="${timePattern}"/>
                            </p>
                            <a class="terms-conditions" href="${discount.termsAndCondition}"><spring:theme
                                    code="text.product.detail.page.terms.and.conditions"/> </a>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${not empty bonusRuleRows}">
                <div class="popup-tooltip-details J-popup-tooltip-details ${hideBonus}" id="offer-details">
                    <c:forEach var="bonusRule" items="${bonusRuleRows}">
                        <c:if test="${bonusRule.status eq 'PUBLISHED'}">
                            <div class="section">
                                <div class="earn-miles-offer-title-row">
                                    <div class="earn-miles-offer-title-row-left-item">
                                        <!-- Pick from below -->
                                        <img src="/_ui/responsive/aml/img/earn-yellow.svg" />
                                    </div>
                                    <div class="earn-miles-offer-title-row-middle-item font-bold">
                                            ${bonusRule.title}
                                    </div>
                                    <div>
                                        <c:if test="${not empty bonusRule.textBeforeIcon || not empty bonusRule.textAfterIcon || not empty bonusRule.summary}">
                                            <div class="icon-tooltip-right">
                                                <span class="earn-miles-icon">
                                                    <img src="/_ui/responsive/aml/img/earn-yellow.svg"/>
                                                </span>
                                                <c:if test="${not empty bonusRule.textBeforeIcon || not empty bonusRule.textAfterIcon}">
                                                <span class="earn-miles-tag-content-block">
                                                    <c:if test="${not empty bonusRule.textBeforeIcon}">
                                                        <span>${bonusRule.textBeforeIcon}</span>
                                                    </c:if>
                                                    <svg class="am-icon"><use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num"/></svg>
                                                    <c:if test="${not empty bonusRule.textAfterIcon}">
                                                        <span>${bonusRule.textAfterIcon}</span>
                                                    </c:if>
                                                </span>
                                                </c:if>
                                                <c:if test="${not empty bonusRule.summary}">
                                                 <span class="earn-miles-tag-content-block">
                                                        <span>${bonusRule.summary}</span>
                                                </span>
                                                </c:if>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="detail">${bonusRule.description}</div>
                                <p class="time font-bold"><spring:theme
                                        code="text.product.detail.page.promotion.details.period"/>:
                                    <fmt:formatDate value="${bonusRule.startTime}" pattern="${timePattern}"/> - <fmt:formatDate value="${bonusRule.endTime}"
                                                                                                                                pattern="${timePattern}"/>
                                </p>
                                <c:if test="${not empty bonusRule.termsAndCondition}">
                                    <a class="terms-conditions" href="${bonusRule.termsAndCondition}"><spring:theme
                                            code="text.product.detail.page.terms.and.conditions"/></a>
                                </c:if>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </c:if>
        </div>
        <svg class="icon-close J-close-tooltip">
            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-close" />
        </svg>
    </div>
</div>