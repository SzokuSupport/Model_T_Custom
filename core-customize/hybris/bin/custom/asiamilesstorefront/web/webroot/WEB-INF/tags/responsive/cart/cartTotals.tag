<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ attribute name="showTax" required="false" type="java.lang.Boolean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="quote" tagdir="/WEB-INF/tags/responsive/quote" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="cartData" required="true" type="de.hybris.platform.commercefacades.order.data.CartData" %>
<div class="col-lg-5 col-sm-6 cart-item--right">
    <!-- Your account balance -->
    <div class="balance-mobile font-bold">
       <span class="balance">
           <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                width="40" height="48" viewBox="0 0 40 48">
            <g fill="none" fill-rule="evenodd">
                <path fill="#FACF00"
                      d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                <path fill="#FACF00"
                      d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
            </g>
           </svg>
           <fmt:formatNumber value="${memberProfile.customerRecord.account.totalMilesAvailable}" maxFractionDigits="3"/>
       </span>
       <spring:theme code="text.cart.page.account.balance"/>
    </div>
    <c:url var="couponRemove" value="/cart/voucher/remove"/>
    <div class="promo-code-wrap">
        <p class="title font-SemiBold"><spring:theme code="text.cart.page.slider.promotion.title"/></p>
        <c:choose>
            <c:when test="${not empty cartData.appliedVouchers && empty cartData.appliedProductPromotions && !cartData.usedCouponFlag}">
                <%----------------------------------------------------------------------------------------------------------------------------------------%>
                <c:url var="couponApply" value="/cart/voucher/apply"/>
                <div class="promo-code">
                    <div class="promo-code__left"></div>
                    <div class="promo-code__right">
                        -
                        <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                            <g fill="none" fill-rule="evenodd">
                                <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                            </g>
                        </svg>
                        <span class="font-bold">0</span>
                    </div>
                </div>

                <div class="add-promo">
                    <div class="input-component J-input-transform" tabindex='0'aria-label="Add a promo code text box- editable">
                        <input class="font-regular" type="text" id="promo-code" value="${cartData.appliedVouchers.get(0)}" disabled />
                        <label class="font-regular placeholder J-input-placeholder" for="familyName">
                        	<spring:theme code="text.cart.page.slider.add.a.promo.code"/>
                        </label>
                    </div>

                    <div class="button font-SemiBold J-add-promo"
                         tabindex='0' aria-label='Apply Promo code button- Clickable.' data-url="${couponApply}"
                         data-remove-url="${couponRemove}" data-remove-code="true" flag="true">
                        <svg class="icon-plus disappear J-icon-add" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12.155 10.809h6.358v1.2h-6.358v6.329h-1.2V12.01H4.625v-1.201h6.328V4.45h1.201z"/>
                        </svg>
                        <svg class="icon-close J-icon-close" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
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
                </div>
                <div class="warningBox J-warnning-promo">
                    <div class="errorMes">
                        <svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <g fill="none" fill-rule="evenodd">
                                <circle cx="12" cy="12" r="9" fill="#FACF00"/>
                                <path fill="#272F38" d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                            </g>
                        </svg>
                        <span tabindex='0' aria-label='<spring:theme code="text.cart.page.cart.error.promo.code"/>'> 
                           <spring:theme code="text.cart.page.cart.error.promo.code"/>
                        </span>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <c:if test="${not empty cartData.appliedProductPromotions }">
                    <c:set var="sum" value="0"/>
                    <c:forEach items="${cartData.appliedProductPromotions }" var="promotion">
                        <c:if test="${empty promotion.bonusMiles}">
	                        <c:forEach items="${promotion.appliedVouchers }" var="voucher">
	                            <c:set var="code" value="${voucher }"/>
	                        </c:forEach>
	                        <c:if test="${not empty promotion.consumedEntries }">
	                            <c:forEach items="${promotion.consumedEntries }" var="consumed">
	                                <c:set var="sum" value="${sum+consumed.discountUnitPrice}"/>
	                            </c:forEach>
	                        </c:if>
	                     </c:if>
                    </c:forEach>
                    <c:if test="${sum gt 0}">
                   	 <div class="promo-code">
                        <div class="promo-code__left">
								<span class="J-add-promo-code" event_component="promo_code" event_value="${code}">${code}</span>
                        <svg class="icon-promo J-promo-popup" xmlns="http://www.w3.org/2000/svg" width="15"
                             height="15" viewBox="0 0 15 15"
                             data-url="/_ui/responsive/aml/html/layout/cartPromoPopup.html">
                            <g fill="none" fill-rule="evenodd">
                                <path fill="#D4D5D7" d="M14.643 7.295A7.322 7.322 0 0 1 0 7.295C0 3.252 3.277 0 7.321 0s7.322 3.252 7.322 7.295"/>
                                <path fill="#272F38" d="M6.447 3.993a.875.875 0 1 0 1.749 0 .875.875 0 0 0-1.75 0z"/>
                                <path fill="#272F38" fill-rule="nonzero" d="M6.55 6v5.696h1.5V6z"/>
                            </g>
                        </svg>
                        <span class="remove J-remove-code font-SemiBold col-lg-4 col-sm-4" data-code="${code}"data-url=${couponRemove}>
                        	<spring:theme code="text.cart.page.slider.remove.promo.code"/> </span>
                        </div>
                        <div class="promo-code__right">
                            -
                            <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                    <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                    <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                </g>
                            </svg>
                            <span class="font-bold">
										  <fmt:formatNumber value="${sum}" pattern="#" type="number"/>
									</span>
                        </div>
                    </div>
                    <div class="popup disappear J-promotion-popup">
                        <div class="discount">
                            <p class="discount-title font-light"><spring:theme code="text.cart.page.slider.promo.details"/></p>
                            <div class="main">
                                <c:forEach items="${cartData.appliedProductPromotions }" var="promotion">
                                		<c:if test="${empty promotion.bonusMiles}">
                                    <div class="section">
                                        <svg class="icon-tooltip" xmlns="http://www.w3.org/2000/svg" width="24"
                                             height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="evenodd">
                                                <path fill="#272F38"  d="M2.614 5.262a.383.383 0 0 0-.379.387v12.217c0 .213.17.386.38.386h18.77c.21 0 .38-.173.38-.386V5.649a.384.384 0 0 0-.38-.387H2.616zm18.772 14.252H2.614c-.89 0-1.614-.74-1.614-1.648V5.649C1 4.74 1.724 4 2.614 4h18.772C22.276 4 23 4.74 23 5.65v12.216c0 .909-.724 1.648-1.614 1.648z"/>
                                                <path fill="#272F38" fill-rule="nonzero" d="M8.5 12.5a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0-1a1 1 0 1 1 0-2 1 1 0 0 1 0 2zM14.5 15.5a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0-1a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                                                <path fill="#333D47" d="M14.27 8h1.43l-6.57 7.5H7.7z"/>
                                            </g>
                                        </svg>
                                        <p class="name font-bold">${promotion.promotionData.name}</p>
                                        <p class="detail">${promotion.promotionData.description}</p>
                                        <c:set var="datepattern"><spring:theme code="basket.page.time.pattern"/></c:set>
                                     	 <c:set var="startTime">
                                     	 	<fmt:formatDate value="${promotion.promotionData.startDate}" pattern="${datepattern}"/> 
                                     	 </c:set>	
                                        <c:set var="endTime">
                                        	<fmt:formatDate value="${promotion.promotionData.endDate}" pattern="${datepattern}"/>
                                        </c:set>
                                        <p class="time font-bold">
                                        	<spring:theme code="text.cart.page.slider.promotion.popup.promotion_period"/>
                                                ${startTime} - ${endTime}
                                        </p>
                                        <c:if test="${not empty promotion.promotionData.termsAndConditions}">
                                            <a class="terms-conditions" href=<c:url value="${promotion.promotionData.termsAndConditions}"/>>
                                               <spring:theme code="text.cart.page.slider.promotion.popup.terms.and.condition"/>
                                            </a>
                                        </c:if>
                                    </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <svg class="icon-close J-close-tooltip" width="24px" height="24px" viewBox="0 0 24 24"
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
                    </div>
                    </c:if>
                </c:if>
                <c:if test="${empty cartData.appliedProductPromotions && empty cartData.appliedOrderPromotions}">
                    <div class="promo-code">
                        <div class="promo-code__left"></div>
                        <div class="promo-code__right">
                            -
                            <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                    <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                    <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                                </g>
                            </svg>
                            <span class="font-bold">0</span>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty cartData.appliedVouchers}">
                    <c:url var="couponApply" value="/cart/voucher/apply"/>
                    <div class="add-promo">
                        <div class="input-component J-input-transform" tabindex='0'
                             aria-label="Add a promo code text box- editable">
                            <input class="font-regular" type="text" id="promo-code"
                                   <c:if test="${not empty applyError }">disabled</c:if> value="${voucherCode}">
                            <label class="font-regular placeholder J-input-placeholder" for="familyName">
                                <spring:theme code="text.cart.page.slider.add.a.promo.code"/>
                            </label>
                        </div>
                        <div class="button font-SemiBold J-add-promo"
                             tabindex='0' aria-label='Apply Promo code button- Clickable.' data-url="${couponApply}"
                             flag="true">
                            <svg class="icon-plus <c:if test="${not empty applyError }">disappear</c:if> J-icon-add"
                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M12.155 10.809h6.358v1.2h-6.358v6.329h-1.2V12.01H4.625v-1.201h6.328V4.45h1.201z"/>
                            </svg>
                            <svg class="icon-close <c:if test="${empty applyError }">disappear</c:if> J-icon-close"
                                 width="24px" height="24px" viewBox="0 0 24 24" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
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
                    </div>
                    <c:if test="${not empty applyError }">
                        <div class="warningBox J-warnning-promo">
                            <div class="errorMes">
                                <svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                     viewBox="0 0 24 24">
                                    <g fill="none" fill-rule="evenodd">
                                        <circle cx="12" cy="12" r="9" fill="#FACF00"/>
                                        <path fill="#272F38" d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                    </g>
                                </svg>
                                <span tabindex='0' aria-label="<spring:theme code='${applyError }'/>">
                                		<spring:theme code="${applyError }"/>
                                </span>
                            </div>
                        </div>
                    </c:if>
                </c:if>
            </c:otherwise>
       </c:choose>
    </div>
    <!-- /Your account balance -->
    <c:if test="${!cartData.allMilesOnly && !cartData.allNoSelected }">
        <!-- miles and cash slider -->
        <div class="mpc-slider">
            <c:if test="${cartData.insufficientBalance  && !cartData.allMilesOnly}">
                <div class="mpc-slider-mask"></div>
            </c:if>
            <div class="title font-light">
                <span class="font-SemiBold J-bubbling-before"><spring:theme code="text.cart.page.slider.title"/></span>
                <svg class="icon-info-small J-bubbling-icon" tabindex="0"
                     aria-label='<spring:theme code="text.cart.page.mpc.slider.hover.message"/>'
                     xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">
                    <g fill="none" fill-rule="evenodd">
                        <path fill="#D4D5D7"
                              d="M14.643 7.295A7.322 7.322 0 0 1 0 7.295C0 3.252 3.277 0 7.321 0s7.322 3.252 7.322 7.295"/>
                        <path fill="#272F38" d="M6.447 3.993a.875.875 0 1 0 1.749 0 .875.875 0 0 0-1.75 0z"/>
                        <path fill="#272F38" fill-rule="nonzero" d="M6.55 6v5.696h1.5V6z"/>
                    </g>
                </svg>
                <div class="bubbling">
                    <p class="bubbling-text"><spring:theme code="text.cart.page.mpc.slider.hover.message"/></p>
                </div>
            </div>
            <div class="mile-cash-slider">
                <c:url value="/cart/miles" var="selectionMiles"/>
                <div class="nstSlider J-mile-cash-slider"
                     data-range_min="-<fmt:formatNumber value="${cartData.maxMiles}" pattern="#" type="number"/>"
                     data-range_max="-<fmt:formatNumber value="${cartData.minMiles}" pattern="#" type="number"/>"
                     data-cur_min="-<fmt:formatNumber value="${cartData.selectionMiles}" pattern="#" type="number"/>"
                     data-url="${selectionMiles}" event_component="miles_selection" event_value="miles toggle">
                    <div class="bar" style="left: 285px; width: 14px;"></div>
                    <div class="leftGrip" style="left: 271px;"></div>
                </div>
                <div class="mile-cash-slider-label">
                    <p><spring:theme code="text.cart.page.mpc.slider.miles"/></p>
                    <p><spring:theme code="text.cart.page.mpc.slider.cash"/></p>
                </div>
            </div>

            <div class="row slider-input">
                <div class="col-lg-6 col-sm-5 col-xs-6">
                    <div class="field-group">
                        <label class="field-label" for="miles"></label>
                        <input type="hidden" value="maxmiles">
                        <input type="hidden" value="minmiles">
                        <input class="field-input font-bold J-input-miles" type="number" event_component="miles_entry" event_value="miles entry" id="miles" name="miles"
                               placeholder="<fmt:formatNumber value="${cartData.selectionMiles}" pattern="#" type="number"/>" data-url="${selectionMiles}">
                        <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48" viewBox="0 0 40 48">
                            <g fill="none" fill-rule="evenodd">
                                <path fill="#FACF00"
                                      d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                                <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                                <path fill="#FACF00"
                                      d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                            </g>
                        </svg>
                    </div>
                    <p class="miles-reminder font-SemiBold J-miles-reminder">
                       <spring:theme code="text.cart.page.mpc.slider.error.minimum.miles.spend1"/>
                       <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" width="40" height="48"
                            viewBox="0 0 40 48">
                           <g fill="none" fill-rule="evenodd">
                               <path fill="#FACF00" d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                               <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                               <path fill="#FACF00" d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                           </g>
                       </svg>
                       <span class="J-miles-min"><fmt:formatNumber value="${cartData.minMiles}" pattern="#" type="number"/></span>
                       <spring:theme code="text.cart.page.mpc.slider.error.minimum.miles.spend2"/>
                    </p>
                </div>
                <div class="col-lg-1 col-sm-1 col-xs-1 slider-plus">
                    <svg class="icon-plus" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path d="M12.155 10.809h6.358v1.2h-6.358v6.329h-1.2V12.01H4.625v-1.201h6.328V4.45h1.201z"/>
                    </svg>
                </div>
                <div class="col-lg-5 col-sm-6 col-xs-5 slider-cash font-SemiBold">
                    <span class="J-mile-cash-slider-currency currency">${countryData.currencyIsoCode}</span>
                    <span><fmt:formatNumber value="${cartData.totalPriceCash.value}" minFractionDigits="2" maxFractionDigits="2"/></span>
                </div>
            </div>
		   	
        </div>
    </c:if>
    <div class="row total-price">
        <div class="col-lg-6 col-sm-6 col-xs-6 total-text">
            <span class="font-SemiBold"><spring:theme code="text.cart.page.slider.order.total"/></span>
        </div>
        <div class="col-lg-6 col-sm-6 col-xs-6 price-wrap">
            <p class="price-discounted font-bold">
                <svg class="icon-yellow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                     width="40" height="48" viewBox="0 0 40 48">
                    <g fill="none" fill-rule="evenodd">
                        <path fill="#FACF00"
                              d="M0 27.592c.114-1.735 3.193-2.755 5.816-3.265C9.35 23.51 14.14 23 19.158 23h.342c9.465 0 19.5 1.735 19.5 4.592l-.114.408-3.535-.918v-.306c0-1.327-6.386-2.756-15.737-2.756-9.35 0-15.737 1.429-15.737 2.756v.306l-3.763.816L0 27.592z"/>
                        <path fill="#333D47" d="M19.443 1L0 47h3.088l16.355-36.222L36.026 47H39z"/>
                        <path fill="#FACF00"
                              d="M19.457 33C10.146 33 2.33 31.526.49 29.316c-.345-.421-.575-.842-.46-1.263l.115-.106L3.708 27v.421c0 1.368 6.438 2.842 15.864 2.842 9.427 0 15.864-1.474 15.864-2.842V27l3.564.842v.316c0 1.79-3.219 2.842-5.863 3.368C29.46 32.684 24.63 33 19.457 33z"/>
                    </g>
                </svg>
                <fmt:formatNumber value="${cartData.totalPrice.value}" maxFractionDigits="0"/>
            </p>
            <c:if test="${!cartData.allMilesOnly }">
                <p class="price-cash font-bold">+ ${countryData.currencyIsoCode}&nbsp;<fmt:formatNumber
                        value="${cartData.totalPriceCash.value}" minFractionDigits="2" maxFractionDigits="2"/></p>
            </c:if>
        </div>
        <!-- /miles and cash slider -->
        <c:if test="${cartData.insufficientBalance}">
            <p class="error-message">
                <svg class="icon-small-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                     viewBox="0 0 24 24">
                    <g fill="none" fill-rule="evenodd">
                        <path fill="#D0021B"
                              d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                        <path fill="#FFF"
                              d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                    </g>
                </svg>
                <spring:theme code="text.cart.page.mpc.slider.error.lack.of.balance"/>
            </p>
        </c:if>
    </div>
	  <c:if test="${(earnmilesMessageCart and cartData.totalPriceCash.value <= 0 ) or not empty cartData.appliedBonusPromotions or cartData.totalEarnedMiles>0 }">
     <div class="earn-miles">
    	 <div class="earn-miles-content">
     		<c:choose>
     			<c:when test="${empty cartData.appliedBonusPromotions and cartData.totalPriceCash.value <= 0}">
		         <div class="earn-miles-content__row J-no-offers J-earn-miles-offer--hide">
		             <span class="font-SemiBold"><spring:theme code="basket.page.miles.cashspend"/></span>
		         </div>
     			</c:when>
     			<c:otherwise>
		         <div class="earn-miles-content__wrapper J-earn-miles-offer">
		             <div class="earn-miles-content__row earn-miles__title">
		                 <div class="earn-miles-content__row-content-left">
		                     <span class="font-SemiBold"><spring:theme code="basket.page.miles.tobeearned"/></span>
		                 </div>
		                 <div class="earn-miles-content__row-content-right">
                           <span class="earn-miles-title-total-wrapper J-earn-miles-title-total-wrapper">
                               <svg class="am-icon">
                                   <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num" />
                               </svg>
                               <span class="font-bold J-total-miles-to-earn"><fmt:formatNumber value="${cartData.totalBonusMiles }" maxFractionDigits="0"/></span>
                           </span>
                           <svg class="icon-dropdown J-expand-earn-miles-details">
                               <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown"></use>
                           </svg>
                       </div>
		             </div>
		             <div class="earn-miles-content-details-wrapper J-earn-miles-content-details-wrapper earn-miles-content-details-wrapper--hide">
		             	 <c:if test="${cartData.totalEarnedMiles>0 }">
		             	  	<div class="earn-miles-content__row">
		             	  		<div class="earn-miles-content__row-content-left">
                               <span class="font-SemiBold"><spring:theme code="text.product.page.base.earn.miles.cash.spending.text"/></span>
                               <svg class="icon-promo J-promo-popup-multiple" data-popup-content-id="promo-rule-x" data-popup-close-btn-id="close-btn-rule-x">
										    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-info-small"></use>
										</svg>
										<div id="promo-rule-x" class="popup disappear J-promotion-popup-multiple">
										  <div class="promotion">
										      <div class="title">
										          <h2><spring:theme code="text.product.page.base.earn.miles.cash.spending.text"/></h2>
										      </div>
										      <div class="main">
										      <c:forEach items="${cartData.baseMilesRate}" var="base"> 
										          <div class="section">
										              <div class="earn-miles-offer-title-row">
							                         <div class="earn-miles-offer-title-row-left-item">
							                         	 <img src="/_ui/responsive/aml/img/earn-yellow.svg" />
<%-- 							                         	<c:choose> --%>
<%-- 				                                			<c:when test="${not empty base.segment}"> --%>
<%-- 				                                				<c:if test="${base.segment.code eq 'CO_BRAND'}"> --%>
<!-- 				                                					<img src="/_ui/responsive/aml/img/bonus-cobrand-card.svg" /> -->
<%-- 				                                				</c:if> --%>
<%-- 				                                				<c:if test="${base.segment.code eq 'MPO'}"> --%>
<!-- 				                                					<img src="/_ui/responsive/aml/img/bonus-mpo-member.svg" /> -->
<%-- 				                                				</c:if> --%>
<%-- 				                                			</c:when> --%>
<%-- 				                                			<c:otherwise> --%>
<!-- 						                                    <img src="/_ui/responsive/aml/img/earn-yellow.svg" /> -->
<%-- 				                                			</c:otherwise> --%>
<%-- 				                                		</c:choose> --%>
							                         </div>
							                         <div class="earn-miles-offer-title-row-middle-item font-bold">
							                             ${base.title}
							                         </div>
							                         <c:if test="${not empty base.textBeforeIcon or not empty base.textAfterIcon}">
							                         <div>
							                            <div class="icon-tooltip-right">
							                                <span class="earn-miles-icon">
							                                		 <img src="/_ui/responsive/aml/img/earn-yellow.svg" />
							                                </span>
							                                <span class="earn-miles-tag-content-block">
							                                		<c:if test="${not empty base.textBeforeIcon }">
							                                   		<span>${base.textBeforeIcon}</span>
								                                    <svg class="am-icon">
								                                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num" />
								                                    </svg>
							                                    </c:if>
							                                    <c:if test="${not empty base.textAfterIcon }">
							                                   		<span>${base.textAfterIcon}</span>
							                                    </c:if>
							                                </span>
							                            </div>
							                         </div>
							                         </c:if>
							                       </div>
										              <p class="detail">${base.description}</p>
										              <c:set var="datepattern"><spring:theme code="basket.page.time.pattern"/></c:set>
										              <c:set var="stime"><fmt:formatDate value="${base.startDate}" pattern="${datepattern}"/></c:set>	
										              <c:set var="etime"><fmt:formatDate value="${base.endDate}" pattern="${datepattern}"/></c:set>
										              <c:if test="${not empty stime or not empty etime}">
										              		<p class="time font-bold"><spring:theme code="text.cart.page.slider.promotion.popup.promotion_period"/> ${stime} - ${etime}</p>
										              </c:if>
										              <c:if test="${not empty base.termsAndCondition}">
										                 <a class="terms-conditions" href=<c:url value="${base.termsAndCondition}"/>>
										                    	<spring:theme code="text.cart.page.slider.promotion.popup.terms.and.condition"/>
										                 </a>
										              </c:if>
										          </div>
										      </c:forEach>
										      </div>
										  </div>
										  <svg id="close-btn-rule-x" class="icon-close J-close-tooltip">
										      <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-close"/>
										  </svg>
										</div>
                           </div>
			             	 	<div class="earn-miles-content__row-content-right">
			                     <svg class="am-icon">
			                         <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num" />
			                     </svg>
			                     <span class="font-bold J-cashspending-miles-to-earn"><fmt:formatNumber value="${cartData.totalEarnedMiles }" maxFractionDigits="0"/></span>
			                	</div>
			               </div>
		             	 </c:if>
		             	 <c:forEach items="${cartData.appliedBonusPromotions }" var="promotion" varStatus="status">
		             		<c:set var="code" value=""/>
                        <c:forEach items="${promotion.appliedVouchers }" var="voucher">
                            <c:set var="code" value="${voucher }"/>
                        </c:forEach>
				            <div class="earn-miles-content__row">
				                 <div class="earn-miles-content__row-content-left">
				                     <span class="font-SemiBold">${promotion.promotionData.name }</span>
				                     <svg class="icon-promo J-promo-popup-multiple" data-popup-content-id="promo-rule-${status.index}" data-popup-close-btn-id="close-btn-rule-${status.index}">
				                         <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-info-small"></use>
				                     </svg>
				                     <div id="promo-rule-${status.index}" class="popup disappear J-promotion-popup-multiple">
				                         <div class="promotion">
				                             <div class="title">
				                                 <h2><spring:theme code="text.cart.page.slider.offer.details"/></h2>
				                             </div>
				                             <div class="main">
				                                 <div class="section">
				                                     <div class="earn-miles-offer-title-row">
                                                    <div class="earn-miles-offer-title-row-left-item">
                                                    	<img src="/_ui/responsive/aml/img/earn-yellow.svg" />
                                                    </div>
                                                    <div class="earn-miles-offer-title-row-middle-item font-bold">
                                                        ${promotion.promotionData.name}
                                                    </div>
                                                    <div>
                                                    	 <c:if test="${not empty promotion.promotionData.textBeforeIcon or not empty promotion.promotionData.textAfterIcon }">
	                                                       <div class="icon-tooltip-right">
	                                                           <span class="earn-miles-icon">
	                                                               <img src="/_ui/responsive/aml/img/earn-yellow.svg" />
	                                                           </span>
	                                                           <span class="earn-miles-tag-content-block">
	                                                           	 <c:if test="${not empty promotion.promotionData.textBeforeIcon }">
	                                                               <span>${promotion.promotionData.textBeforeIcon}</span>
	                                                           	 </c:if>
	                                                           	 <c:if test="${not empty promotion.promotionData.textAfterIcon }">
	                                                               <svg class="am-icon">
	                                                                   <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num" />
	                                                               </svg>
	                                                               <span>${promotion.promotionData.textAfterIcon}</span>
	                                                              </c:if>
	                                                           </span>
	                                                       </div>
                                                       </c:if>
                                                    </div>
                                                 </div>
				                                     <p class="detail">${promotion.promotionData.description }</p>
				                                     <c:set var="datepattern"><spring:theme code="basket.page.time.pattern"/></c:set>
			                                     	 <c:set var="stime">
			                                     	 	<fmt:formatDate value="${promotion.promotionData.startDate}" pattern="${datepattern}"/> 
			                                     	 </c:set>	
			                                        <c:set var="etime">
			                                        	<fmt:formatDate value="${promotion.promotionData.endDate}" pattern="${datepattern}"/>
			                                        </c:set>
				                                     <c:if test="${not empty stime or not empty etime}">
				                                     <p class="time font-bold"><spring:theme code="text.cart.page.slider.promotion.popup.promotion_period"/> ${stime} - ${etime}</p>
				                                     </c:if>
				                                     <c:if test="${not empty promotion.promotionData.termsAndConditions}">
				                                        <a class="terms-conditions" href=<c:url value="${promotion.promotionData.termsAndConditions}"/>>
				                                           	<spring:theme code="text.cart.page.slider.promotion.popup.terms.and.condition"/>
				                                        </a>
				                                     </c:if>
				                                 </div>
				                             </div>
				                         </div>
				                         <svg id="close-btn-rule-${status.index}" class="icon-close J-close-tooltip">
				                             <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-close" />
				                         </svg>
				                     </div>
				                     <c:if test="${not empty code}">
				                    		 <span class="remove J-remove-code font-SemiBold col-lg-4 col-sm-4" data-code="${code}" data-url="${couponRemove}">
				                    		 	<spring:theme code="text.cart.page.slider.remove.promo.code"/>
				                    		 </span>
				                     </c:if>
				                 </div>
				                 <div class="earn-miles-content__row-content-right">
				                     <svg class="am-icon">
				                         <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num" />
				                     </svg>
				                     <span class="font-bold"><fmt:formatNumber value="${promotion.bonusMiles}" maxFractionDigits="0"/></span>
				                 </div>
				             </div>
                    </c:forEach>
                    </div>
		         </div>
     			</c:otherwise>
     		</c:choose>
    	 </div>
	 </div>
	 </c:if>
    <div class="checkbox-group J-agreeCheckbox" tabindex="0" aria-label='checkbox'>
        <input type="checkbox" id="cartAgree" class="J-cart-agree">
        <label class="agree-form J-agreeForm" aria-hidden='true' for="cartAgree" >${cartData.termsAndconditionsText}</label>
    </div>
    <c:url value="/checkout" var="checkoutUrl" scope="session"/>
    <button type="submit" class="button-yellow font-SemiBold J-go-to-checkOut" data-url="${fn:escapeXml(checkoutUrl)}">
        <spring:theme code="text.cart.page.slider.go.to.check.out"/>
    </button>

</div>
