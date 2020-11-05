<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="hideHeaderLinks" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<spring:htmlEscape defaultHtmlEscape="true"/>

<div class="deliver-language deliver-firstTime show J-deliverLanguage" data-type="foot">
    <div class="deliver-tabs">
        <div class="radio-group J-radioBox select" data-language="en">
            <input type="radio" class="ui-radio" id="languageFistTime-en" name="radiobuttonFistTime" checked>
            <label for="languageFistTime-en" class="field-label"><spring:theme
                    code="text.asiamiles.hearder.deliveryzone.language.eng"/></label>
        </div>
        <div class="radio-group J-radioBox" data-language="zh_TW">
            <input type="radio" class="ui-radio" id="languageFistTime-zh" name="radiobuttonFistTime">
            <label for="languageFistTime-zh" class="field-label"><spring:theme
                    code="text.asiamiles.hearder.deliveryzone.language.ch"/></label>
        </div>
        <div class="radio-group J-radioBox" data-language="zh">
            <input type="radio" class="ui-radio" id="languageFistTime-cn" name="radiobuttonFistTime">
            <label for="languageFistTime-cn" class="field-label"><spring:theme
                    code="text.asiamiles.hearder.deliveryzone.language.trade.ch"/></label>
        </div>
        <div class="radio-group J-radioBox" data-language="ja">
            <input type="radio" class="ui-radio" id="languageFistTime-ja" name="radiobuttonFistTime">
            <label for="languageFistTime-ja" class="field-label"><spring:theme
                    code="text.asiamiles.hearder.deliveryzone.language.jap"/></label>
        </div>
        <div class="radio-group J-radioBox" data-language="ko">
            <input type="radio" class="ui-radio" id="languageFistTime-ko" name="radiobuttonFistTime">
            <label for="languageFistTime-ko" class="field-label"><spring:theme
                    code="text.asiamiles.hearder.deliveryzone.language.ko"/></label>
        </div>
    </div>
    <!-- en content -->
    <div class="deliver-content J-deliverContent select">
        <h2 class="title font-light"><spring:theme code="text.homepage.preferences.welcome.to.our.website"/></h2>
        <h2 class="headline language"><span class="text font-SemiBold"><spring:theme
                code="text.asiamiles.hearder.deliveryzone.chooselanguage"/></span></h2>
        <h2 class="headline"><span class="text font-SemiBold"><spring:theme
                code="text.homepage.preferences.delivery.and.payment.currency"/></span></h2>
        <div class="dropdown-group" tabindex="0">
		            <span class="dropdown-selected J-selectTrigger" aria-hidden="true">
		                <span class="dropdown-selected-text" aria-hidden="true">${currentCountry.name}</span>
		                <svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
		                    <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                                <path d="M15 0v8.414H0V0z"/>
                                <path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                            </g>
		                </svg>
		            </span>
            <!-- desktop dropdown -->
            <div class="dropdown-selected-control J-selectedControl">
                <ul class="listbox" role="listbox" aria-expanded="true">
                    <c:forEach items="${countrys}" var="countryInfo">
                        <c:choose>
                            <c:when test="${countryData.isocode eq countryInfo.isocode }">
                                <li class="option selected" role="option" data-deliver="${countryInfo.isocode }">
                            </c:when>
                            <c:otherwise>
                                <li class="option" role="option" data-deliver="${countryInfo.isocode }">
                            </c:otherwise>
                        </c:choose>
                        <a class="link" href="javascript:;">
                                ${countryInfo.name }
                            <c:choose>
                                <c:when test="${'HK' eq countryInfo.isocode}">
                                    (HKD)
                                </c:when>
                                <c:otherwise>
                                    (USD)
                                </c:otherwise>
                            </c:choose>
                        </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <!-- /desktop dropdown -->
            <!-- mobile dropdown -->
            <select use='first' class="dropdown-selected-control--mobile J-selectedControlMobile" name="title"
                    placeholder="Hong Kong (HKD)">
                <c:forEach items="${countrys}" var="countryInfo">
                    <c:choose>
                        <c:when test="${countryData.isocode eq countryInfo.isocode }">
                            <option class="option" selected="selected" value="${countryInfo.isocode }">
                        </c:when>
                        <c:otherwise>
                            <option class="option" value="${countryInfo.isocode }">
                        </c:otherwise>
                    </c:choose>
                        <c:choose>
                            <c:when test="${'HK' eq countryInfo.isocode}">
                               ${countryInfo.name } (HKD)
                            </c:when>
                            <c:otherwise>
                               ${countryInfo.name } (USD)
                            </c:otherwise>
                        </c:choose>
                    </option>
                </c:forEach>
            </select>
            <!-- /mobile dropdown -->
        </div>
        <a href="javascript:;" class="button-yellow font-SemiBold J-first-cookie-apply"><spring:theme
                code="text.homepage.preferences.apply"/></a>
    </div>
    <svg class="icon-close J-close-fisrt-setcookie" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
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
</div>