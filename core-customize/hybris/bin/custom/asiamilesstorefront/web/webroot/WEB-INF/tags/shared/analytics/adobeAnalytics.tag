<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true"
        pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<script type="text/javascript">

    /*Adobe Analytics **/
    window.dataLayer = window.dataLayer || {}
    var date = new Date();
    let contextData = {
        // Page/generic
        page_session_id: '<%=session.getId()%>',
        page_name: 'am:LifestyleAwards:${pageTitle}',
        page_country: '${country}',
        page_language: '${language}',
        member_country:  '${country}',
        member_language: '${language}',
        page_locale: '${language}_${country}',
        member_miles_balance: '${memberProfile.customerRecord.account.totalMilesAvailable}',
        member_hash_ID: '${memberProfile.hashedMemberID}',
        member_type: '${memberProfile.customerRecord.tierCode}',
        page_timestamp_local: date.toISOString(),
        <c:choose>
        <c:when test="${pageType eq 'PRODUCTSEARCH'}">
        product_geo_filter: '${language}_${country}',
        product_keyword_filter: '${metakeyword}',

        </c:when>
        </c:choose>
//PLP
        <c:choose>
        <c:when test="${pageType eq 'CATEGORY'}">
        product_geo_filter: '${language}_${country}',
        <c:if test="${fn:containsIgnoreCase(noUpdateSearchQuery, 'zonePrice:')}">
            product_miles_filter: '${currentMinMiles}_${currentMaxMiles}',
        </c:if>
        </c:when>
        </c:choose>
        <c:choose>
        <c:when test="${pageType eq 'CART'}">
        // Cart
        <c:set var="sum" value="0"/>
        <c:if test="${not empty cartData.appliedVouchers}">
        cart_promo_code: '${cartData.appliedVouchers.get(0)}',
        <c:forEach items="${cartData.appliedProductPromotions }" var="promotion">
        <c:if test="${not empty promotion.consumedEntries}">
        <c:forEach items="${promotion.consumedEntries }" var="consumed">
        <c:set var="sum" value="${sum+consumed.discountUnitPrice}"/>
        </c:forEach>
        </c:if>
        </c:forEach>
        </c:if>

        <c:if test="${empty cartData.appliedVouchers}">
        cart_promo_code: '',
        </c:if>

        <c:choose>
        <c:when test="${sum eq 0.00}">
        cart_promo_code_discount: '',
        </c:when>
        <c:otherwise>
        cart_promo_code_discount: '<fmt:formatNumber value="${sum}" pattern="#" type="number"/>',
        </c:otherwise>
        </c:choose>


        cart_total_miles: '<fmt:formatNumber groupingUsed="false" value="${cartData.totalPrice.value}" maxFractionDigits="0"/>',
        cart_total_cash: '<fmt:formatNumber groupingUsed="false" value="${cartData.totalPriceCash.value}" maxFractionDigits="2"/>',
        products: [
            <c:forEach var="entry" items="${cartData.entries}">
            {
                product_name: '${fn:escapeXml(entry.product.name)}',
                product_brand: '${fn:escapeXml(entry.product.brandName)}',
                product_miles: '<fmt:formatNumber groupingUsed="false" value="${entry.totalPrice.value}" maxFractionDigits="0"/>',
                product_cash: '<fmt:formatNumber groupingUsed="false" value="${entry.totalPriceCash.value}" maxFractionDigits="2"/>',
                <c:set var="instantDiscount" value="${entry.basePrice.value - entry.totalPrice.value}"/>

                <c:set var="disocuntRowSize" value="${fn:length(entry.product.discountRows)}"/>
                <c:forEach var="discountRow" items="${entry.product.discountRows}">
                <c:if test="${not empty discountRow.description &&  Integer.parseInt(disocuntRowSize)>1}">
                <c:set var="instantDiscount" value="${instantDiscount};${discountRow.description}"/>
                </c:if>
                <c:if test="${not empty discountRow.description &&  Integer.parseInt(disocuntRowSize)==1}">
                <c:set var="instantDiscount" value="${discountRow.description}"/>
                </c:if>
                </c:forEach>
                product_instant_discount: '${instantDiscount}',

                product_category_master: '${entry.product.masterCategoryName}',
                product_category_supercategory: '<c:forEach items="${entry.product.categories}" var="category" varStatus="loop"><c:out value="${category.name}"/><c:if test="${!loop.last}">|</c:if></c:forEach>',
                product_partner: '${entry.product.productPartnerCompanyName}',

                <c:if test="${not empty entry.product.baseOptions}">

                <c:set var="productOption" value="${entry.product.baseOptions[0]}"/>
                <c:forEach items="${productOption.selected.variantOptionQualifiers}" var="buffer" varStatus="status">
                <c:if test="${buffer.qualifier eq 'dateAndTime'}">
                <fmt:parseDate value="${buffer.value}" type="both" pattern="EEE MMM dd HH:mm:ss z yyyy" var="time2" parseLocale="en"/>
                product_date:'${buffer.value}',
                </c:if>
                <c:choose>
                <c:when test="${buffer.qualifier eq 'dateAndTime'}">
                <c:choose>
                <c:when test="${language eq 'zh'}">
                <c:set var="optionValue"><fmt:formatDate
                        value="${time2}"
                        type="both"
                        dateStyle="long"/></c:set>
                </c:when>
                <c:when test="${language eq 'zh_TW' }">
                <c:set var="optionValue"><fmt:formatDate
                        value="${time2}"
                        pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
                </c:when>
                <c:when test="${language eq 'ja'}">
                <c:set var="optionValue"><fmt:formatDate
                        value="${time2}"
                        pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
                </c:when>
                <c:when test="${language eq 'ko'}">
                <c:set var="optionValue"><fmt:formatDate
                        value="${time2}"
                        pattern="yyyy년 MM월 dd일 HH:mm:ss"/></c:set>
                </c:when>
                <c:otherwise>
                <c:set var="optionValue"><fmt:formatDate
                        value="${time2}"
                        type="both"
                        pattern="d MMM yyyy HH:mm:ss"/></c:set>
                </c:otherwise>
                </c:choose>

                </c:when>
                <c:otherwise>
                <c:set var="optionValue" value="${buffer.value}"/>
                </c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test="${buffer.name eq 'Type Value'}">
                product_variance${status.index+1}: '${productOption.selected.typeName}:${buffer.value}',
                </c:when>
                <c:otherwise>
                product_variance${status.index+1}: '${buffer.name}:${buffer.value}',
                </c:otherwise>
                </c:choose>
                </c:forEach>
                <c:set var="variantSize" value="${fn:length(productOption.selected.variantOptionQualifiers)}"/>
                <c:if test="${Integer.parseInt(variantSize)==1}">
                product_variance2: '',
                </c:if>
                </c:if>

                <c:if test="${empty entry.product.baseOptions}">
                product_variance1: '',
                product_variance2: '',
                </c:if>
                product_package_code: '${entry.product.code}',
                product_currency: '${entry.product.currency}',
                product_quantity: '${entry.quantity}',
            },
            </c:forEach>
        ],
        </c:when>
        <c:when test="${pageType eq 'PRODUCT'}">
        <c:choose>
        <c:when test="${empty product.externalRedirect}">
        // PDP
        product_package_code: '${product.code}',
        product_name: '${product.name}',
        product_brand: '${product.brandName}',
        product_category_master: '${product.masterCategoryName}',
        product_category_supercategory: '<c:forEach items="${product.categories}" var="category" varStatus="loop"><c:out value="${category.name}"/><c:if test="${!loop.last}">|</c:if></c:forEach>',
        product_partner: '${product.productPartnerCompanyName}',
        <c:if test="${empty product.promotionPrice}">
        product_miles: '<fmt:formatNumber groupingUsed="false" value="${product.price.value}" maxFractionDigits="0"/>',
        </c:if>
        <c:if test="${not empty product.promotionPrice}">
        product_miles: '<fmt:formatNumber groupingUsed="false" value="${product.promotionPrice.value}" maxFractionDigits="0"/>',
        </c:if>
        product_currency: '${product.currency}',
        <c:choose>
        <c:when test="${not empty product.collectionMethodTextForDisplay}">
        product_delivery: '${product.collectionMethodTextForDisplay}',
        </c:when>
        <c:otherwise>
        product_delivery: '${product.collectionMethod}',
        </c:otherwise>
        </c:choose>
        product_tagA: '${product.productTag}',
        product_tagB: '${product.productTagGroupB.name}',
        product_quantity: '1',
        product_partner: '${product.productPartnerCompanyName}',


        <c:if test="${not empty product.baseOptions}">

        <c:set var="productOption" value="${product.baseOptions[0]}"/>
        <c:forEach items="${productOption.selected.variantOptionQualifiers}" var="buffer" varStatus="status">
        <c:if test="${buffer.qualifier eq 'dateAndTime'}">
        <fmt:parseDate value="${buffer.value}" type="both" pattern="EEE MMM dd HH:mm:ss z yyyy" var="time2" parseLocale="en"/>
        product_date:'${buffer.value}',
        </c:if>
        <c:choose>
        <c:when test="${buffer.qualifier eq 'dateAndTime'}">
        <c:choose>
        <c:when test="${language eq 'zh'}">
        <c:set var="optionValue"><fmt:formatDate
                value="${time2}"
                type="both"
                dateStyle="long"/></c:set>
        </c:when>
        <c:when test="${language eq 'zh_TW' }">
        <c:set var="optionValue"><fmt:formatDate
                value="${time2}"
                pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
        </c:when>
        <c:when test="${language eq 'ja'}">
        <c:set var="optionValue"><fmt:formatDate
                value="${time2}"
                pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
        </c:when>
        <c:when test="${language eq 'ko'}">
        <c:set var="optionValue"><fmt:formatDate
                value="${time2}"
                pattern="yyyy년 MM월 dd일 HH:mm:ss"/></c:set>
        </c:when>
        <c:otherwise>
        <c:set var="optionValue"><fmt:formatDate
                value="${time2}"
                type="both"
                pattern="d MMM yyyy HH:mm:ss"/></c:set>
        </c:otherwise>
        </c:choose>

        </c:when>
        <c:otherwise>
        <c:set var="optionValue" value="${buffer.value}"/>
        </c:otherwise>
        </c:choose>
        <c:choose>
        <c:when test="${buffer.name eq 'Type Value'}">
        product_variance${status.index+1}: '${productOption.selected.typeName}:${buffer.value}',
        </c:when>
        <c:otherwise>
        product_variance${status.index+1}: '${buffer.name}:${buffer.value}',
        </c:otherwise>
        </c:choose>
        </c:forEach>
        <c:set var="variantSize" value="${fn:length(productOption.selected.variantOptionQualifiers)}"/>
        <c:if test="${Integer.parseInt(variantSize)==1}">
        product_variance2: '',
        </c:if>
        </c:if>


        </c:when>
        <c:otherwise>
        // PDP with externalRedirect
        product_package_code: '${product.code}',
        product_name: '',
        product_brand: '${product.brandName}',

        <%--product_categories: [--%>
        <%--    <c:forEach var="catEntry" items="${product.categories}">--%>
        <%--        '${catEntry.code}',--%>
        <%--    </c:forEach>--%>
        <%--    '${product.masterCategoryCode}'--%>
        <%--],--%>

        product_miles: '',
        product_currency: '',
        product_quantity: '',
        <c:choose>
        <c:when test="${not empty product.collectionMethodTextForDisplay}">
        product_delivery: '${product.collectionMethodTextForDisplay}',
        </c:when>
        <c:otherwise>
        product_delivery: '${product.collectionMethod}',
        </c:otherwise>
        </c:choose>
        product_tagA: '${product.productTag}',
        product_tagB: '${product.productTagGroupB.name}',
        product_partner: '${product.productPartnerCompanyName}',
        </c:otherwise>

        </c:choose>
        </c:when>
        <c:when test="${pageType eq 'ORDERCONFIRMATION'}">

        <c:set var="deliveryAddress" value="${orderData.deliveryAddress}"/>
        <c:set var="address" value=""/>
        <c:if test="${not empty deliveryAddress.companyName}">
        <c:set var="address" value="${address} ${deliveryAddress.companyName}"/>
        </c:if>
        <c:if test="${not empty deliveryAddress.line1}">
        <c:set var="address" value="${address} ${deliveryAddress.line1}"/>
        </c:if>
        <c:if test="${not empty deliveryAddress.line2}">
        <c:set var="address" value="${address} ${deliveryAddress.line2}"/>
        </c:if>
        <c:if test="${not empty deliveryAddress.line3}">
        <c:set var="address" value="${address} ${deliveryAddress.line3}"/>
        </c:if>
        <c:if test="${not empty deliveryAddress.city}">
        <c:set var="address" value="${address} ${deliveryAddress.city}"/>
        </c:if>
        <c:if test="${not empty deliveryAddress.state}">
        <c:set var="address" value="${address} ${deliveryAddress.state}"/>
        </c:if>
        <c:if test="${not empty deliveryAddress.countryName}">
        <c:set var="address" value="${address} ${deliveryAddress.countryName}"/>
        </c:if>
        <c:if test="${not empty deliveryAddress.postalCode}">
        <c:set var="address" value="${address} ${deliveryAddress.postalCode}"/>
        </c:if>
        //Order Confirmation
        <%--order_date: '${orderData.created}',--%>
        order_number: '${orderData.code }',
        order_email_delivery: '<c:if test="${not empty orderData.deliveryAddress.email }">Y</c:if><c:if test="${empty orderData.deliveryAddress.email }">N</c:if>',
        <c:if test="${orderData.deliveryAddress.needSmsDelivery}">
        order_sms_delivery: '+${orderData.deliveryAddress.phoneAreaCode }&nbsp;${orderData.deliveryAddress.phone}',
        </c:if>
        <c:set var="deliveryAddress" value="${orderData.deliveryAddress}"/>
        order_delivery_country: '${deliveryAddress.country.isocode}',
        cart_total_miles: '<fmt:formatNumber groupingUsed="false" value="${orderData.totalPrice.value}" maxFractionDigits="0"/>',
        cart_total_cash: '<fmt:formatNumber groupingUsed="false" value="${orderData.totalPriceCash.value}" maxFractionDigits="2"/>',
        cart_delivery_address: '<c:if test="${not empty address}">Y</c:if><c:if test="${empty address}">N</c:if>',
        cart_promo_code: '${cartData.appliedVouchers.get(0)}',
        cart_discount_total:'${cartData.totalDiscounts.value}',
        products:
            [
                <c:forEach var="entry" items="${orderData.entries}">
                <c:set var="product" value="${entry.product}"/>
                {
                    product_name: '${product.name}',
                    product_brand: '${product.brandName}',
                    product_partner: '${product.productPartnerCompanyName}',
                    product_category_master: '${product.masterCategoryName}',
                    product_category_supercategory: '<c:forEach items="${product.categories}" var="category" varStatus="loop"><c:out value="${category.name}"/><c:if test="${!loop.last}">|</c:if></c:forEach>',
                    product_cash: '<fmt:formatNumber groupingUsed="false" value="${entry.totalPriceCash.value}" maxFractionDigits="2"/>',
                    product_miles: '<fmt:formatNumber groupingUsed="false" value="${entry.totalPrice.value}" maxFractionDigits="0"/>',

                    <c:if test="${not empty entry.product.baseOptions}">

                    <c:set var="productOption" value="${entry.product.baseOptions[0]}"/>
                    <c:forEach items="${productOption.selected.variantOptionQualifiers}" var="buffer" varStatus="status">
                    <c:if test="${buffer.qualifier eq 'dateAndTime'}">
                    <fmt:parseDate value="${buffer.value}" type="both" pattern="EEE MMM dd HH:mm:ss z yyyy" var="time2" parseLocale="en"/>
                    product_date:'${buffer.value}',
                    </c:if>
                    <c:choose>
                    <c:when test="${buffer.qualifier eq 'dateAndTime'}">
                    <c:choose>
                    <c:when test="${language eq 'zh'}">
                    <c:set var="optionValue"><fmt:formatDate
                            value="${time2}"
                            type="both"
                            dateStyle="long"/></c:set>
                    </c:when>
                    <c:when test="${language eq 'zh_TW' }">
                    <c:set var="optionValue"><fmt:formatDate
                            value="${time2}"
                            pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
                    </c:when>
                    <c:when test="${language eq 'ja'}">
                    <c:set var="optionValue"><fmt:formatDate
                            value="${time2}"
                            pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
                    </c:when>
                    <c:when test="${language eq 'ko'}">
                    <c:set var="optionValue"><fmt:formatDate
                            value="${time2}"
                            pattern="yyyy년 MM월 dd일 HH:mm:ss"/></c:set>
                    </c:when>
                    <c:otherwise>
                    <c:set var="optionValue"><fmt:formatDate
                            value="${time2}"
                            type="both"
                            pattern="d MMM yyyy HH:mm:ss"/></c:set>
                    </c:otherwise>
                    </c:choose>

                    </c:when>
                    <c:otherwise>
                    <c:set var="optionValue" value="${buffer.value}"/>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test="${buffer.name eq 'Type Value'}">
                    product_variance${status.index+1}: '${productOption.selected.typeName}:${buffer.value}',
                    </c:when>
                    <c:otherwise>
                    product_variance${status.index+1}: '${buffer.name}:${buffer.value}',
                    </c:otherwise>
                    </c:choose>
                    </c:forEach>
                    <c:set var="variantSize" value="${fn:length(productOption.selected.variantOptionQualifiers)}"/>
                    <c:if test="${Integer.parseInt(variantSize)==1}">
                    product_variance2: '',
                    </c:if>
                    </c:if>

                    <c:if test="${empty entry.product.baseOptions}">
                    product_variance1: '',
                    product_variance2: '',
                    </c:if>
                    product_package_code: '${product.code}',
                    product_currency: '${product.currency}',
                    product_quantity: '${entry.quantity}',
                },
                </c:forEach>
            ],
        </c:when>
        <c:when test="${pageType eq 'ORDERHISTORY'}">
        //Order History
        orders:
            [
                <c:forEach items="${searchPageData.results}" var="order">
                {
                    order_date: '<fmt:formatDate value="${order.placed}" pattern="dd/MM/yyyy"/>',
                    order_number: '${order.code}',
                    order_value_total_miles: '<fmt:formatNumber groupingUsed="false" value="${order.totalMiles}" maxFractionDigits="0" />',
                    order_value_total_cash: '<fmt:formatNumber groupingUsed="false" value="${order.totalPriceCash}" maxFractionDigits="2" />',
                },
                </c:forEach>
            ]
        </c:when>

        <c:when test="${pageType eq 'CHECKOUTSTEPONE'}">
        cart_total_miles: '<fmt:formatNumber groupingUsed="false" value="${DeliveryInfo.cartInfo.totalPrice.value}" maxFractionDigits="0"/>',
        cart_total_cash:
            '<fmt:formatNumber groupingUsed="false" value="${DeliveryInfo.cartInfo.totalPriceCash.value}" maxFractionDigits="2"/>',
        products:
            [
                <c:forEach var="entry" items="${DeliveryInfo.cartInfo.entries}">
                {
                    product_name: '${fn:escapeXml(entry.product.name)}',
                    product_brand: '${fn:escapeXml(entry.product.brandName)}',


                    <c:if test="${not empty entry.product.baseOptions}">

                    <c:set var="productOption" value="${entry.product.baseOptions[0]}"/>

                    <c:forEach items="${productOption.selected.variantOptionQualifiers}" var="buffer" varStatus="status">
                    <c:if test="${buffer.qualifier eq 'dateAndTime'}">
                    <fmt:parseDate value="${buffer.value}" type="both" pattern="EEE MMM dd HH:mm:ss z yyyy" var="time2" parseLocale="en"/>
                    product_date:'${buffer.value}',
                    </c:if>
                    <c:choose>
                    <c:when test="${buffer.qualifier eq 'dateAndTime'}">
                    <c:choose>
                    <c:when test="${language eq 'zh'}">
                    <c:set var="optionValue"><fmt:formatDate
                            value="${time2}"
                            type="both"
                            dateStyle="long"/></c:set>
                    </c:when>
                    <c:when test="${language eq 'zh_TW' }">
                    <c:set var="optionValue"><fmt:formatDate
                            value="${time2}"
                            pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
                    </c:when>
                    <c:when test="${language eq 'ja'}">
                    <c:set var="optionValue"><fmt:formatDate
                            value="${time2}"
                            pattern="yyyy年 MM月 dd日 HH:mm:ss"/></c:set>
                    </c:when>
                    <c:when test="${language eq 'ko'}">
                    <c:set var="optionValue"><fmt:formatDate
                            value="${time2}"
                            pattern="yyyy년 MM월 dd일 HH:mm:ss"/></c:set>
                    </c:when>
                    <c:otherwise>
                    <c:set var="optionValue"><fmt:formatDate
                            value="${time2}"
                            type="both"
                            pattern="d MMM yyyy HH:mm:ss"/></c:set>
                    </c:otherwise>
                    </c:choose>

                    </c:when>
                    <c:otherwise>
                    <c:set var="optionValue" value="${buffer.value}"/>
                    </c:otherwise>
                    </c:choose>

                    <c:choose>
                    <c:when test="${buffer.name eq 'Type Value'}">
                    product_variance${status.index+1}: '${productOption.selected.typeName}:${optionValue}',
                    </c:when>
                    <c:otherwise>
                    product_variance${status.index+1}: '${buffer.name}:${optionValue}',
                    </c:otherwise>
                    </c:choose>

                    </c:forEach>


                    <c:set var="variantSize" value="${fn:length(productOption.selected.variantOptionQualifiers)}"/>
                    <c:if test="${Integer.parseInt(variantSize)==1}">
                    product_variance2: '',
                    </c:if>
                    </c:if>

                    <c:if test="${empty entry.product.baseOptions}">
                    product_variance1: '',
                    product_variance2: '',
                    </c:if>
                    product_package_code: '${product.code}',
                    product_currency: '${entry.product.currency}',
                    product_quantity: '${entry.quantity}',
                },
                </c:forEach>
            ],
        </c:when>
        <c:when test="${pageType eq 'ORDERERRORGENERAL'}">
        //Order Error
        error_code:
            "<spring:theme code='text.miles.error.page.failure.description1'/><spring:theme code='text.miles.error.page.failure.description2'/><spring:theme code='text.miles.error.page.failure.description3'/>",
        miles_spend:
            '',
        miles_balance:
            '',
        miles_difference:
            '',
        </c:when>
        <c:when test="${pageType eq 'ORDERERRORBALANCE'}">
        //Order Error
        error_code:
            "<spring:theme code='text.miles.error.page.description'/>",
        miles_spend:
            ' <fmt:formatNumber value="${require}" maxFractionDigits="3"/>',
        miles_balance:
            ' <fmt:formatNumber value="${available}" maxFractionDigits="3"/>',
        miles_difference:
            '  <fmt:formatNumber value="${need}" maxFractionDigits="3"/>',
        </c:when>
        </c:choose>
    }
    window.dataLayer = contextData
</script>
