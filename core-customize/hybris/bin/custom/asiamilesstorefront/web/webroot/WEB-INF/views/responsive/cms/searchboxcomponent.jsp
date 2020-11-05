<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<c:url value="/search/" var="searchUrl"/>
<spring:url value="/search/autocomplete/{/componentuid}" var="autocompleteUrl" htmlEscape="false">
    <spring:param name="componentuid" value="${component.uid}"/>
</spring:url>


<div class="header__search">
    <div class="header__search--input">
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
                    <input type="text" id="js-site-search-input"  tabindex='3' event_component="internal_search" 
                           class="form-control search-input J-searchInput" name="text" value=""
                           maxlength="100"
                           data-options="${fn:escapeXml(optionsJson)}" autocomplete="off">
                           <span class='header__search--input--placeholder font-regular J-placeholder'>${waterMarkForSearchBox}</span>       
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

                <svg class="search-cancel-btn J-closeSearch" xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 26 26" tabindex='3'>
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
					
            </div>
        </form>
    </div>
    <div class="header__search--options J-searchOption">
        <span class="font-regular search-option-title"><spring:theme code = "text.search.component.popular.search"/></span>
        <div class="options-section J-headerHotTags">
        </div>
    </div>
    <div class="header__option-list J-optionList">
        <ul>

        </ul>
    </div>
</div>
    