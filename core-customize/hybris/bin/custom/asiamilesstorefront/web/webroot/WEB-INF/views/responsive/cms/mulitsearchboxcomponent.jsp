<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>


<spring:htmlEscape defaultHtmlEscape="true" />
<div class="select-miles">
    <div class="select-miles-section">
        <div class="mile-slider">
            <div class="mile-slider-info">
                <h3 class="mile-slider-title font-SemiBold"><spring:theme code="text.homepage.miles.slider.selected.message"/></h3>
                <div class="font-bold mile-slider-label">
                    <div class="cur-min">
                        <svg class="icon-yellow-min" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                            <g fill="none" fill-rule="evenodd">
                                <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                            </g>
                        </svg>
                        <span class="font-Bold J-curMin"></span>
                    </div>
                    <span>-</span>
                    <div class="cur-max">
                        <svg class="icon-yellow-max" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                            <g fill="none" fill-rule="evenodd">
                                <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                            </g>
                        </svg>
                        <span class="font-Bold J-curMax"></span>
                    </div>
                </div>
            </div>
            <div class="range-slider">
                <div class="range-min">
                    <svg class="icon-yellow-min" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                        <g fill="none" fill-rule="evenodd">
                            <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                            <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                            <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                        </g>
                    </svg>
                    <span class="font-SemiBold">0</span>
                </div>
                <div class="nstSlider"
                    data-range_min="0"
                    data-range_max="100000"
                    data-cur_min="5000"
                    data-cur_max="50000"
                    event_component="miles_selection"
                    event_value="5000-50000"
                    data-aria_enabled="true"
                >
                    <div class="bar"></div>
                    <div class="leftGrip"></div>
                    <div class="rightGrip"></div>
                </div>
                <div class="range-max">
                    <svg class="icon-yellow-max" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                        <g fill="none" fill-rule="evenodd">
                            <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                            <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                            <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                        </g>
                    </svg>
                    <span class="font-SemiBold">100,000</span>
                </div>
            </div>
        </div>
        <div class="explore-more">
            <a class="font-SemiBold btn-explore-more J-explore-more" tabindex="0" aria-label="Show me Link" event_component="explore_more" event_value="<spring:theme code='text.homepage.explore.more'/>"><spring:theme code="text.homepage.explore.more"/></a>
        </div>
    </div>
    <div class="search-section">

    <c:url value="/search/" var="searchUrl"/>
    <spring:url value="/search/autocomplete/{/componentuid}" var="autocompleteUrl" htmlEscape="false">
        <spring:param name="componentuid" value="${component.uid}"/>
    </spring:url>

    <div class="search-box">
        <form name="search_form_${fn:escapeXml(component.uid)}" method="get"
              action="${fn:escapeXml(searchUrl)}">
            <div class="input-group">
                <ycommerce:testId code="header_search_input">
                    <c:set var="optionsJson">
                        {
                        "autocompleteUrl" : "${ycommerce:encodeJSON(autocompleteUrl)}",
                        "minCharactersBeforeRequest" : "${ycommerce:encodeJSON(component.minCharactersBeforeRequest)}",
                        "waitTimeBeforeRequest" : "${ycommerce:encodeJSON(component.waitTimeBeforeRequest)}",
                        "displayProductImages" : "${ycommerce:encodeJSON(component.displayProductImages)}"
                        }
                    </c:set>
                    <label for="js-site-search-input"></label>
                    <input type="text" id="js-site-search-input" event_component="internal_search" 
                           class="form-control search-input J-searchInputBox" name="text" value=""
                           maxlength="100"
                           data-options="${fn:escapeXml(optionsJson)}" autocomplete="off">
                           <span class='search-box--placeholder font-regular J-placeholder'>${waterMarkForSearchBox}</span>       
                </ycommerce:testId>
                <svg class="icon-search-header J-search-icon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
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
                <svg class="search-cancel-btn J-cancelSearch" xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 26 26">
                    <g fill="none" fill-rule="evenodd">
                        <path d="M0 0h26v26H0z"/>
                        <g stroke="#272F38" stroke-width="1.5">
                            <path d="M18.256 7.97L7.97 18.256M7.97 7.97l10.286 10.286"/>
                        </g>
                        <g>
                            <path d="M0 0h26v26H0z"/>
                            <g stroke="#272F38" stroke-width="1.5">
                                <path d="M18.256 7.97L7.97 18.256M7.97 7.97l10.286 10.286"/>
                            </g>
                        </g>
                    </g>
                </svg>
                <!--<a href="javascript:;" class="font-regular search-cancel-btn J-cancelSearch"><spring:theme code = "asiamiles.home.page.search.cancel"/></a>-->
            </div>
        </form>
    </div>

    <div class="header__search--options J-searchOptionBox">
        <span class="font-regular search-option-title"><spring:theme code = "text.search.component.popular.search"/></span>
        <div class="options-section J-hotBox">
        </div>
    </div>
    <div class="header__option-list J-optionListBox">
        <ul>
        </ul>
    </div>
    </div>
</div>
