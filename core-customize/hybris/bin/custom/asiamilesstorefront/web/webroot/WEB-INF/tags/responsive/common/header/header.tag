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

<input type="hidden" id="curentLanguage" value="${language}">
<cms:pageSlot position="TopHeaderSlot" var="component" element="div">
    <cms:component component="${component}"/>
</cms:pageSlot>
<div class="J-loading-overLayout">
    <div class="mask">
        <img class="mask-img" alt="" src="/_ui/responsive/aml/img/loading.gif" />
    </div>
</div>
<div class="header">
    <div tabindex='1' id='skipContent' aria-label="skip-to-content">skip to content</div>    
    <div class="content-fixed">
        <div class="header__nav">
            <div class="header__nav--left">
                <cms:pageSlot position="SiteLogo" var="logo" limit="1">
                    <cms:component component="${logo}" element="div" class="yComponentWrapper"/>
                </cms:pageSlot>

            </div>

            <div class="header__nav--right J-headerForLogoutMobile J-navRight">
                <!-- delivery zone component -->

                <cms:pageSlot position="HeaderDeliveryZone" var="deliveryzone">
                    <cms:component component="${deliveryzone}" class="yComponentWrapper"/>
                </cms:pageSlot>

                <cms:pageSlot position="HeaderLanguage" var="deliverylanguage">
                    <cms:component component="${deliverylanguage}" class="yComponentWrapper J-headerLanguage"/>
                </cms:pageSlot>
                <a href="javascript:;" class="header-search-icon J-showSearch" tabindex='3' aria-label="search bar- clickable">
                    <svg class="header-icon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                      <defs>
                          <path d="M17.67 16.99l5.172 5.172-1.414 1.415-5.172-5.172c-3.91 3.2-9.688 2.977-13.337-.672-3.887-3.888-3.887-10.191 0-14.08 3.888-3.887 10.191-3.887 14.08 0 3.648 3.65 3.872 9.427.671 13.338zM15.584 5.069a7.955 7.955 0 1 0-11.25 11.25 7.955 7.955 0 0 0 11.25-11.25z"/>
                      </defs>
                      <g fill="#272F38" fill-rule="evenodd" transform="translate(.996 .262)">
                          <mask fill="#fff">
                              <path d="M17.67 16.99l5.172 5.172-1.414 1.415-5.172-5.172c-3.91 3.2-9.688 2.977-13.337-.672-3.887-3.888-3.887-10.191 0-14.08 3.888-3.887 10.191-3.887 14.08 0 3.648 3.65 3.872 9.427.671 13.338zM15.584 5.069a7.955 7.955 0 1 0-11.25 11.25 7.955 7.955 0 0 0 11.25-11.25z"/>
                          </mask>
                          <path fill-rule="nonzero" d="M17.67 16.99l5.172 5.172-1.414 1.415-5.172-5.172c-3.91 3.2-9.688 2.977-13.337-.672-3.887-3.888-3.887-10.191 0-14.08 3.888-3.887 10.191-3.887 14.08 0 3.648 3.65 3.872 9.427.671 13.338zM15.584 5.069a7.955 7.955 0 1 0-11.25 11.25 7.955 7.955 0 0 0 11.25-11.25z"/>
                      </g>
                    </svg>
                </a>

                <cms:pageSlot position="MiniCart" var="cart">
                    <cms:component component="${cart}" class="yComponentWrapper"/>
                </cms:pageSlot>

                <a href="javascript:;" class="header-menu J-header-menu" status="0">
                    <ul class="J-menu-lines">
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                    <p class="whiteBorder disappear"></p>
                </a>

                <c:url value="/login" var="login"/>
                <sec:authorize access="hasAnyRole('ROLE_ANONYMOUS')">
                    <a href="${amEnrolmentUrl}" class="font-SemiBold header-join" tabindex='5' target="_blank"> <spring:theme
                            code="text.header.account.join"/></a>
                    <a href="${login }" class="font-SemiBold header-login" tabindex='5'> <spring:theme code="text.header.account.login"/></a>
                </sec:authorize>

                <sec:authorize access="!hasAnyRole('ROLE_ANONYMOUS')">
                    <!-- AMLIRR-286 Header Display - Profile start -->
                    <c:set var="memberName" value="${memberProfile.customerRecord.memberName.givenName }"/>
                    <c:if test="${empty memberProfile.customerRecord.memberName.givenName}">
                    	<c:set var="memberName" value="${memberProfile.customerRecord.memberName.familyName}"/>
                    </c:if>
                    <a href="javascript:;" class="header-user J-headerLogout" status="0" tabindex='5'>
                        <div class="header-user__mes">
                        <input type="hidden" id="keepaliveUrl" value="${keepaliveUrl}"/>
                            <c:if test="${language eq 'ja'}">
                                <p class="font-SemiBold">${memberName}
                                    &nbsp;<spring:theme
                                            code="text.header.member.welcome"/></p>
                            </c:if>
                            <c:if test="${language eq 'ko'}">
                                <p class="font-SemiBold"><spring:theme
                                        code="text.header.member.welcome1"/>&nbsp;${memberName}
                                    <spring:theme
                                            code="text.header.member.welcome2"/></p>
                            </c:if>
                            <c:if test="${language eq 'en' || language eq 'zh' ||language eq 'zh_TW'}">
                                <p class="font-SemiBold"><spring:theme
                                        code="text.header.member.welcome"/>&nbsp;${memberName}</p>
                            </c:if>
                            <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                              <g fill="none" fill-rule="evenodd">
                                  <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                  <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                  <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                              </g>
                            </svg>
                            <span class="font-SemiBold"><fmt:formatNumber
                                    value="${memberProfile.customerRecord.account.totalMilesAvailable}"
                                    maxFractionDigits="3"/></span>
                        </div>
                        <svg class="icon-mini-drop-down" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                          <path fill="none" fill-rule="evenodd" stroke="#000" stroke-opacity=".85" stroke-width="2" d="M8 10.129L11.607 14l3.726-4"/>
                        </svg>
                        <svg class="header-icon J-hideIconUser" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                          <g fill-rule="nonzero">
                              <path d="M14.57 4.892a2.972 2.972 0 1 0-5.943 0 2.972 2.972 0 0 0 5.944 0zm1.92 0a4.892 4.892 0 1 1-9.783 0 4.892 4.892 0 0 1 9.784 0zm3.787 11.852c0-2.309-1.398-4.118-2.963-4.118H6.78c-2.109 0-3.859 1.844-3.859 4.118v5.107h17.357v-5.107zm-2.963-6.038c2.75 0 4.883 2.761 4.883 6.038v6.067c0 .53-.43.96-.96.96H1.96a.96.96 0 0 1-.96-.96v-6.067c0-3.312 2.587-6.038 5.78-6.038h10.534z"/>
                              <path d="M6.81 22.912H4.89v-4.708h1.92v4.708zm-1.92 0v-4.708h1.92v4.708H4.89zM18.465 22.912h-1.92v-4.708h1.92v4.708zm-1.92 0v-4.708h1.92v4.708h-1.92z"/>
                          </g>
                        </svg>
                        <svg class="header-icon icon-close J-showIconClose" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
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
                    </a>
                    <!-- AMLIRR-286 Header Display - Profile end -->
                </sec:authorize>

            </div>

            <!-- Choose your logout -->
            <div class="header-logout-wrap J-headerLogoutContent">
                <div class="content-wrap clearfix">
                    <div class="logout-message">
                        <p class="name font-SemiBold">${memberProfile.customerRecord.memberName.familyName}, ${memberProfile.customerRecord.memberName.givenName}</p>
                        <p class="membership"><spring:theme code="text.header.member.number"/><span
                                class="font-SemiBold">${memberProfile.customerRecord.memberNumber}</span></p>
                        <a href="${overviewProfileURL}" class="font-SemiBold link overview" tabindex="5">
                            <spring:theme code="text.header.member.account.overview"/>
                            <svg class="icon-arrow-right" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                              <g fill="none" fill-rule="nonzero">
                                  <path fill="#272F38" d="M13.51 11.924L9 16.434l1.414 1.415 5.925-5.925L10.414 6 9 7.414z"/>
                                  <path fill="#FACF00" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                              </g>
                            </svg>
                        </a>
                    </div>
                    <c:if test="${needAddonJSLoad ne true}">
                        <a href="${logoutUrl}" class="font-SemiBold link logout" tabindex="5">
                            <spring:theme code="text.header.member.log.out"/>
                            <svg class="icon-arrow-right" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                              <g fill="none" fill-rule="nonzero">
                                  <path fill="#272F38" d="M13.51 11.924L9 16.434l1.414 1.415 5.925-5.925L10.414 6 9 7.414z"/>
                                  <path fill="#FACF00" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                              </g>
                            </svg>
                        </a>
                    </c:if>
                    <a href="/${language}/my-account/orders" class="font-SemiBold link your-orders" tabindex="5">
                        <spring:theme code="text.header.member.your.orders"/>
                    </a>
                </div>
            </div>
            <!-- /Choose your logout -->

            <!-- Choose your logout for mobile -->
            <div class="header-logout--mobile font-SemiBold J-headerLogoutMobile">
                <h2 class="headline">${memberProfile.customerRecord.memberName.familyName}, ${memberProfile.customerRecord.memberName.givenName}</h2>
                <ul class="item clearfix">
                    <li class="list">
                        <p class="title font-Regular"><spring:theme
                                code="text.header.member.number"/></p>
                        <p class="sub-title">${memberProfile.customerRecord.memberNumber}</p>
                    </li>
                    <li class="list">
                        <p class="title font-Regular"><spring:theme code="text.header.account.balance"/></p>
                        <p class="sub-title">
                            <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" width="17" height="20" viewBox="0 0 17 20">
                              <g fill="none" fill-rule="evenodd">
                                  <path fill="#F9D420" d="M.075 11.677c.05-.782 1.403-1.285 2.522-1.568 1.536-.387 3.565-.6 5.714-.6h.117c4.1 0 8.342.813 8.342 2.174l-.049.16-1.492-.418v-.098c0-.608-2.793-1.285-6.802-1.285-4.009 0-6.803.677-6.803 1.285v.098l-1.483.403-.066-.151"/>
                                  <path fill="#ffffff" d="M8.421.112L.073 19.996H1.35l7.07-15.67 7.071 15.67h1.278L8.421.112"/>
                                  <path fill="#F9D420" d="M8.427 13.86c-3.952 0-7.297-.673-8.134-1.638-.15-.173-.23-.357-.218-.544l.044-.09 1.505-.418v.16c0 .609 2.794 1.286 6.803 1.286s6.802-.677 6.802-1.285v-.161l1.513.394.028.122c0 .784-1.359 1.287-2.5 1.572-1.56.388-3.636.602-5.843.602"/>
                              </g>
                            </svg>
                            ${memberProfile.customerRecord.account.totalMilesAvailable}
                        </p>
                    </li>
                </ul>
<%--                <p class="wishlist"><a href="javascript:;"><spring:theme code="text.asiamiles.hearder.wishlist"/></a>--%>
<%--                </p>--%>
                <p class="your-orders"><a href="/${language}/my-account/orders"><spring:theme
                        code="text.header.member.your.orders"/></a></p>
                <p class="account-management"><spring:theme code="text.header.account.management"/></p>
                <p class="account-Overview"><a href="${overviewProfileURL}"><spring:theme
                        code="text.header.member.account.overview"/></a></p>
                <p class="Logout"><a href="${logoutUrl}"><spring:theme
                        code="text.header.member.log.out"/></a></p>
            </div>
            <!-- /Choose your logout for mobile -->

        </div>
        <!--  add displaydeliveryzone -->
        <div class="deliver-language J-deliverLanguage">
            <div class="deliver-tabs">
                <div class="radio-group J-radioBox select" data-language="en" tabindex="2">
                    <input type="radio" class="ui-radio" id="language-en" name="radiobutton" checked>
                    <label for="language-en" class="field-label"><spring:theme
                            code="text.asiamiles.hearder.deliveryzone.language.eng"/></label>
                </div>
                <div class="radio-group J-radioBox" data-language="zh_TW" tabindex="2"> 
                    <input type="radio" class="ui-radio" id="language-zh" name="radiobutton">
                    <label for="language-zh" class="field-label"><spring:theme
                            code="text.asiamiles.hearder.deliveryzone.language.ch"/></label>
                </div>
                <div class="radio-group J-radioBox" data-language="zh" tabindex="2">
                    <input type="radio" class="ui-radio" id="language-cn" name="radiobutton">
                    <label for="language-cn" class="field-label"><spring:theme
                            code="text.asiamiles.hearder.deliveryzone.language.trade.ch"/></label>
                </div>
                <div class="radio-group J-radioBox" data-language="ja" tabindex="2">
                    <input type="radio" class="ui-radio" id="language-ja" name="radiobutton">
                    <label for="language-ja" class="field-label"><spring:theme
                            code="text.asiamiles.hearder.deliveryzone.language.jap"/></label>
                </div>
                <div class="radio-group J-radioBox" data-language="ko" tabindex="2">
                    <input type="radio" class="ui-radio" id="language-ko" name="radiobutton">
                    <label for="language-ko" class="field-label"><spring:theme
                            code="text.asiamiles.hearder.deliveryzone.language.ko"/></label>
                </div>
            </div>
            <!-- en content -->
            <div class="deliver-content J-deliverContent select">
                <h2 class="headline language"><span class="text font-SemiBold"><spring:theme
                        code="text.homepage.preferences.choose.your.language"/></span></h2>
                <h2 class="headline"><span class="text font-SemiBold"><spring:theme
                        code="text.homepage.preferences.delivery.and.payment.currency"/></span></h2>
                <div class="dropdown-group" tabindex="0">
		            <span class="dropdown-selected J-selectTrigger" tabindex="2">
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
                </div>
                <a class="button-yellow font-SemiBold J-apply-button" tabindex="2"><spring:theme
                        code="text.homepage.preferences.apply"/></a>
                <select class="J-selectedControlMobile" style="display:none"></select>
            </div>
            <!-- /en content -->
        </div>
    </div>
    <a id="skiptonavigation"></a>
    <%-- <nav:topNavigation /> --%>
</div>
<div class="header__search-fixed J-searchBox">
    <div class="header__search-wrap">
        <cms:pageSlot position="SearchBox" var="searchbox" limit="1">
            <cms:component component="${searchbox}" class="yComponentWrapper"/>
        </cms:pageSlot>
    </div>
</div>

<cms:pageSlot position="BottomHeaderSlot" var="component" element="div" class="container-fluid">
    <cms:component component="${component}"/>
</cms:pageSlot>

<cms:pageSlot position="HeaderBannerSection" var="feature" class="">
    <cms:component component="${feature}" class="no-space yComponentWrapper"/>
</cms:pageSlot>