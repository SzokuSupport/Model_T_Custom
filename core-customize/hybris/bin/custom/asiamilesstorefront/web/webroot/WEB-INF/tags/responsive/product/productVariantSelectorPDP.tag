<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>

<c:set var="showAddToCart" value="" scope="session"/>
<spring:htmlEscape defaultHtmlEscape="true" />

<c:choose>
    <%-- Verify if products is a multidimensional product --%>
    <c:when test="${product.multidimensional and not empty product.variantMatrix}">
    <!-- option 1 -->
        <c:set var="levels" value="${fn:length(product.categories)}"/>
        <c:set var="selectedIndex" value="0"/>

        <div class="variant-section">
            <div class="variant-selector">
                <c:forEach begin="1" end="${levels}" varStatus="loop">
                    <c:set var="i" value="0"/>
                    <div class=" clearfix">
                        <c:choose>
                            <c:when test="${loop.index eq 1}">
                                <c:set var="productMatrix" value="${product.variantMatrix }"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="productMatrix" value="${productMatrix[selectedIndex].elements }"/>
                            </c:otherwise>
                        </c:choose>
                        <div class="variant-name">${fn:escapeXml(productMatrix[0].parentVariantCategory.name)}</div>
                        <c:choose>
                            <c:when test="${productMatrix[0].parentVariantCategory.hasImage}">
                                <ul class="variant-list">
                                    <c:forEach items="${productMatrix}" var="variantCategory">
                                        <li <c:if test="${variantCategory.variantOption.url eq product.url}">class="selected"</c:if>>
                                            <c:url value="${variantCategory.variantOption.url}" var="productStyleUrl"/>
                                            <a href="${fn:escapeXml(productStyleUrl)}" class="swatchVariant"
                                               name="${fn:escapeXml(productStyleUrl)}">
                                                <product:productImage product="${product}"
                                                                      code="${variantCategory.variantOption.code}"
                                                                      format="styleSwatch"/>
                                            </a>
                                        </li>
                                        <c:if test="${(variantCategory.variantOption.code eq product.code)}">
                                            <c:set var="selectedIndex" value="${i}"/>
                                        </c:if>
                                        <c:set var="i" value="${i + 1}"/>
                                    </c:forEach>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <select id="priority${loop.index}" class="selectPriority form-control">
                                    <c:forEach items="${productMatrix}" var="variantCategory">
                                        <c:url value="${variantCategory.variantOption.url}" var="productStyleUrl"/>
                                        <option value="${fn:escapeXml(productStyleUrl)}" ${(variantCategory.variantOption.code eq product.code) ? 'selected="selected"' : ''}>
                                                ${fn:escapeXml(variantCategory.variantValueCategory.name)}</option>
                                        <c:if test="${(variantCategory.variantOption.code eq product.code)}">
                                            <c:set var="selectedIndex" value="${i}"/>
                                        </c:if>
                                        <c:set var="i" value="${i + 1}"/>
                                    </c:forEach>
                                </select>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:when>
    <c:otherwise>
    	<!-- option 2 -->
    	<!--  ApparelStyleVariantProduct AMLTimeVariantProduct-->
    	<!--  ApparelSizeVariantProduct AMLSeatVariantProduct-->
        <%-- Determine if product is one of apparel style or size variant --%>
        <c:if test="${product.variantType eq 'AMLTimeVariantProduct'}">
            <c:set var="variantStyles" value="${product.variantOptions}"/>
        </c:if>
        <c:if test="${(not empty product.baseOptions[0].options) and (product.baseOptions[0].variantType eq 'AMLTimeVariantProduct')}">
            <c:set var="variantStyles" value="${product.baseOptions[0].options}"/>
            <c:set var="variantSizes" value="${product.variantOptions}"/>
            <c:set var="currentStyleUrl" value="${product.url}"/>
        </c:if>
        <c:if test="${(not empty product.baseOptions[1].options) and (product.baseOptions[0].variantType eq 'AMLSeatVariantProduct')}">
            <c:set var="variantStyles" value="${product.baseOptions[1].options}"/>
            <c:set var="variantSizes" value="${product.baseOptions[0].options}"/>
            <c:set var="currentStyleUrl" value="${product.baseOptions[1].selected.url}"/>
        </c:if>
        <c:url value="${currentStyleUrl}" var="currentStyledProductUrl"/>
        <%-- Determine if product is other variant --%>
        <c:if test="${empty variantStyles}">
            <c:if test="${not empty product.variantOptions}">
                <c:set var="variantOptions" value="${product.variantOptions}"/>
            </c:if>
            <c:if test="${not empty product.baseOptions[0].options}">
                <c:set var="variantOptions" value="${product.baseOptions[0].options}"/>
            </c:if>
        </c:if>
        <c:if test="${not empty variantStyles or not empty variantSizes}">
        <!-- 33333 -->
            <c:choose>
                <c:when test="${product.purchasable and product.stock.stockLevelStatus.code ne 'outOfStock' }">
                    <c:set var="showAddToCart" value="${true}" scope="session"/>
                </c:when>
                <c:otherwise>
                    <c:set var="showAddToCart" value="${false}" scope="session"/>
                </c:otherwise>
            </c:choose>
            <div class="variant-section">
                <c:if test="${not empty variantStyles}">
                    <div class="variant-selector">
		            <!-- color start -->
                        <dl class="select-item select-type">
                        	<dt>Time</dt>
                            <c:forEach items="${variantStyles}" var="variantStyle">
                                <c:forEach items="${variantStyle.variantOptionQualifiers}" var="variantOptionQualifier">
                                    <c:if test="${variantOptionQualifier.qualifier eq 'time'}">
                                        <c:set var="styleValueHtml" value="${fn:escapeXml(variantOptionQualifier.value)}"/>
                                        <c:set var="imageData" value="${variantOptionQualifier.image}"/>
                                    </c:if>
                                </c:forEach>

                                <c:choose>
                                	<c:when test="${variantStyle.url eq currentStyleUrl}">
                                		<dd class="type-item active">
		                                    <c:if test="${variantStyle.url eq currentStyleUrl}">
		                                        <div id="currentStyleValue" data-style-value="${styleValueHtml}"></div>
		                                    </c:if>
		                                    <c:url value="${variantStyle.url}" var="productStyleUrl"/>
		                                    <a href="${fn:escapeXml(productStyleUrl)}" class="colorVariant" name="${fn:escapeXml(variantStyle.url)}">
		                                    	${styleValueHtml}
		                                    </a>
                                		</dd>
                                	</c:when>
                                	<c:otherwise>
                                		<dd class="type-item">
		                                    <c:if test="${variantStyle.url eq currentStyleUrl}">
		                                        <div id="currentStyleValue" data-style-value="${styleValueHtml}"></div>
		                                    </c:if>
		                                    <c:url value="${variantStyle.url}" var="productStyleUrl"/>
		                                    <a href="${fn:escapeXml(productStyleUrl)}" class="colorVariant" name="${fn:escapeXml(variantStyle.url)}">
		                                    	${styleValueHtml}
		                                    </a>
                                		</dd>
                                	</c:otherwise>
                                </c:choose>

                            </c:forEach>
                         </dl>
                        <!-- color end -->
                    </div>
                </c:if>
                <!-- size start -->
                <c:if test="${not empty variantSizes}">
                    <div class="variant-selector">
                        <dl class="select-item select-type">
                        	<dt>Seat${variantOptionQualifier.qualifier}</dt>
                            <c:if test="${not empty variantSizes}">
                                <c:forEach items="${variantSizes}" var="variantSize">
                                    <c:set var="optionsStringHtml" value=""/>
                                    <c:set var="nameStringHtml" value=""/>
                                    <c:forEach items="${variantSize.variantOptionQualifiers}" var="variantOptionQualifier">
                                        <c:if test="${variantOptionQualifier.qualifier eq 'seat'}">
                                            <c:set var="variantOptionQualifierValueHtml" value="${fn:escapeXml(variantOptionQualifier.value)}"/>
                                            <c:set var="optionsStringHtml">${optionsStringHtml}&nbsp;${fn:escapeXml(variantOptionQualifier.name)}&nbsp;${variantOptionQualifierValueHtml} </c:set>
                                            <c:set var="nameStringHtml">${variantOptionQualifierValueHtml}</c:set>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${(variantSize.stock.stockLevel gt 0) and (variantSize.stock.stockLevelStatus ne 'outOfStock')}">
                                        <c:set var="stockLevelHtml">${fn:escapeXml(variantSize.stock.stockLevel)}&nbsp;
                                            <spring:theme code="product.variants.in.stock"/></c:set>
                                    </c:if>
                                    <c:if test="${(variantSize.stock.stockLevel le 0) and (variantSize.stock.stockLevelStatus eq 'inStock')}">
                                        <c:set var="stockLevelHtml"><spring:theme code="product.variants.available"/></c:set>
                                    </c:if>
                                    <c:if test="${(variantSize.stock.stockLevel le 0) and (variantSize.stock.stockLevelStatus ne 'inStock')}">
                                        <c:set var="stockLevelHtml"><spring:theme code="product.variants.out.of.stock"/></c:set>
                                    </c:if>

                                    <c:if test="${(variantSize.url eq product.url)}">
                                        <c:set var="showAddToCart" value="${true}" scope="session"/>
                                        <c:set var="currentSizeHtml" value="${nameStringHtml}"/>
                                    </c:if>

                                    <c:url value="${variantSize.url}" var="variantOptionUrl"/>
									<c:choose>
										<c:when test="${(variantSize.url eq product.url)}">
											<dd class="type-item active">
		                                    <a href="${fn:escapeXml(variantOptionUrl)}">
		                                    	${optionsStringHtml}
		                                    </a>
		                                    </dd>
										</c:when>
										<c:otherwise>
											<dd class="type-item">
		                                    <a href="${fn:escapeXml(variantOptionUrl)}">
		                                    	${optionsStringHtml}
		                                    </a>
		                                    </dd>
										</c:otherwise>
									</c:choose>
                                </c:forEach>
                            </c:if>
                        </dl>
                        <div id="currentSizeValue" data-size-value="${currentSizeHtml}"></div>
                        <a href="#" class="size-guide" aria-label="<spring:theme code='product.variants.size.guide'/>">&nbsp;</a>
                    </div>
                </c:if>
                <!-- size end -->
            </div>
        </c:if>
        <c:if test="${not empty variantOptions}">
        <!-- 4444 -->
            <div class="variant-section">
            	<!-- html end -->
					   <!-- product color -->
					            <div class="product--color clearfix">
					                <p class="product--color__name">Color: red</p>
					                <a class="product--color__link selected" href="javascript:;">
					                    <span class="product--color__value" style="background: #d44a90"></span>
					                </a>
					                <!-- show svg icon for color
					                <a class="product--color__link" href="javascript:;">
					                    <span class="product--color__normal">
					                        <svg class="icon-info-small">
					                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-info-small"></use>
					                        </svg>
					                    </span>
					                </a>
					                 -->
					                <a class="product--color__link" href="javascript:;">
					                    <span class="product--color__value" style="background: #272f38"></span>
					                </a>
					            </div>
					            <!-- /product color -->
					            <div class="row">
					                <div class="col-lg-12 col-sm-12">
					                    <div class="dropdown-group"  tabindex='0' aria-label="Date and Time Combo box- collapsed. Pre selected value 27 May 2019 18:30">
					    <label for="capacity" class="dropdown-label">Date & Time</label>
					    <a class="dropdown-selected J-selectTrigger" aria-hidden="false" tabindex="0">
					        <span class="dropdown-selected-text">27 May 2019 18:30</span>
					        <svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
					            <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
									<path d="M15 0v8.414H0V0z"/>
									<path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
								</g>
					        </svg>
					    </a>
					    <!-- desktop dropdown -->
					    <div class="dropdown-selected-control J-selectedControl">
					        <ul class="listbox" role="listbox" aria-expanded="true">
					            <li class="option" role="option"  data-href="">
					                <a class="link" href="javascript:;">32GB</a>
					            </li>
					            <li class="option selected" role="option" data-href="">
					                <a class="link" href="javascript:;">64GB</a>
					            </li>
					            <li class="option" role="option"  data-href="">
					                <a class="link" href="javascript:;">32GB</a>
					            </li>
					        </ul>
					    </div>
					    <!-- /desktop dropdown -->
					    <!-- mobile dropdown -->
					    <select class="dropdown-selected-control--mobile J-selectedControlMobile" name="title" placeholder="title">
					        <option class="option" value="#">mr</option>
					        <option class="option" value="#" selected>ms</option>
					        <option class="option" value="#">miss</option>
					        <option class="option" value="https://www.baidu.com">ms</option>
					        <option class="option" value="#">dr</option>
					        <option class="option" value="#">dr</option>
					    </select>
					    <!-- /mobile dropdown -->
					</div>
					                </div>
			<div class="col-lg-6 col-sm-6">
					  <div class="dropdown-group">
					    <label for="capacity" class="dropdown-label">Date & Time</label>
					    <a class="dropdown-selected J-selectTrigger" aria-hidden="false" tabindex="0">
					        <span class="dropdown-selected-text">27 May 2019 18:30</span>
					        <svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
					            <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
									<path d="M15 0v8.414H0V0z"/>
									<path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
								</g>
					        </svg>
					    </a>
					    <!-- desktop dropdown -->
					    <div class="dropdown-selected-control J-selectedControl">
					        <ul class="listbox" role="listbox" aria-expanded="true">
					            <li class="option" role="option"  data-href="">
					                <a class="link" href="javascript:;">32GB</a>
					            </li>
					            <li class="option selected" role="option" data-href="">
					                <a class="link" href="javascript:;">64GB</a>
					            </li>
					            <li class="option" role="option"  data-href="">
					                <a class="link" href="javascript:;">32GB</a>
					            </li>
					        </ul>
					    </div>
					    <!-- /desktop dropdown -->
					    <!-- mobile dropdown -->
					    <select class="dropdown-selected-control--mobile J-selectedControlMobile" name="title" placeholder="title">
					        <option class="option" value="#">mr</option>
					        <option class="option" value="#" selected>miss</option>
					        <option class="option" value="#">mr</option>
					        <option class="option" value="https://www.baidu.com">miss</option>
					        <option class="option" value="#">mr</option>
					        <option class="option" value="#">dr</option>
					    </select>
					    <!-- /mobile dropdown -->
					</div>
			 </div>
				<div class="col-lg-6 col-sm-6">
					  <div class="dropdown-group">
					    <label for="capacity" class="dropdown-label">Date & Time</label>
					    <a class="dropdown-selected J-selectTrigger" aria-hidden="false" tabindex="0">
					        <span class="dropdown-selected-text">27 May 2019 18:30</span>
					        <svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
					            <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
									<path d="M15 0v8.414H0V0z"/>
									<path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
								</g>
					        </svg>
					    </a>
					    <!-- desktop dropdown -->
					    <div class="dropdown-selected-control J-selectedControl">
					        <ul class="listbox" role="listbox" aria-expanded="true">
					            <li class="option" role="option"  data-href="">
					                <a class="link" href="javascript:;">32GB</a>
					            </li>
					            <li class="option selected" role="option" data-href="">
					                <a class="link" href="javascript:;">64GB</a>
					            </li>
					            <li class="option" role="option"  data-href="">
					                <a class="link" href="javascript:;">32GB</a>
					            </li>
					        </ul>
					    </div>
					    <!-- /desktop dropdown -->
					    <!-- mobile dropdown -->
					    <select class="dropdown-selected-control--mobile J-selectedControlMobile" name="title" placeholder="title">
					        <option class="option" value="#">mr</option>
					        <option class="option" value="#" selected>miss</option>
					        <option class="option" value="#">ms</option>
					        <option class="option" value="https://www.baidu.com">ms</option>
					        <option class="option" value="#">dr</option>
					        <option class="option" value="#">dr</option>
					    </select>
					    <!-- /mobile dropdown -->
					</div>
					</div>
					</div>
            <!-- html end -->

            2222 ${product.baseOptions[0].variantType}
            3333 ${product.baseOptions[0].options[0]}
            4444 ${product.variantOptions}
            5555 ${product.url}

				<%-- Determine if product is one of apparel style or size variant --%>
			        <c:if test="${product.variantType eq 'ApparelStyleVariantProduct'}">
			            <c:set var="variantStyles" value="${product.variantOptions}"/>
			        </c:if>
			        <c:if test="${(not empty product.baseOptions[0].options) and (product.baseOptions[0].variantType eq 'AMLColorAndSizeVariantProduct')}">
			            <c:set var="variantStyles" value="${product.baseOptions[0].options}"/>
			            <c:set var="variantSizes" value="${product.variantOptions}"/>
			            <c:set var="currentStyleUrl" value="${product.url}"/>
			        </c:if>
			        <c:if test="${(not empty product.baseOptions[1].options) and (product.baseOptions[0].variantType eq 'AMLPatternAndSizeVariantProduct')}">
			            <c:set var="variantStyles" value="${product.baseOptions[1].options}"/>
			            <c:set var="variantSizes" value="${product.baseOptions[0].options}"/>
			            <c:set var="currentStyleUrl" value="${product.baseOptions[1].selected.url}"/>
			        </c:if>
			        <c:url value="${currentStyleUrl}" var="currentStyledProductUrl"/>
			        <%-- Determine if product is other variant --%>
			        <c:if test="${empty variantStyles}">
			            <c:if test="${not empty product.variantOptions}">
			                <c:set var="variantOptions" value="${product.variantOptions}"/>
			            </c:if>
			            <c:if test="${not empty product.baseOptions[0].options}">
			                <c:set var="variantOptions" value="${product.baseOptions[0].options}"/>
			            </c:if>
			        </c:if>

            <div class="row">
            	<!-- product color -->
		            <div class="product--color clearfix">
		                <p class="product--color__name">Color: red</p>
		                <a class="product--color__link selected" href="javascript:;">
		                    <span class="product--color__value" style="background: #d44a90"></span>
		                </a>
		                <!-- show svg icon for color
		                <a class="product--color__link" href="javascript:;">
		                    <span class="product--color__normal">
		                        <svg class="icon-info-small">
		                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-info-small"></use>
		                        </svg>
		                    </span>
		                </a>
		                 -->
		                <a class="product--color__link" href="javascript:;">
		                    <span class="product--color__value" style="background: #272f38"></span>
		                </a>
		            </div>
					  <!-- /product color -->
            	<div class="col-lg-12 col-sm-6">

					</div>
            </div>

                <div class="variant-selector">
                    <select id="variant" class="form-control variant-select" disabled="disabled">
                        <option selected="selected" disabled="disabled"><spring:theme
                                code="product.variants.select.variant"/></option>
                        <c:forEach items="${variantOptions}" var="variantOption">
                            <c:set var="optionsStringHtml" value=""/>
                            <c:set var="nameStringHtml" value=""/>
                            <c:forEach items="${variantOption.variantOptionQualifiers}" var="variantOptionQualifier">
                                <c:set var="optionsStringHtml">${optionsStringHtml}&nbsp;
                                    ${fn:escapeXml(variantOptionQualifier.name)}&nbsp;${fn:escapeXml(variantOptionQualifier.value)} </c:set>
                                <c:set var="nameStringHtml">${fn:escapeXml(variantOptionQualifier.value)}</c:set>
                            </c:forEach>

                            <c:if test="${(variantOption.stock.stockLevel gt 0) and (variantSize.stock.stockLevelStatus ne 'outOfStock')}">
                                <c:set var="stockLevelHtml">${fn:escapeXml(variantOption.stock.stockLevel)} <spring:theme code="product.variants.in.stock"/></c:set>
                            </c:if>
                            <c:if test="${(variantOption.stock.stockLevel le 0) and (variantSize.stock.stockLevelStatus eq 'inStock')}">
                                <c:set var="stockLevelHtml"><spring:theme code="product.variants.available"/></c:set>
                            </c:if>
                            <c:if test="${(variantOption.stock.stockLevel le 0) and (variantSize.stock.stockLevelStatus ne 'inStock')}">
                                <c:set var="stockLevelHtml"><spring:theme code="product.variants.out.of.stock"/></c:set>
                            </c:if>
                            <c:choose>
                                <c:when test="${product.purchasable and product.stock.stockLevelStatus.code ne 'outOfStock' }">
                                    <c:set var="showAddToCart" value="${true}" scope="session"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="showAddToCart" value="${false}" scope="session"/>
                                </c:otherwise>
                            </c:choose>
                            <c:url value="${variantOption.url}" var="variantOptionUrl"/>
                            <c:if test="${(variantOption.url eq product.url)}">
                                <c:set var="showAddToCart" value="${true}" scope="session"/>
                                <c:set var="currentSizeHtml" value="${nameStringHtml}"/>
                            </c:if>
                            <option value="${fn:escapeXml(variantOptionUrl)}" ${(variantOption.url eq product.url) ? 'selected="selected"' : ''}>
                                <span class="variant-selected">${optionsStringHtml}&nbsp;<format:price
                                        priceData="${variantOption.priceData}"/>&nbsp;&nbsp;${fn:escapeXml(variantOption.stock.stockLevel)}</span>
                            </option>
                        </c:forEach>
                    </select>
                    <div id="currentTypeValue" data-type-value="${currentSizeHtml}"></div>
                </div>
            </div>
        </c:if>
    </c:otherwise>
</c:choose>
