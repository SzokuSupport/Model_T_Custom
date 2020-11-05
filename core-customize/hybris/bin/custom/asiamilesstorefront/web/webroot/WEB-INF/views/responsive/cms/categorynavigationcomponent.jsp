<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="categoryNav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:if test="${component.visible}">
    <div class="navigation J-category">
        <div class="left-arrow J-left-arrow" tabindex='7' aria-label='Arrow button-Previous Category-Clickable'>
            <svg class="icon-arrow" xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                    <path d="M15 0v8.414H0V0z"/>
                    <path fill="#272F38"
                          d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                </g>
            </svg>
        </div>
        <div class="right-arrow J-right-arrow" tabindex='7' aria-label='Arrow button-Next Category-Clickable'>
            <svg class="icon-arrow"  xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                    <path d="M15 0v8.414H0V0z"/>
                    <path fill="#272F38"
                          d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                </g>
            </svg>
        </div>
        <div class="leftMask J-mask-left"></div>
        <div class="rightMask J-mask-right"></div>
        <!--desktop navigation-->
        <div class="lists J-navigation">
            <c:forEach items="${component.navigationNode.children}" var="childRoots">
                <a class="item J-nav-item" tabindex='6' event_component="top_nav" event_value="${childRoots.title}"
                   <c:if test='${not empty childRoots.entries[0]}'>href="${childRoots.entries[0].item.localizedUrl}"</c:if>>
                    <img class="icon-nav" alt="" src="${childRoots.icon.url}"/>
                    <p class="name-nav">
                        <span>${childRoots.title}</span>
                    </p>
                    <div class="border"></div>
                </a>
            </c:forEach>
        </div>
        <!--tablet navigation-->
        <div class="lists__tablet J-navigation__tablet">
            <c:forEach items="${component.navigationNode.children}" var="childRoots">
                <div class="item J-nav-item__tablet" tabindex='6' event_component="top_nav"
                     event_value="${childRoots.title}">
                    <img class="icon-nav" alt="" src="${childRoots.icon.url}"/>
                    <p class="name-nav">
                        <span>${childRoots.title}</span>
                    </p>
                    <div class="border"></div>
                </div>
            </c:forEach>
        </div>
        <c:forEach items="${component.navigationNode.children}" var="childRoots">
            <!-- root node -->
            <ul class="slides">
                <c:if test="${not empty childRoots.children}">

                    <div class="groups">
                        <div class="column">
                            <c:forEach items="${childRoots.children}" var="childLevel1">
                                <c:if test="${childLevel1.indexForDesktopNavColumn eq 'FIRST_COLUMN'}">
                                    <categoryNav:amlcategoryNav columns="${childLevel1}"/>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="column">
                            <c:forEach items="${childRoots.children}" var="childLevel1">
                                <c:if test="${childLevel1.indexForDesktopNavColumn eq 'SECOND_COLUMN'}">
                                    <categoryNav:amlcategoryNav columns="${childLevel1}"/>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="column">
                            <c:forEach items="${childRoots.children}" var="childLevel1">
                                <c:if test="${childLevel1.indexForDesktopNavColumn eq 'THIRD_COLUMN'}">
                                    <categoryNav:amlcategoryNav columns="${childLevel1}"/>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="column">
                            <c:forEach items="${childRoots.children}" var="childLevel1">
                                <c:if test="${childLevel1.indexForDesktopNavColumn eq 'FOURTH_COLUMN'}">
                                    <categoryNav:amlcategoryNav columns="${childLevel1}"/>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="column">
                            <c:forEach items="${childRoots.children}" var="childLevel1">
                                <c:if test="${childLevel1.indexForDesktopNavColumn eq 'FIFTH_COLUMN'}">
                                    <categoryNav:amlcategoryNav columns="${childLevel1}"/>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </ul>
        </c:forEach>
    </div>

    <!--mobile-->
    <div class="nav__slide J-nav-mobile">
        <div class="flex-box">
            <sec:authorize access="hasAnyRole('ROLE_ANONYMOUS')">
                <div class="log_btn">
                    <button class="button-yellow font-SemiBold leftBtn">
                        <a href="${amEnrolmentUrl}"><spring:theme
                                code="text.header.account.join"/></a>
                    </button>
                    <div class="split__line"></div>
                    <button class="font-SemiBold rightBtn J-loginBtn"><spring:theme
                            code="text.header.account.login"/></button>
                </div>
            </sec:authorize>
            <div class="nav_category J-nav__category">
                <div class="level J-level">
                    <div class="nav_category__items J-nav__categorys">
                        <c:forEach items="${component.navigationNode.children}" var="childLevel1">
                            <div class="category__item J-category__item" <c:if
                                    test="${empty childLevel1.children}"> data-url="${childLevel1.entries[0].item.localizedUrl}" </c:if>>
                                <img class="icon-nav-category" alt="" src="${childLevel1.icon.url}"/>
                                <span>${childLevel1.title}</span>
                                <c:if test="${not empty childLevel1.children}">
                                    <svg class="icon-nav-enter" xmlns="http://www.w3.org/2000/svg"
                                         xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24"
                                         viewBox="0 0 24 24">
                                        <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                                            <path d="M15 0v8.414H0V0z"/>
                                            <path fill="#272F38"
                                                  d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                                        </g>
                                    </svg>
                                </c:if>
                                <!-- level 1 -->
                                <c:if test="${not empty childLevel1.children}">
                                    <div class="nav__slide--item J-nav-slide__item">
                                        <div class="scrollBox">
                                            <div class="nav__back J-back-main">
                                                <svg class="icon-nav-back" xmlns="http://www.w3.org/2000/svg"
                                                     xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24"
                                                     viewBox="0 0 24 24">
                                                    <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                                                        <path d="M15 0v8.414H0V0z"/>
                                                        <path fill="#272F38"
                                                              d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                                                    </g>
                                                </svg>
                                                <span class="font-bold"><spring:theme
                                                        code="category.nav.back.to.main"/></span>
                                            </div>
                                            <div class="item-category">
                                                <img class="icon-item__category" alt=""
                                                     src="${childLevel1.icon.url}"/>
                                                <span class="font-bold">${childLevel1.title}</span>
                                            </div>
                                            <ul class="item__selecter">
                                                <!-- level 2 -->
                                                <c:if test="${not empty childLevel1.children}">
                                                    <c:forEach items="${childLevel1.children}" var="childLevel2">
                                                        <li class="J-category__item--two" <c:if
                                                                test="${empty childLevel2.children}"> data-url="${childLevel2.entries[0].item.localizedUrl}" </c:if>>
                                                            <span>${childLevel2.title}</span>
                                                            <c:if test="${not empty childLevel2.children}">
                                                                <svg class="icon-arrow"
                                                                     xmlns="http://www.w3.org/2000/svg"
                                                                     xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                     width="24" height="24" viewBox="0 0 24 24">
                                                                    <g fill="none" fill-rule="evenodd"
                                                                       transform="translate(5 8)">
                                                                        <path d="M15 0v8.414H0V0z"/>
                                                                        <path fill="#272F38"
                                                                              d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                                                                    </g>
                                                                </svg>
                                                            </c:if>
                                                            <c:if test="${not empty childLevel2.children}">
                                                                <div class="nav__slide--item2 J-nav-slide__item2">
                                                                    <div class="scrollBox">
                                                                        <div class="nav__back J-back-two">
                                                                            <svg class="icon-nav-back"
                                                                                 xmlns="http://www.w3.org/2000/svg"
                                                                                 xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                                 width="24" height="24"
                                                                                 viewBox="0 0 24 24">
                                                                                <g fill="none" fill-rule="evenodd"
                                                                                   transform="translate(5 8)">
                                                                                    <path d="M15 0v8.414H0V0z"/>
                                                                                    <path fill="#272F38"
                                                                                          d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                                                                                </g>
                                                                            </svg>
                                                                            <span class="font-bold">${childLevel2.title}</span>
                                                                        </div>
                                                                        <ul class="item__selecter">
                                                                            <!-- level 3 -->
                                                                            <c:forEach items="${childLevel2.children}"
                                                                                       var="childLevel3">
                                                                                <li class="J-category__item--three"
                                                                                        <c:if test="${empty childLevel3.children}"> data-url="${childLevel3.entries[0].item.localizedUrl}" </c:if> >
                                                                                    <span>${childLevel3.title}</span>
                                                                                    <c:if test="${not empty childLevel3.children}">
                                                                                        <svg class="icon-arrow"
                                                                                             xmlns="http://www.w3.org/2000/svg"
                                                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                                             width="24" height="24"
                                                                                             viewBox="0 0 24 24">
                                                                                            <g fill="none"
                                                                                               fill-rule="evenodd"
                                                                                               transform="translate(5 8)">
                                                                                                <path d="M15 0v8.414H0V0z"/>
                                                                                                <path fill="#272F38"
                                                                                                      d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                                                                                            </g>
                                                                                        </svg>
                                                                                        <div class="nav__slide--item3 J-nav-slide__item3">
                                                                                            <div class="nav__back J-back-three">
                                                                                                <svg class="icon-nav-back"
                                                                                                     xmlns="http://www.w3.org/2000/svg"
                                                                                                     xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                                                     width="24"
                                                                                                     height="24"
                                                                                                     viewBox="0 0 24 24">
                                                                                                    <g fill="none"
                                                                                                       fill-rule="evenodd"
                                                                                                       transform="translate(5 8)">
                                                                                                        <path d="M15 0v8.414H0V0z"/>
                                                                                                        <path fill="#272F38"
                                                                                                              d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                                                                                                    </g>
                                                                                                </svg>
                                                                                                <span class="font-bold">${childLevel3.title}</span>
                                                                                            </div>
                                                                                            <ul class="item__selecter">
                                                                                                <c:if test="${not empty childLevel3.children}">
                                                                                                    <c:forEach
                                                                                                            items="${childLevel3.children}"
                                                                                                            var="lastLevel">
                                                                                                        <li data-url="${lastLevel.entries[0].item.localizedUrl}" class="J-category__item--four">
                                                                                                            <span>${lastLevel.title}</span>
                                                                                                        </li>
                                                                                                    </c:forEach>
                                                                                                </c:if>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </c:if>
                                                                                </li>
                                                                            </c:forEach>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </li>
                                                    </c:forEach>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="delivery J-nav__delivery">
                        <div class="delivery__location">
                            <div class="select-mark">
                                <div class="dropdown-group">
                                    <!-- mobile dropdown -->
                                    <select class="dropdown-selected-control--mobile J-mobile-delivery-select "
                                            name="title" use='sort' placeholder="称谓">
                                        <c:forEach items="${countrys}" var="countryInfo">
                                            <option class="option J-option"
                                                    <c:if test="${countryData.isocode eq countryInfo.isocode }">selected</c:if>
                                                    value="${countryInfo.isocode }">
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
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <!-- /mobile dropdown -->
                                </div>
                            </div>
                            <svg class="icon__nav--mobile" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                                <defs>
                                    <path d="M9.568 23.622a.923.923 0 0 1-1.531-.03l-.295-.458a373.642 373.642 0 0 1-3.124-4.958l-.244-.394c-1.352-2.199-2.343-3.891-2.853-4.905C.868 11.58.394 9.902.422 8.487.516 3.714 4.462-.079 9.23.016h.073a8.644 8.644 0 0 1 8.47 8.814c-.027 1.415-.567 3.074-1.271 4.343-.549.991-1.604 2.64-3.038 4.778l-.252.373a339.133 339.133 0 0 1-3.644 5.298zm-.379-2.686c.85-1.226 1.7-2.466 2.492-3.643l.25-.37c1.405-2.096 2.44-3.714 2.956-4.645.57-1.028 1.02-2.409 1.041-3.484a6.797 6.797 0 0 0-6.656-6.931l-.073-.001a6.797 6.797 0 0 0-6.931 6.662c-.021 1.075.373 2.473.902 3.523.479.952 1.452 2.614 2.777 4.768l.241.391a337.72 337.72 0 0 0 2.657 4.226l.344-.496zM11 8.538a1.968 1.968 0 1 0-3.936 0 1.968 1.968 0 0 0 3.936 0zm1.846 0a3.815 3.815 0 1 1-7.63 0 3.815 3.815 0 0 1 7.63 0z"/>
                                </defs>
                                <g fill="none" fill-rule="evenodd" transform="translate(2.579 -.014)">
                                    <mask fill="#fff">
                                        <path d="M9.568 23.622a.923.923 0 0 1-1.531-.03l-.295-.458a373.642 373.642 0 0 1-3.124-4.958l-.244-.394c-1.352-2.199-2.343-3.891-2.853-4.905C.868 11.58.394 9.902.422 8.487.516 3.714 4.462-.079 9.23.016h.073a8.644 8.644 0 0 1 8.47 8.814c-.027 1.415-.567 3.074-1.271 4.343-.549.991-1.604 2.64-3.038 4.778l-.252.373a339.133 339.133 0 0 1-3.644 5.298zm-.379-2.686c.85-1.226 1.7-2.466 2.492-3.643l.25-.37c1.405-2.096 2.44-3.714 2.956-4.645.57-1.028 1.02-2.409 1.041-3.484a6.797 6.797 0 0 0-6.656-6.931l-.073-.001a6.797 6.797 0 0 0-6.931 6.662c-.021 1.075.373 2.473.902 3.523.479.952 1.452 2.614 2.777 4.768l.241.391a337.72 337.72 0 0 0 2.657 4.226l.344-.496zM11 8.538a1.968 1.968 0 1 0-3.936 0 1.968 1.968 0 0 0 3.936 0zm1.846 0a3.815 3.815 0 1 1-7.63 0 3.815 3.815 0 0 1 7.63 0z"/>
                                    </mask>
                                    <path fill="#000" fill-opacity=".85" fill-rule="nonzero"
                                          d="M9.568 23.622a.923.923 0 0 1-1.531-.03l-.295-.458a373.642 373.642 0 0 1-3.124-4.958l-.244-.394c-1.352-2.199-2.343-3.891-2.853-4.905C.868 11.58.394 9.902.422 8.487.516 3.714 4.462-.079 9.23.016h.073a8.644 8.644 0 0 1 8.47 8.814c-.027 1.415-.567 3.074-1.271 4.343-.549.991-1.604 2.64-3.038 4.778l-.252.373a339.133 339.133 0 0 1-3.644 5.298zm-.379-2.686c.85-1.226 1.7-2.466 2.492-3.643l.25-.37c1.405-2.096 2.44-3.714 2.956-4.645.57-1.028 1.02-2.409 1.041-3.484a6.797 6.797 0 0 0-6.656-6.931l-.073-.001a6.797 6.797 0 0 0-6.931 6.662c-.021 1.075.373 2.473.902 3.523.479.952 1.452 2.614 2.777 4.768l.241.391a337.72 337.72 0 0 0 2.657 4.226l.344-.496zM11 8.538a1.968 1.968 0 1 0-3.936 0 1.968 1.968 0 0 0 3.936 0zm1.846 0a3.815 3.815 0 1 1-7.63 0 3.815 3.815 0 0 1 7.63 0z"/>
                                </g>
                            </svg>
                            <span><spring:theme code="text.header.delivery.to"/> &nbsp;</span>
                            <span class="font-SemiBold">${countryData.name}&nbsp; </span>
                            <span> (${countryData.currencyIsoCode}) </span>
                        </div>
                        <div class="delivery__language">
                            <div class="select-mark">
                                <div class="dropdown-group">
                                    <!-- mobile dropdown -->
                                        <%-- <c:set var="mobileLanguageUrl"></c:set> --%>
                                    <select class="dropdown-selected-control--mobile J-mobile-language-select"
                                            name="title" use='sort' placeholder="称谓">
                                        <option class="option J-option" value="en"
                                                <c:if test="${'en' eq language}">selected</c:if> ><spring:theme
                                                code="text.asiamiles.hearder.deliveryzone.language.eng"/></option>
                                        <option class="option J-option" value="zh_TW"
                                                <c:if test="${'zh_TW' eq language}">selected</c:if>><spring:theme
                                                code="text.asiamiles.hearder.deliveryzone.language.ch"/></option>
                                        <option class="option J-option" value="zh"
                                                <c:if test="${'zh' eq language}">selected</c:if>><spring:theme
                                                code="text.asiamiles.hearder.deliveryzone.language.trade.ch"/></option>
                                        <option class="option J-option" value="ja"
                                                <c:if test="${'ja' eq language}">selected</c:if>><spring:theme
                                                code="text.asiamiles.hearder.deliveryzone.language.jap"/></option>
                                        <option class="option J-option" value="ko"
                                                <c:if test="${'ko' eq language}">selected</c:if>><spring:theme
                                                code="text.asiamiles.hearder.deliveryzone.language.ko"/></option>
                                    </select>
                                    <!-- /mobile dropdown -->
                                </div>
                            </div>
                            <span class="language__icon font-SemiBold">${language}</span>
                            <span>
		                        	<c:choose>
                                        <c:when test="${'zh' eq language}"><spring:theme
                                                code="text.asiamiles.hearder.deliveryzone.language.trade.ch"/></c:when>
                                        <c:when test="${'zh_TW' eq language}"><spring:theme
                                                code="text.asiamiles.hearder.deliveryzone.language.ch"/></c:when>
                                        <c:when test="${'ja' eq language}"><spring:theme
                                                code="text.asiamiles.hearder.deliveryzone.language.jap"/></c:when>
                                        <c:when test="${'ko' eq language}"><spring:theme
                                                code="text.asiamiles.hearder.deliveryzone.language.ko"/></c:when>
                                        <c:otherwise><spring:theme
                                                code="text.asiamiles.hearder.deliveryzone.language.eng"/></c:otherwise>
                                    </c:choose>
		                        </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mark"></div>
        </div>
    </div>
</c:if>
