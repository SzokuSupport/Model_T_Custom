<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>
<c:set var="showAddToCart" value="" scope="session"/>
<spring:htmlEscape defaultHtmlEscape="true"/>
<c:choose>
    <%--    Have Only One Level--%>
    <c:when test="${product.baseOptions.size() eq '1'}">
        <c:set var="variantOptions" value="${product.baseOptions[0].options}"/>
        <c:forEach items="${variantOptions}" var="variantOption">
            <c:forEach items="${variantOption.variantOptionQualifiers}" var="variantOptionQualifier">
                <c:if test="${variantOptionQualifier.qualifier eq 'color'}">
                    <c:set var="hasColor" value="true"/>
                </c:if>
                <c:if test="${variantOptionQualifier.qualifier eq 'typeValue'}">
                    <c:set var="typeName" value="${variantOption.typeName}"/>
                </c:if>
            </c:forEach>
        </c:forEach>
        <c:choose>
            <%--            Colr Selector should be handled specially--%>
            <c:when test="${hasColor eq 'true'}">
                <div class="col-lg-12 col-sm-12 product--color clearfix">
                    <c:forEach items="${variantOptions}" var="variantOption">
                        <c:set var="colorName" value=""/>
                        <c:forEach items="${variantOption.variantOptionQualifiers}" var="variantOptionQualifier">
                            <c:if test="${(variantOption.url eq product.url)}">
                                <c:set var="colorName"
                                       value="${variantOptionQualifier.name}:${variantOptionQualifier.value}"/>
                            </c:if>
                        </c:forEach>
                        <c:set var="colorSelect" value=""/>
                        <c:if test="${(variantOption.url eq product.url)}">
                            <c:set var="colorSelect" value="selected"/>
                            <p class="product--color__name J-variance-color">${colorName}</p>
                        </c:if>
                        <c:choose>
                            <c:when test="${variantOption.defualtIcon}">
                                <a class="product--color__link ${colorSelect}"
                                   href=<c:url value="${variantOption.url}"/>>
                               <span class="product--color__normal">
                                   <svg class="icon-color-pattern" xmlns="http://www.w3.org/2000/svg"
                                        xmlns:xlink="http://www.w3.org/1999/xlink" width="25" height="25"
                                        viewBox="0 0 25 25">
                                    <g fill="none" fill-rule="evenodd" transform="translate(0 -.01)">
                                        <path fill="#D8D8D8" d="M0 .011h25v25H0z"/>
                                        <path fill="#D8D8D8" d="M0 .011h25v25H0z"/>
                                        <path fill="#676D73" d="M13.339-4.05h3v37h-3z"
                                              transform="rotate(45 14.84 14.45)"/>
                                        <path fill="#676D73" d="M9.804-10h3v39h-3z" transform="rotate(45 11.304 9.5)"/>
                                        <path fill="#676D73" d="M4.854-7.536h3v27h-3z"
                                              transform="rotate(45 6.354 5.964)"/>
                                        <path fill="#676D73" d="M17.582 5.192h3v27h-3z"
                                              transform="rotate(45 19.082 18.692)"/>
                                    </g>
                                   </svg>
                               </span>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a class="product--color__link ${colorSelect}"
                                   href=<c:url value="${variantOption.url}"/>>
                                            <span class="product--color__value"
                                                  style="background: ${variantOption.hexCode}"></span>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:when>
            <%--            Other Variant type only to see if it is Time and Date--%>
            <c:otherwise>
                <c:forEach items="${variantOptions[0].variantOptionQualifiers}" var="variantOptionQualifier">
                    <c:choose>
                        <c:when test="${variantOptionQualifier.qualifier eq 'dateAndTime'}">
                            <c:set var="dropDownStyle" value="col-lg-12 col-sm-12"/>
                            <c:set var="hasDateAndTime" value="true"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="dropDownStyle" value="col-lg-6 col-sm-6"/>
                        </c:otherwise>
                    </c:choose>
                    <c:set var="optionname">${variantOptionQualifier.name}</c:set>
                    <c:if test="${not empty typeName}">
                        <c:set var="optionname" value="${typeName}"></c:set>
                    </c:if>
                    <%--dropdown group style controlled by dropDownStyle--%>
                    <div class="${dropDownStyle}">
                        <div class="dropdown-group">
                            <label for="variance-${variantOptionQualifier.qualifier}"
                                   class="dropdown-label">${optionname}</label>
                            <a class="dropdown-selected J-selectTrigger" aria-hidden="false" tabindex="0">
                                <span class="dropdown-selected-text J-variance"></span>
                                <input type="hidden" id="variance" class="J-select-input"/>
                                <label style='opacity:0'>${optionname}</label>
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
                            <!-- desktop dropdown -->
                            <div class="dropdown-selected-control J-selectedControl">
                                <ul class="listbox" role="listbox" aria-expanded="true">
                                    <c:forEach items="${variantOptions}" var="variantOption">
                                        <c:choose>
                                            <c:when test="${variantOption.url eq product.url}">
                                                <c:set var="dropDownSelected" value="option selected"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="dropDownSelected" value="option"/>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:set var="outOfStock" value=""/>
                                        <c:if test="${(variantOption.stock.stockLevel le 0) and (variantOption.stock.stockLevelStatus ne 'inStock')}">
                                            <c:set var="outOfStock">(<spring:theme
                                                    code="text.product.detail.page.variant.out.of.stock"/>)</c:set>
                                        </c:if>
                                        <li class="${dropDownSelected}" role="option" data-href="">
                                            <c:if test="${hasDateAndTime eq 'true'}">
                                                <fmt:parseDate value="${variantOption.variantOptionQualifiers[0].value}"
                                                               type="both"
                                                               pattern="EEE MMM dd HH:mm:ss z yyyy" var="time2"
                                                               parseLocale="en"/>
                                                <c:choose>
                                                    <c:when test="${language eq 'zh'}">
                                                        <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                                 pattern="yyyy年MM月dd日 HH:mm:ss"/></c:set>
                                                    </c:when>
                                                    <c:when test="${language eq 'zh_TW' }">
                                                        <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                                 pattern="yyyy年MM月dd日 HH:mm:ss"/></c:set>
                                                    </c:when>
                                                    <c:when test="${language eq 'ja'}">
                                                        <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                                 pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
                                                    </c:when>
                                                    <c:when test="${language eq 'ko'}">
                                                        <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                                 pattern="yyyy년 MM월 dd일 HH:mm:ss"/></c:set>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                                 type="both"
                                                                                                 pattern="d MMM yyyy HH:mm:ss"/></c:set>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                            <c:if test="${hasDateAndTime ne 'true'}">
                                                <c:set var="optionValue">${variantOption.variantOptionQualifiers[0].value}</c:set>
                                            </c:if>
                                            <a class="link" href=<c:url
                                                    value="${variantOption.url}"/>>${optionValue}${outOfStock}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <!-- /desktop dropdown -->
                            <!-- mobile dropdown -->
                            <select id="variance-${variantOptionQualifier.qualifier}"
                                    class="dropdown-selected-control--mobile J-selectedControlMobile">
                                <c:forEach items="${variantOptions}" var="variantOption">
                                    <c:if test="${hasDateAndTime eq 'true'}">
                                        <fmt:parseDate value="${variantOption.variantOptionQualifiers[0].value}"
                                                       type="both"
                                                       pattern="EEE MMM dd HH:mm:ss z yyyy" var="time2"
                                                       parseLocale="en"/>
                                        <c:choose>
                                            <c:when test="${language eq 'zh'}">
                                                <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                         pattern="yyyy年MM月dd日 HH:mm:ss"/></c:set>
                                            </c:when>
                                            <c:when test="${language eq 'zh_TW' }">
                                                <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                         pattern="yyyy年MM月dd日 HH:mm:ss"/></c:set>
                                            </c:when>
                                            <c:when test="${language eq 'ja'}">
                                                <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                         pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
                                            </c:when>
                                            <c:when test="${language eq 'ko'}">
                                                <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                         pattern="yyyy년 MM월 dd일 HH:mm:ss"/></c:set>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                         type="both"
                                                                                         pattern="d MMM yyyy HH:mm:ss"/></c:set>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <c:if test="${hasDateAndTime ne 'true'}">
                                        <c:set var="optionValue">${variantOption.variantOptionQualifiers[0].value}</c:set>
                                    </c:if>
                                    <c:choose>
                                        <c:when test="${variantOption.url eq product.url}">
                                            <option class="option" value="${variantOption.url}"
                                                    selected>${optionValue}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option class="option"
                                                    value="${variantOption.url}">${optionValue}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                            <!-- /mobile dropdown -->
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </c:when>
    <%--    Have More Than Two Levels--%>

    <c:when test="${product.baseOptions.size() gt '1'}">
        <c:set value="${product.baseOptions}" var="topVariant"/>
        <c:forEach var="variant" items="${topVariant}">
            <c:if test="${variant.isTheOptionSecondLevel eq true}">
                <%--                Middle Layer For 'Color'--%>
                <c:set var="middleLayerVariant" value="${variant.options}"/>
            </c:if>
            <c:if test="${variant.isTheOptionSecondLevel eq false}">
                <%--                Buttom Layer For Detailed Variants--%>
                <c:set var="bottomLayerVariant" value="${variant.options}"/>
            </c:if>
        </c:forEach>
        <c:forEach var="middleVariantOptionQulifier" items="${middleLayerVariant[0].variantOptionQualifiers}">
            <c:if test="${middleVariantOptionQulifier.qualifier eq 'color'}">
                <c:set var="hasColor" value="true"/>
            </c:if>
        </c:forEach>
        <c:choose>
            <%--        Get Color Info From Middle Layer--%>
            <c:when test="${hasColor eq 'true'}">
                <%--                First layer element--%>
                <div class="col-lg-12 col-sm-12 product--color clearfix">
                    <c:set var="colorName" value=""/>
                    <c:forEach items="${bottomLayerVariant}" var="bottomVariantOption">
                        <c:forEach items="${bottomVariantOption.variantOptionQualifiers}" var="bottomVariantQualifier">
                            <c:if test="${bottomVariantOption.url eq product.url and bottomVariantQualifier.qualifier eq 'color'}">
                                <c:set var="colorName"
                                       value="${bottomVariantQualifier.name}:${bottomVariantQualifier.value}"/>
                                <c:set var="selectedValue" value="${bottomVariantQualifier.value}"/>
                                <p class="product--color__name J-variance-color">${colorName}</p>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                    <c:forEach items="${middleLayerVariant}" var="middleVariantOption">
                        <c:forEach items="${middleVariantOption.variantOptionQualifiers}" var="middleVariantQualifier">
                            <c:set var="colorSelect" value=""/>
                            <c:if test="${selectedValue eq middleVariantQualifier.value}">
                                <c:set var="colorSelect" value="selected"/>
                            </c:if>
                            <c:choose>
                                <c:when test="${variantOption.defualtIcon}">
                                    <!-- show svg icon for color -->
                                    <a class="product--color__link ${colorSelect}"
                                       href=<c:url value="${middleVariantOption.url}"/>>
                               <span class="product--color__normal">
                                   <svg class="icon-color-pattern" xmlns="http://www.w3.org/2000/svg"
                                        xmlns:xlink="http://www.w3.org/1999/xlink" width="25" height="25"
                                        viewBox="0 0 25 25">
                                    <g fill="none" fill-rule="evenodd" transform="translate(0 -.01)">
                                        <path fill="#D8D8D8" d="M0 .011h25v25H0z"/>
                                        <path fill="#D8D8D8" d="M0 .011h25v25H0z"/>
                                        <path fill="#676D73" d="M13.339-4.05h3v37h-3z"
                                              transform="rotate(45 14.84 14.45)"/>
                                        <path fill="#676D73" d="M9.804-10h3v39h-3z" transform="rotate(45 11.304 9.5)"/>
                                        <path fill="#676D73" d="M4.854-7.536h3v27h-3z"
                                              transform="rotate(45 6.354 5.964)"/>
                                        <path fill="#676D73" d="M17.582 5.192h3v27h-3z"
                                              transform="rotate(45 19.082 18.692)"/>
                                    </g>
                                   </svg>
                               </span>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a class="product--color__link ${colorSelect}"
                                       href="${fn:escapeXml(middleVariantOption.url)}">
                                    <span class="product--color__value"
                                          style="background: ${middleVariantOption.hexCode}"/>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:forEach>
                </div>
            </c:when>
            <%--        Get Other Info From Middle Layer--%>
            <c:otherwise>
                <c:forEach var="middleVariantOptionQulifier" items="${middleLayerVariant[0].variantOptionQualifiers}">
                    <c:choose>
                        <c:when test="${middleVariantOptionQulifier.qualifier eq 'dateAndTime'}">
                            <c:set var="dropDownStyle" value="col-lg-12 col-sm-12"/>
                            <c:set var="hasDateAndTime" value="true"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="dropDownStyle" value="col-lg-6 col-sm-6"/>
                        </c:otherwise>
                    </c:choose>
                    <c:set var="optionname">${middleVariantOptionQulifier.name}</c:set>
                </c:forEach>
                <div class="${dropDownStyle}">
                    <div class="dropdown-group">
                        <label for="variance1-${variantOptionQualifier.qualifier}"
                               class="dropdown-label">${optionname}</label>
                        <a class="dropdown-selected J-selectTrigger" aria-hidden="false" tabindex="0">
                            <span class="dropdown-selected-text J-variance"></span>
                            <input type="hidden" id="variance1" class="J-select-input"/>
                            <label style='opacity:0'>${optionname}</label>
                            <svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                                <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                                    <path d="M15 0v8.414H0V0z"/>
                                    <path fill="#272F38"
                                          d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                                </g>
                            </svg>
                        </a>
                        <!-- Desktop Dropdown -->
                        <div class="dropdown-selected-control J-selectedControl">
                            <ul class="listbox" role="listbox" aria-expanded="true">
                                <c:forEach items="${middleLayerVariant}" var="middleVariantOption">
                                    <%--                                    find selected element--%>
                                    <c:forEach items="${bottomLayerVariant}" var="bottomVariantOption">
                                        <c:forEach items="${bottomVariantOption.variantOptionQualifiers}"
                                                   var="bottomVariantQualifier">
                                            <c:if test="${bottomVariantOption.url eq product.url}">
                                                <c:set var="selectedQualifiers"
                                                       value="${bottomVariantOption.variantOptionQualifiers}"/>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    <%--                                    get variant list from middle layer--%>
                                    <c:forEach items="${middleVariantOption.variantOptionQualifiers}"
                                               var="middleVariantQualifier">
                                        <c:choose>
                                            <c:when test="${fn:contains(middleVariantOption.url,product.baseProduct) eq true}">
                                                <c:set var="dropDownSelected" value="option selected"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="dropDownSelected" value="option "/>
                                            </c:otherwise>
                                        </c:choose>
                                        <li class="${dropDownSelected}" role="option" data-href="">
                                            <c:if test="${hasDateAndTime eq 'true'}">
                                                <fmt:parseDate value="${middleVariantQualifier.value}"
                                                               type="both"
                                                               pattern="EEE MMM dd HH:mm:ss z yyyy" var="time2"
                                                               parseLocale="en"/>
                                                <c:choose>
                                                    <c:when test="${language eq 'zh'}">
                                                        <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                                 pattern="yyyy年MM月dd日 HH:mm:ss"/></c:set>
                                                    </c:when>
                                                    <c:when test="${language eq 'zh_TW' }">
                                                        <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                                 pattern="yyyy年MM月dd日 HH:mm:ss"/></c:set>
                                                    </c:when>
                                                    <c:when test="${language eq 'ja'}">
                                                        <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                                 pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
                                                    </c:when>
                                                    <c:when test="${language eq 'ko'}">
                                                        <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                                 pattern="yyyy년 MM월 dd일 HH:mm:ss"/></c:set>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                                 type="both"
                                                                                                 pattern="d MMM yyyy HH:mm:ss"/></c:set>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                            <c:if test="${hasDateAndTime ne 'true'}">
                                                <c:set var="optionValue">${middleVariantOption.variantOptionQualifiers[0].value}</c:set>
                                            </c:if>
                                            <a class="link"
                                               href=<c:url value="${middleVariantOption.url}"/>>${optionValue}</a>
                                        </li>
                                    </c:forEach>
                                </c:forEach>
                            </ul>
                        </div>
                        <!-- Desktop Dropdown -->
                        <!-- Mobile Dropdown -->
                        <select id="variance1-${variantOptionQualifier.qualifier}"
                                class="dropdown-selected-control--mobile J-selectedControlMobile">
                            <c:forEach items="${middleLayerVariant}" var="middleVariantOption">
                                <%--                                find selected item--%>
                                <c:forEach items="${bottomLayerVariant}" var="bottomVariantOption">
                                    <c:forEach items="${bottomVariantOption.variantOptionQualifiers}"
                                               var="bottomVariantQualifier">
                                        <c:if test="${bottomVariantOption.url eq product.url}">
                                            <c:set var="selectedQualifiers"
                                                   value="${bottomVariantOption.variantOptionQualifiers}"/>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>

                                <c:forEach items="${middleVariantOption.variantOptionQualifiers}"
                                           var="middleVariantQualifier">
                                    <c:forEach items="${selectedQualifiers}" var="selectedQualifier">
                                        <c:if test="${selectedQualifier.value eq middleVariantQualifier.value}">
                                            <c:set value="${selectedQualifier.value}" var="selectedValue"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${hasDateAndTime eq 'true'}">
                                        <fmt:parseDate value="${middleVariantQualifier.value}"
                                                       type="both"
                                                       pattern="EEE MMM dd HH:mm:ss z yyyy" var="time2"
                                                       parseLocale="en"/>
                                        <c:choose>
                                            <c:when test="${language eq 'zh'}">
                                                <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                         pattern="yyyy年MM月dd日 HH:mm:ss"/></c:set>
                                            </c:when>
                                            <c:when test="${language eq 'zh_TW' }">
                                                <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                         pattern="yyyy年MM月dd日 HH:mm:ss"/></c:set>
                                            </c:when>
                                            <c:when test="${language eq 'ja'}">
                                                <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                         pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
                                            </c:when>
                                            <c:when test="${language eq 'ko'}">
                                                <c:set var="optionValue"><fmt:formatDate value="${time2}"
                                                                                         pattern="yyyy년 MM월 dd일 HH:mm:ss"/></c:set>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="optionValue"><fmt:formatDate value="${time2}" type="both"
                                                                                         pattern="d MMM yyyy HH:mm:ss"/></c:set>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <c:if test="${hasDateAndTime ne 'true'}">
                                        <c:set var="optionValue">${middleVariantOption.variantOptionQualifiers[0].value}</c:set>
                                    </c:if>
                                    <c:choose>
                                        <c:when test="${fn:contains(middleVariantOption.url,product.baseProduct) eq true}">
                                            <option class="option" value="${middleVariantOption.url}"
                                                    selected> ${optionValue}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option class="option"
                                                    value="${middleVariantOption.url}"> ${optionValue}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        <%--        bottom level infos--%>
        <div class="col-lg-6 col-sm-6">
            <div class="dropdown-group">
                <c:set var="middleVariantType"
                       value="${middleLayerVariant[0].variantOptionQualifiers[0].qualifier}"></c:set>
                <c:forEach items="${bottomLayerVariant}" var="bottomVariantOption">
                    <c:forEach items="${bottomVariantOption.variantOptionQualifiers}" var="bottomOptionQulifier">
                        <c:if test="${bottomOptionQulifier.qualifier ne middleVariantType}">
                            <c:set var="bottomTypeName" value="${bottomOptionQulifier.name}"/>
                        </c:if>
                    </c:forEach>
                </c:forEach>
                <label for="variance-${bottomOptionQulifier.qualifier}" class="dropdown-label">${bottomTypeName}</label>
                <a id="variance-${bottomOptionQulifier.qualifier}" class="dropdown-selected J-selectTrigger" aria-hidden="false" tabindex="0">
                    <span class="dropdown-selected-text J-variance"></span>
                    <input type="hidden" id="variance2" class="J-select-input"/>
                    <label style='opacity:0' for="variance2">${bottomTypeName}</label>
                    <svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                        <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                            <path d="M15 0v8.414H0V0z"/>
                            <path fill="#272F38"
                                  d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                        </g>
                    </svg>
                </a>
                <!-- desktop dropdown -->
                <div class="dropdown-selected-control J-selectedControl">
                    <ul class="listbox" role="listbox" aria-expanded="true">
                        <c:forEach items="${bottomLayerVariant}" var="bottomVariantOption">
                            <c:forEach items="${bottomVariantOption.variantOptionQualifiers}"
                                       var="bottomOptionQulifier">
                                <c:if test="${bottomOptionQulifier.qualifier ne middleVariantType}">
                                    <c:choose>
                                        <c:when test="${bottomVariantOption.url eq product.url}">
                                            <c:set value="option selected" var="optionSelected"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:set value="option" var="optionSelected"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:set var="outOfStock" value=""/>
                                    <c:if test="${(bottomVariantOption.stock.stockLevel le 0) and (bottomVariantOption.stock.stockLevelStatus ne 'inStock')}">
                                        <c:set var="outOfStock">(<spring:theme
                                                code="text.product.detail.page.variant.out.of.stock"/>)</c:set>
                                    </c:if>
                                    <li class="${optionSelected}" role="option" data-href="">
                                        <a class="link"
                                           href=<c:url
                                                value="${bottomVariantOption.url}"/>>${bottomOptionQulifier.value}${outOfStock}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </ul>
                </div>
                <!-- /desktop dropdown -->
                <!-- mobile dropdown -->
                <select class="dropdown-selected-control--mobile J-selectedControlMobile">
                    <c:forEach items="${bottomLayerVariant}" var="bottomVariantOption">
                        <c:forEach items="${bottomVariantOption.variantOptionQualifiers}" var="bottomOptionQulifier">
                            <c:if test="${bottomOptionQulifier.qualifier ne middleVariantType}">
                                <c:choose>
                                    <c:when test="${bottomVariantOption.url eq product.url}">
                                        <option class="option" value="${bottomVariantOption.url}"
                                                selected>${bottomOptionQulifier.value}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option class="option"
                                                value="${bottomVariantOption.url}">${bottomOptionQulifier.value}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </select>
                <!-- /mobile dropdown -->
            </div>
        </div>
    </c:when>

</c:choose>