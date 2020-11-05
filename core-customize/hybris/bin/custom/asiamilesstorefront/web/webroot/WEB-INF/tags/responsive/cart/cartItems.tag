<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="storepickup" tagdir="/WEB-INF/tags/responsive/storepickup" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ attribute name="cartData" type="de.hybris.platform.commercefacades.order.data.CartData" %>
<div class="cart-item">
    <div class="container">
        <span hidden id="cart-id">${cartData.code}</span>
        <div class="row">
            <div class="col-lg-7 col-sm-6 cart-item--left">
                <div class="cart-item--num">
                    <span class="font-bold">${cartData.totalUnitCount}</span>
                    <spring:theme code="text.cart.page.items.in.cart"/>
                </div>
                <c:forEach var="entry" items="${cartData.entries}" varStatus="status">
                    <c:if test="${not empty validationDatas }">
                        <c:set var="lowStockFlag" value="false"/>
                        <c:forEach items="${validationDatas}" var="modification">
                            <c:if test="${entry.entryNumber eq modification.entry.entryNumber}">
                                <c:if test="${modification.statusCode eq 'lowStock'}">
                                    <c:set var="lowStockFlag" value="true"/>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <!-- cart items list -->
                    <div class="cart-item--list">
                        <div class="info clearfix">
                            <c:url value="/cart/entry/${entry.entryNumber}/remove" var="cartEntryRemoveAction"/>
                            <a href="javascript:;" aria-label='close' tabindex="0" class="icon-close J-removeCartPopup"
                               data-url="${cartEntryRemoveAction }">
                                <svg width="24px" height="24px" viewBox="0 0 24 24"
                                     version="1.1" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <g stroke="none" stroke-width="1" fill-rule="evenodd">
                                        <g>
                                            <g transform="translate(2.000000, 2.000000)">
                                                <path d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                                                <path fill-rule="nonzero"
                                                      d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
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

                            <div class="info--img ImgToBg">
                                <a href=
                                       <c:url value="/p/${entry.product.code}"/> class="content">
                                    <product:productPrimaryImage product="${entry.product}" format="cartIcon"/>
                                </a>
                            </div>
                            <div class="info--detail">
                                <p class="brand-name font-bold">${fn:escapeXml(entry.product.brandName)}</p>
                                <p class="product-name">${fn:escapeXml(entry.product.name)}</p>

                                <ul class="variant-selection clearfix" name="optionList">
                                    <c:if test="${not empty entry.product.baseOptions}">
                                        <c:forEach items="${entry.product.baseOptions}" var="option">
                                            <c:choose>
                                                <c:when test="${option.selected.code eq entry.product.code}">
                                                    <c:set var="productOption" value="${option}"/>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>
                                        <c:forEach items="${productOption.selected.variantOptionQualifiers}"
                                                   var="buffer" varStatus="status">
                                            <c:choose>
                                                <c:when test="${status.first}">
                                                    <li>
                                                        <c:choose>
                                                            <c:when test="${buffer.qualifier eq 'typeValue'}">
                                                                <span>${productOption.selected.typeName}:</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span>${buffer.name}:</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:if test="${buffer.qualifier eq 'dateAndTime'}">
                                                            <fmt:parseDate value="${buffer.value}"
                                                                           type="both"
                                                                           pattern="EEE MMM dd HH:mm:ss z yyyy"
                                                                           var="time2"
                                                                           parseLocale="en"/>

                                                        </c:if>
                                                        <c:choose>
                                                            <c:when test="${buffer.qualifier eq 'dateAndTime'}">
                                                                <c:choose>
                                                                    <c:when test="${language eq 'zh' }">
                                                                        <c:set var="optionValue"><fmt:formatDate
                                                                                value="${time2}"
                                                                                pattern="yyyy年MM月dd日 HH:mm:ss"/></c:set>
                                                                    </c:when>
                                                                    <c:when test="${language eq 'zh_TW' }">
                                                                        <c:set var="optionValue"><fmt:formatDate
                                                                                value="${time2}"
                                                                                pattern="yyyy年MM月dd日 HH:mm:ss"/></c:set>
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
                                                                <span class="font-SemiBold">${optionValue}</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="font-SemiBold">${buffer.value}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <span>${buffer.name}:</span>
                                                        <span class="font-SemiBold">${buffer.value}</span>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${!entry.cannotDelivery && !entry.cannotRedeemed && entry.isPurchasable && !entry.productShouldBeHidden}">
                                        <li>
                                            <span>
                                                <spring:theme code="text.cart.page.origin.price"/>:</span>
                                            <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48"
                                                 viewBox="0 0 40 48">
                                                <g fill="none" fill-rule="evenodd">
                                                    <path fill="#FACF00"
                                                          d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                                    <path fill="#333D47"
                                                          d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                                    <path fill="#FACF00"
                                                          d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                                </g>
                                            </svg>
                                            <span class="font-SemiBold">
                                                <fmt:formatNumber value="${entry.basePrice.value}"
                                                                  maxFractionDigits="0"/></span>
                                        </li>
                                    </c:if>
                                </ul>
                                <c:if test="${country eq 'HK' && not empty entry.product.specialProductType && entry.product.specialProductType eq 'ELECTRONIC'}">
                                    <div style="font-size: 12px;line-height: 1.0625rem; margin-top: .375rem; color: #525960; margin-top: 15px;">
                                        <c:choose>
                                            <c:when test="${empty entry.statutoryRemovalService}">
                                                <c:set var="reeStatus" value="TO_BE_DETERMINED"/>
                                                <c:set var="reeStatusAlertMesgFlag" value="true"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="reeStatus" value="${entry.statutoryRemovalService}"/>
                                                <c:set var="reeStatusAlertMesgFlag" value="false"/>
                                            </c:otherwise>
                                        </c:choose>
                                        <p class=""><spring:theme code="checkout.step1.ree.text"/><span class="font-bold">&nbsp;&nbsp;<spring:theme code="checkout.step1.ree.status.${reeStatus}"/></span></p>
                                    </div>
                                </c:if>
                                <!-- price and quantity -->
                                <input type="hidden" id="miniQuity" name="miniQuity" value="${cartTotalUnitCount}"/>
                                <c:if test="${!entry.isOutOfStock && !entry.cannotDelivery && !entry.cannotRedeemed && entry.isPurchasable && !entry.isOverMinimumMiles && !entry.productShouldBeHidden}">
                                    <div class="row quantity">
                                        <div class="col-lg-12 col-sm-12">
                                            <div class="quantity-alert">
                                                <div class="quantity clearfix">
                                                    <c:url value="/cart/update" var="cartUpdateQuantityAction"/>
                                                    <button class="lower-button J-lowerButton" tabindex="0"
                                                            aria-label='Clickable button Minus icon- to decreased the product quantity in Cart'
                                                            data-url="${cartUpdateQuantityAction }" <c:if
                                                                    test="${entry.quantity == 1}">disabled
                                                    </c:if>>
                                                        <svg class="icon-lower" xmlns="http://www.w3.org/2000/svg"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink" width="40"
                                                             height="40" viewBox="0 0 40 40">
                                                            <g fill-rule="evenodd" transform="translate(0 19)">
                                                                <path d="M0 0h40v3H0z"/>
                                                                <mask>
                                                                    <path d="M0 0h40v3H0z"/>
                                                                </mask>
                                                            </g>
                                                        </svg>
                                                    </button>
                                                    <span hidden class="J-productCode">${entry.product.code}</span>
                                                    <span class="num font-bold J-entryNumber"
                                                          data-entryNumber="${fn:escapeXml(entry.entryNumber)}">${entry.quantity}</span>
                                                    <button class="plus-button J-plusButton" tabindex="0"
                                                            aria-label='Clickable button plus icon- to increase the product quantity in Cart'
                                                            data-url="${cartUpdateQuantityAction }" <c:if
                                                                    test="${entry.quantity >= entry.maxOrderQuantity || lowStockFlag}">disabled</c:if>>
                                                        <svg class="icon-plus" xmlns="http://www.w3.org/2000/svg"
                                                             viewBox="0 0 24 24">
                                                            <path d="M12.155 10.809h6.358v1.2h-6.358v6.329h-1.2V12.01H4.625v-1.201h6.328V4.45h1.201z"/>
                                                        </svg>
                                                    </button>
                                                    </button>
                                                </div>
                                                <p class="alert-message">
                                                    <c:choose>
                                                        <c:when test="${entry.quantity eq entry.maxOrderQuantity}">
                                                            <span><spring:theme
                                                                    code="text.cart.page.product.alert.maximum.quantity"/></span>
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${entry.isOutOfStock}">
                                    <div class="row">
                                        <div class="col-lg-12 col-sm-12">
                                            <p class="out-of-stock">
                                                <svg class="icon-small-warning" xmlns="http://www.w3.org/2000/svg"
                                                     width="24" height="24" viewBox="0 0 24 24">
                                                    <g fill="none" fill-rule="evenodd">
                                                        <path fill="#D0021B"
                                                              d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                                        <path fill="#FFF"
                                                              d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                                    </g>
                                                </svg>
                                                <span class="error-text"><spring:theme
                                                        code="text.cart.page.product.alert.out.of.stock"/></span>
                                            </p>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${lowStockFlag}">
                                    <p class="alert-message">
                                        <svg class="icon-triangle-important" xmlns="http://www.w3.org/2000/svg"
                                             width="24" height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="evenodd">
                                                <circle cx="12" cy="12" r="9" fill="#FACF00"/>
                                                <path fill="#272F38"
                                                      d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                            </g>
                                        </svg>
                                        <span class="error-text"><spring:theme
                                                code="text.cart.page.product.alert.low.stock"
                                                arguments="${entry.quantity }"/></span>
                                    </p>
                                </c:if>
                                <!-- /price and quantity -->
                            </div>
                        </div>
                        <c:if
                                test="${!entry.isOutOfStock && !entry.cannotDelivery && !entry.cannotRedeemed && entry.isPurchasable && !entry.isOverMinimumMiles && !entry.productShouldBeHidden}">
                            <div class="miles-cash clearfix">
                                <div class="miles font-bold">
                                    <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
                                         xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48"
                                         viewBox="0 0 40 48">
                                        <g fill="none" fill-rule="evenodd">
                                            <path fill="#FACF00"
                                                  d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                            <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                            <path fill="#FACF00"
                                                  d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                        </g>
                                    </svg>
                                    <fmt:formatNumber value="${entry.totalPrice.value}" maxFractionDigits="0"/>
                                </div>
                                <div class="cash-dollar">
                                    <div class="dollar">
                                            <%-- <c:choose>
                                                <c:when test="${entry.availableForFullCash eq true}">
                                                    <svg class="icon-dollar" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                                        <g fill="none" fill-rule="evenodd">
                                                            <g fill="#FFF">
                                                                <path d="M11 16.875a.875.875 0 1 0 1.75 0 .875.875 0 0 0-1.75 0z"/>
                                                                <path fill-rule="nonzero" d="M11.103 8.882v5.696h1.5V8.882z"/>
                                                            </g>
                                                            <g fill="#FFF">
                                                                <path d="M11.5 16.375a.875.875 0 1 0 1.75 0 .875.875 0 0 0-1.75 0z"/>
                                                                <path fill-rule="nonzero" d="M11.603 8.382v5.696h1.5V8.382z"/>
                                                            </g>
                                                            <path fill="#272F38" stroke="#262F38" stroke-linejoin="round" stroke-width="1.5" d="M21.5 12c0 5.246-4.253 9.5-9.5 9.5S2.5 17.246 2.5 12A9.5 9.5 0 0 1 12 2.5a9.5 9.5 0 0 1 9.5 9.5z"/>
                                                            <path fill="#FFF" fill-rule="nonzero" d="M15.5 14.086c0 .705-.263 1.286-.789 1.745-.526.458-1.26.747-2.204.866V18.5h-.998v-1.733a10.15 10.15 0 0 1-1.679-.136c-.541-.09-.985-.216-1.33-.377v-1.212c.428.192.922.349 1.481.47a7.24 7.24 0 0 0 1.528.183v-3.42c-1.057-.336-1.799-.727-2.224-1.172-.425-.446-.638-1.021-.638-1.726 0-.678.262-1.235.785-1.67.523-.435 1.216-.7 2.077-.793V5.5h.998v1.399a7.82 7.82 0 0 1 2.745.575l-.402 1.018a7.825 7.825 0 0 0-2.343-.544v3.372c.81.26 1.415.512 1.817.758.403.246.699.528.89.847.19.318.286.706.286 1.161zm-1.315.101c0-.373-.115-.674-.344-.905-.23-.23-.674-.46-1.334-.688v3.023c1.119-.155 1.678-.632 1.678-1.43zm-4.23-4.825c0 .394.115.71.347.948.232.238.634.464 1.207.676V7.979c-.51.083-.897.245-1.16.485-.263.241-.395.54-.395.898z"/>
                                                        </g>
                                                    </svg>
                                                    <span><spring:theme code="text.cart.page.product.message.can.pay.by.cash"/></span>
                                                </c:when>
                                            </c:choose> --%>
                                    </div>
                                    <c:choose>
                                        <c:when test="${not empty entry.regularPrice}">
                                            <div class="cash J-show-discount"
                                                 data-url="cart/entry/${entry.entryNumber}/cartPagePromPopUp">
                            <span>
                                <spring:theme code="text.cart.page.all.offer.applied"/></span>
                                                <svg class="arrow-right" xmlns="http://www.w3.org/2000/svg" width="24"
                                                     height="24" viewBox="0 0 24 24">
                                                    <g fill="none" fill-rule="nonzero">
                                                        <path fill="#272F38"
                                                              d="M13.51 11.924L9 16.434l1.414 1.415 5.925-5.925L10.414 6 9 7.414z"/>
                                                        <path fill="#FACF00"
                                                              d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                                    </g>
                                                </svg>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${entry.cannotRedeemed || entry.cannotDelivery || !entry.isPurchasable || lowStockFlag || entry.isOutOfStock || entry.isOverMinimumMiles || entry.productShouldBeHidden || entry.isMaxRedemptionTimes || reeStatusAlertMesgFlag eq true}">
                            <div class="bottom-message">
                                <c:if test="${entry.cannotRedeemed}">
                                    <p class="error-message">
                                        <svg class="icon-small-warning" xmlns="http://www.w3.org/2000/svg" width="24"
                                             height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="evenodd">
                                                <path fill="#D0021B"
                                                      d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                                <path fill="#FFF"
                                                      d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                            </g>
                                        </svg>
                                        <span class="error-text"><spring:theme
                                                code="text.cart.page.product.error.redemption.period.over"/></span>
                                    </p>
                                </c:if>
                                <c:if test="${entry.isOutOfStock}">
                                    <p class="error-message">
                                        <svg class="icon-small-warning" xmlns="http://www.w3.org/2000/svg" width="24"
                                             height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="evenodd">
                                                <path fill="#D0021B"
                                                      d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                                <path fill="#FFF"
                                                      d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                            </g>
                                        </svg>
                                        <c:choose>

                                            <c:when test="${empty entry.product.baseOptions}">
                                                <span class="error-text"><spring:theme
                                                        code="text.cart.page.product.error.out.of.stock"/></span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="error-text"><spring:theme
                                                        code="text.cart.page.product.error.variant.out.of.stock"/></span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </c:if>
                                <c:if test="${entry.isOverMinimumMiles}">
                                    <p class="error-message">
                                        <svg class="icon-small-warning" xmlns="http://www.w3.org/2000/svg" width="24"
                                             height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="evenodd">
                                                <path fill="#D0021B"
                                                      d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                                <path fill="#FFF"
                                                      d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                            </g>
                                        </svg>
                                        <span class="error-text"><spring:theme
                                                code="text.cart.page.mpc.slider.error.unredeemable"/></span>
                                    </p>
                                </c:if>
                                <c:if test="${entry.cannotDelivery}">
                                    <p class="error-message">
                                        <svg class="icon-small-warning" xmlns="http://www.w3.org/2000/svg" width="24"
                                             height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="evenodd">
                                                <path fill="#D0021B"
                                                      d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                                <path fill="#FFF"
                                                      d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                            </g>
                                        </svg>
                                        <span class="error-text"><spring:theme
                                                code="text.cart.page.product.error.delivery.country.not.available"/></span>
                                    </p>
                                </c:if>
                                <c:if test="${entry.isMaxRedemptionTimes}">
                                    <p class="error-message">
                                        <svg class="icon-small-warning" xmlns="http://www.w3.org/2000/svg" width="24"
                                             height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="evenodd">
                                                <path fill="#D0021B"
                                                      d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                                <path fill="#FFF"
                                                      d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                            </g>
                                        </svg>
                                        <span class="error-text"><spring:theme
                                                code="text.cart.page.product.error.maximum.times"/></span>
                                    </p>
                                </c:if>
                                <c:if test="${!entry.isPurchasable && not empty entry.alertMessagesForExclusive}">
                                    <c:forEach items="${entry.alertMessagesForExclusive}" var="message">
                                        <p class="error-message">
                                            <svg class="icon-small-warning" xmlns="http://www.w3.org/2000/svg"
                                                 width="24"
                                                 height="24" viewBox="0 0 24 24">
                                                <g fill="none" fill-rule="evenodd">
                                                    <path fill="#D0021B"
                                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                                    <path fill="#FFF"
                                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                                </g>
                                            </svg>
                                            <span class="error-text">${message}</span>
                                        </p>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${entry.productShouldBeHidden && not empty entry.alertMessagesForHiddenPageActive}">
                                    <c:forEach items="${entry.alertMessagesForHiddenPageActive}" var="message">
                                        <p class="error-message">
                                            <svg class="icon-small-warning" xmlns="http://www.w3.org/2000/svg" width="24"
                                                 height="24" viewBox="0 0 24 24">
                                                <g fill="none" fill-rule="evenodd">
                                                    <path fill="#D0021B"
                                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                                    <path fill="#FFF"
                                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                                </g>
                                            </svg>
                                            <span class="error-text">${message}</span>
                                        </p>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${lowStockFlag}">
                                    <p class="alert-message">
                                        <svg class="icon-triangle-important" xmlns="http://www.w3.org/2000/svg"
                                             width="24" height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="evenodd">
                                                <circle cx="12" cy="12" r="9" fill="#FACF00"/>
                                                <path fill="#272F38"
                                                      d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                            </g>
                                        </svg>
                                        <span class="error-text"><spring:theme
                                                code="text.cart.page.product.warning.quantity.adjustment"/> </span>
                                    </p>
                                </c:if>
                                <c:if test="${reeStatusAlertMesgFlag eq true}">
                                    <p class="alert-message">
                                        <svg class="icon-triangle-important" xmlns="http://www.w3.org/2000/svg"
                                             width="24" height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="evenodd">
                                                <circle cx="12" cy="12" r="9" fill="#FACF00"/>
                                                <path fill="#272F38"
                                                      d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                            </g>
                                        </svg>
                                        <span class="error-text"><spring:theme code="text.cart.page.ree.not.in.hk.ee.product.alert.msg"/> </span>
                                    </p>
                                </c:if>
                            </div>
                        </c:if>
                    </div>
                    <!-- /cart items list -->
                </c:forEach>
            </div>
