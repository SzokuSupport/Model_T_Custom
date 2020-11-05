<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ attribute name="order" required="true" type="de.hybris.platform.commercefacades.order.data.OrderData" %>
<%@ attribute name="orderDetail" required="true" type="com.asiamiles.facades.Data.OrderDetailData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="orderDetail" tagdir="/WEB-INF/tags/responsive/order/orderDetail" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
<link href="/_ui/responsive/aml/css/orderDetailsInfo.css" rel="stylesheet">

<c:set var="totalEarnedMiles" value="${orderData.totalEarnedMiles}"/>
<c:forEach items="${orderData.appliedBonusPromotions}" var="promotionResult">
    <c:set var="totalEarnedMiles" value="${totalEarnedMiles + promotionResult.bonusMiles}"/>
</c:forEach>
<c:set var="deliveryAddress" value="${orderData.deliveryAddress}" />
    <div class="container order-detail-info">
        <h2 class="order-detail-headline">
            <span class="text font-light"><spring:theme code="text.order.detail.page.two.title" /></span>
        </h2>
        <div class="order-detail-content">
            <orderDetail:orderDetailInfo orderData="${orderData }" totalEarnedMiles= "${totalEarnedMiles }"/>
            <!-- Home delivery Section Start -->
            <c:if test="${not empty orderDetailData.homeDelivery }">
            <c:set var="orderDetail" value="${orderDetailData.homeDelivery}"/>
            <div class="deliver-info">
                <div class="deliver-info-name font-bold">
                    <span class="info-name"><spring:theme code = "text.order.detail.page.two.order.home.delivery"/></span>
                    <span class="items-num font-regular">(${orderDetailData.homeQty}&nbsp;<c:if test="${orderDetailData.homeQty gt 1}"><spring:theme code = "text.order.detail.page.one.order.items"/></c:if>
                    <c:if test="${orderDetailData.homeQty eq 1}"><spring:theme code = "text.order.detail.page.one.order.items"/></c:if>)</span>
                </div>
                <div class="delivery-container">
                    <orderDetail:orderDetailDeliveryAddress deliveryAddress="${deliveryAddress}" />
                </div>
            </div>
            <div class="order-list">
            	<c:forEach items="${orderDetail}" var="orderEntry">
            	<c:set var="orderProduct" value="${orderEntry.product }" />
                <div class="order-detail-cart">

                    <orderDetail:orderDetailEntry orderEntry="${orderEntry }"/>

                    <div class="order-item-list">
                        <div class="order-list-headline">
                            <span class="font-bold order-list-title reference-title"><spring:theme code="text.order.detail.page.two.reference.number"/> </span>
                            <span class="font-bold order-list-title reference-title-mobile"><spring:theme code="text.order.detail.page.two.reference.number"/></span>
                            <span class="font-bold order-list-title status-title"><spring:theme code = "text.order.detail.page.two.order.status"/></span>
                        </div>

                       <c:if test="${not empty orderEntry.consignments}">
                        <c:forEach items="${orderEntry.consignments}" var="consignment">
                        <div class="order-item-detail J-orderItemDetail">
                            <span class="order-item__tab J-selectTab" aria-hidden="true" tabindex="0" data-url="/_ui/responsive/aml/html/layout/orderItemShippedMobile.html">
                                <span class="font-regular reference-num">${consignment.code }</span>
                                <span class="font-regular delivery-status">
                                <spring:theme code="text.order.status.V2.${consignment.consignmentStatus.code}" />
                                <c:if test="${not empty consignment.alertMsg }">
                                		<svg class="icon-triangle-important" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="evenodd">
                                                <circle cx="12" cy="12" r="9" fill="#FACF00"/>
                                                <path fill="#272F38" d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                            </g>
                                		</svg>
                                </c:if>
                                </span>
                                <svg class="icon-arrow-down J-expandStatus" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" aria-label="Expandable button to see the order tracking - Clickable"  tabindex="0">
                                    <g fill="none" fill-rule="nonzero">
                                        <path fill="#272F38" d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                        <path fill="#FACF00" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                    </g>
                                </svg>
                            </span>
                            <div class="delivery-information J-information clearfix">
									    <h2 class="delivery-detail-headline">
									    		<c:if test="${not empty consignment.alertMsg }">
									    			<span class="font-light"><spring:theme code ="text.order.status.special.delivery.order.processing.description"/></span>
									    		</c:if>
									    		<c:if test="${empty consignment.alertMsg }">
									    			<c:set var="conStatus" value="${consignment.consignmentStatus.code}"/>
									    			<c:choose>
									    				<c:when test="${conStatus eq 'CREATED' || conStatus eq 'CREATED_ON_HOLD'}">
									        				<span class="font-light"><spring:theme code = "text.order.status.general.order.not.processing"/></span>
									        			</c:when>
									        			<c:when test="${conStatus eq 'DELIVERING' || conStatus eq 'SHIPPED'}">
									        				<span class="font-light"><spring:theme code = "text.order.status.home.delivery.order.on.the.way"/></span>
									        			</c:when>
									        			<c:when test="${conStatus eq 'AUTO_CANCELLED' || conStatus eq 'CANCELLED' || conStatus eq 'WAIT_REVERSE_OFFLINE'}">
									        				<span class="font-light"><spring:theme code ="text.order.status.special.delivery.order.refunded.description"/></span>
									        			</c:when>
									        		</c:choose>
									    		</c:if>
									    </h2>
									    <orderDetail:orderDetailStatusBar consignment="${consignment}" />
									    <div class="reference-num-section">
        									<p class="font-SemiBold reference-num-title"><spring:theme code="text.order.detail.page.two.reference.number"/> </p>
       									<p class="font-regular reference-num">${consignment.code}</p>
   									 </div>
   									 <c:if test="${not empty consignment.trackingID}">
   									 <div class="track-info__mobile">
								            <span class="track-title">
								                <svg class="icon-order-status" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                                                    <defs>
                                                        <path d="M0 .093h16.446v14.633H0z"/>
                                                    </defs>
                                                    <g fill="none" fill-rule="evenodd">
                                                        <g transform="translate(.2 4)">
                                                            <mask fill="#fff">
                                                                <path d="M0 .093h16.446v14.633H0z"/>
                                                            </mask>
                                                            <path fill="#272F38" stroke="#272F38" stroke-width=".2" d="M1.14 13.6L1.133 1.22l12.475-.001v12.382H7.372v1.125h9.074v-1.125h-1.702V1.22c0-.618-.509-1.127-1.135-1.127H1.135C.512.093 0 .598 0 1.22V13.6c0 .618.512 1.126 1.14 1.126h1.696v-1.125H1.139z" mask="url(#b)"/>
                                                        </g>
                                                        <path fill="#272F38" stroke="#272F38" stroke-width=".2" d="M23.78 12.868h.02v4.984c0 .648-.483 1.166-1.099 1.166h-1.635v-1.17s1.64.006 1.64.003v-3.839h-4.174c-.651 0-1.168-.504-1.168-1.133V9.425c0-.632.522-1.134 1.164-1.134h1.682l-.427-.76a.53.53 0 0 0-.355-.215h-4.925v-1.17h4.925c.492 0 1.04.33 1.293.783l2.721 4.853c.163.29.29.71.338 1.086zm-1.11 0a1.88 1.88 0 0 0-.165-.484l-1.654-2.95c-.858-.002-2.316-.006-2.316-.01 0 0-.009 3.444-.003 3.444h4.138zM5.407 20.068c.92 0 1.665-.736 1.665-1.644 0-.908-.746-1.644-1.665-1.644s-1.664.736-1.664 1.644c0 .908.745 1.644 1.664 1.644m0 1.096c1.532 0 2.774-1.227 2.774-2.74 0-1.513-1.242-2.74-2.774-2.74-1.531 0-2.774 1.227-2.774 2.74 0 1.513 1.243 2.74 2.774 2.74"/>
                                                        <path fill="#272F38" stroke="#272F38" stroke-width=".2" d="M18.758 20.068a1.644 1.644 0 1 0 0-3.287 1.644 1.644 0 0 0 0 3.287m0 1.096a2.74 2.74 0 1 0-.001-5.48 2.74 2.74 0 0 0 0 5.48"/>
                                                    </g>
								                </svg>
								                <span class="font-regular track-title-text"><spring:theme code ="text.order.detail.page.two.order.tracking.number"/>:
								                </span>
								                <span class="font-SemiBold track-number-text J-courierNum">${consignment.trackingID }</span>
								                <span class="font-regular copy-track-number J-copyNumBtn"><spring:theme code = "text.order.detail.page.two.order.copy"/></span>
								            </span>
								            <span class="visit-courier">
								                <a href="${consignment.trackingUrl}" event_component="courier status" event_value="status click">
								                    <span class="font-regular visit-courier-title"><spring:theme code ="text.order.detail.page.two.order.go.to.delivery.service.website"/></span>
								                </a>
								                <svg class="icon-linkout" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                                                    <defs>
                                                        <path d="M0 0h15.6v16.1H0z"/>
                                                    </defs>
                                                    <g fill="none" fill-rule="evenodd" transform="translate(4 4)">
                                                        <mask fill="#fff">
                                                            <path d="M0 0h15.6v16.1H0z"/>
                                                        </mask>
                                                        <path fill="#272F38" d="M1.6 14.5H12V9.8h1.6v5.5a.8.8 0 0 1-.8.8H.8a.8.8 0 0 1-.8-.8V3.8A.8.8 0 0 1 .8 3h6v1.6H1.6v9.9zM12.733 1.75l-4.876.348L7.743.502l7-.5a.8.8 0 0 1 .855.853l-.5 7.2-1.596-.11.35-5.052-7.486 7.487-1.132-1.132 7.499-7.498z" mask="url(#b)"/>
                                                    </g>
								                </svg>
								            </span>
								        </div>
								        </c:if>
									    <orderDetail:orderDetailWarningMsg consignment="${consignment}" />

									    <div class="order-delivery-info">
									        <orderDetail:orderDetailPartnerInfo orderProduct="${orderProduct }"/>
									        <orderDetail:orderDetailTrackingInfo consignment="${consignment }"/>
									    </div>
									</div>
                        </div>
                        </c:forEach>
                        </c:if>

                    </div>
                </div>
                </c:forEach>
            </div>
            </c:if>
            <!-- Home delivery Section End -->

            <!-- e-Delivery Section Start -->
            <c:if test="${not empty orderDetailData.EDelivery }">
            <c:set var="orderDetail" value="${orderDetailData.EDelivery}"/>
            <div class="deliver-info">
                <div class="deliver-info-name font-bold">
                    <span class="info-name"><spring:theme code = "text.order.detail.page.two.order.email.delivery"/></span>
                    <span class="items-num font-regular">(${orderDetailData.EQty}&nbsp;<c:if test="${orderDetailData.EQty gt 1}"><spring:theme code ="text.order.detail.page.one.order.items"/></c:if>
                    <c:if test="${orderDetailData.EQty eq 1}"><spring:theme code ="text.order.detail.page.one.order.items"/></c:if>)</span>
                </div>
                <div class="delivery-container">
                    <div class="delivery-content font-regular">
                        <span class="deliver-title font-SemiBold"><spring:theme code = "text.order.detail.page.two.order.recipient.email.address"/></span>
                        <span>${deliveryAddress.email }</span>
                    </div>
                </div>
            </div>
            <div class="order-list">

               <c:forEach items="${orderDetail}" var="orderEntry">
            	<c:set var="orderProduct" value="${orderEntry.product }" />
                <div class="order-detail-cart">

                    <orderDetail:orderDetailEntry orderEntry="${orderEntry }"/>

                    <div class="order-item-list">
                        <div class="order-list-headline">
                            <span class="font-bold order-list-title reference-title"><spring:theme code="text.order.detail.page.two.reference.number"/> </span>
                            <span class="font-bold order-list-title reference-title-mobile"><spring:theme code ="text.order.detail.page.two.reference.number"/></span>
                            <span class="font-bold order-list-title status-title"><spring:theme code = "text.order.detail.page.two.order.status"/></span>
                        </div>
                        <c:if test="${not empty orderEntry.consignments}">
                        <c:forEach items="${orderEntry.consignments}" var="consignment">
                        <div class="order-item-detail J-orderItemDetail">
                            <span class="order-item__tab J-selectTab" aria-hidden="true" tabindex="0" data-url="/_ui/responsive/aml/html/layout/orderItemResendVoucher.html">
                                <span class="font-regular reference-num">${consignment.code }</span>
                                <span class="font-regular delivery-status">
                                <c:if test="${consignment.collectionMethod.code eq 'EMAIL_DELIVERY'}">
                                		<spring:theme code="text.order.status.V2.email.${consignment.consignmentStatus.code}" />
                                </c:if>
                                <c:if test="${consignment.collectionMethod.code ne 'EMAIL_DELIVERY'}">
                                		<c:if test="${consignment.subCollectionMethod.code eq 'MAPPING'}">
                                			<spring:theme code="text.order.status.V2.voucher.${consignment.consignmentStatus.code}" />
                                		</c:if>
                                		<c:if test="${consignment.subCollectionMethod.code eq 'COMMITMENT'}">
                                			<c:if test="${!consignment.consumptionDate}">
                                				<spring:theme code="text.order.status.V2.voucher.commitment.${consignment.consignmentStatus.code}" />
                                			</c:if>
                                			<c:if test="${consignment.consumptionDate}">
                                				<spring:theme code="text.order.status.V2.voucher.commitment.${consignment.consignmentStatus.code}.all" />
                                			</c:if>
                                		</c:if>
                                </c:if>

                                <c:if test="${not empty consignment.alertMsg }">
                                		<svg class="icon-triangle-important" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                            <g fill="none" fill-rule="evenodd">
                                                <circle cx="12" cy="12" r="9" fill="#FACF00"/>
                                                <path fill="#272F38" d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                            </g>
                                		</svg>
                                </c:if>
                                </span>
                                <svg class="icon-arrow-down J-expandStatus" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" aria-label="Expandable button to see the order tracking - Clickable"  tabindex="0">
                                    <g fill="none" fill-rule="nonzero">
                                        <path fill="#272F38" d="M12.67 13.765l4.51-4.51 1.414 1.414-5.925 5.925-5.924-5.925 1.414-1.414z"/>
                                        <path fill="#FACF00" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/>
                                    </g>
                                </svg>
                            </span>
                            <div class="delivery-information J-information clearfix">
								    <h2 class="delivery-detail-headline">
								    		<c:if test="${not empty consignment.alertMsg }">
								    			<span class="font-light"><spring:theme code ="text.order.status.special.delivery.order.processing.description"/></span>
								    		</c:if>
								    		<c:if test="${empty consignment.alertMsg }">
								    			<c:set var="conStatus" value="${consignment.consignmentStatus.code}"/>
								    			<c:set var="colMethod" value="${consignment.collectionMethod.code}"/>
								    			<c:set var="subMethod" value="${consignment.subCollectionMethod.code}"/>
								    			<c:set var="flag" value="${consignment.consumptionDate}"/>
								    			<c:choose>
								    				<c:when test="${conStatus eq 'CREATED' || conStatus eq 'CREATED_ON_HOLD'}">
								        				<span class="font-light"><spring:theme code ="text.order.status.general.order.not.processing"/></span>
								        			</c:when>
								        			<c:when test="${conStatus eq 'DELIVERING' }">
								        				<c:if test="${colMethod eq 'EMAIL_DELIVERY'}">
								        					<span class="font-light"><spring:theme code="text.order.status.email.delivery.order.on.the.way"/> </span>
								        				</c:if>
								        				<c:if test="${colMethod ne 'EMAIL_DELIVERY'}">
								        					<c:if test="${subMethod eq 'MAPPING' }">
								        						<span class="font-light"><spring:theme code ="text.order.status.voucher.delivery.order.voucher.used.description"/></span>
								        					</c:if>
								        					<c:if test="${subMethod eq 'COMMITMENT' }">
								        						<c:if test="${flag}">
								        							<span class="font-light"><spring:theme code ="text.order.status.voucher.delivery.order.voucher.used.description"/></span>
								        						</c:if>
								        						<c:if test="${!flag}">
								        							<span class="font-light"><spring:theme code ="text.order.status.voucher.delivery.order.voucher.sent.description"/></span>
								        						</c:if>
								        					</c:if>
								        				</c:if>
								        			</c:when>
								        			<c:when test="${conStatus eq 'EVOUCHER_SENT'}">
								        				<span class="font-light"><spring:theme code ="text.order.status.voucher.delivery.order.voucher.sent.description"/></span>
								        			</c:when>
								        			<c:when test="${conStatus eq 'AUTO_CANCELLED' || conStatus eq 'CANCELLED' || conStatus eq 'WAIT_REVERSE_OFFLINE'}">
								        				<span class="font-light"><spring:theme code ="text.order.status.special.delivery.order.refunded.description"/></span>
								        			</c:when>
								        		</c:choose>
								    		</c:if>
									    </h2>
									    <orderDetail:orderDetailStatusBar consignment="${consignment}" />
									    <div class="reference-num-section">
        									<p class="font-SemiBold reference-num-title"><spring:theme code="text.order.detail.page.two.reference.number"/> </p>
       									<p class="font-regular reference-num">${consignment.code}</p>
   									 </div>
									    <orderDetail:orderDetailWarningMsg consignment="${consignment}" />

							    		<div class="order-delivery-info">
								        	<orderDetail:orderDetailPartnerInfo orderProduct="${orderProduct }"/>
							        		<c:if test="${consignment.collectionMethod.code ne 'EMAIL_DELIVERY' }">
								        			<div class="resend-voucher">
								        				<input type="hidden" class="J-resendVoucher" value="/my-account/sendVoucher?code=${consignment.code}" />
								        	   		<div class="resend-btn <c:if test='${!consignment.resendVoucher}'>voucher-expired</c:if>">
								                		<a class="font-SemiBold resend-btn-text J-resendBtn"><spring:theme code = "text.order.detail.page.two.order.resend.voucher"/></a>
								            		</div>
								            		<c:if test="${consignment.expired }">
								            			<p class="has-been-expired"><spring:theme code ="text.order.detail.V2.status.voucher.expired"/></p>
								            		</c:if>
								        			</div>
							        		</c:if>
							    		</div>
									</div>
                        </div>
                        </c:forEach>
                        </c:if>
                    </div>
                </div>
                </c:forEach>
            </div>
            </c:if>
            <!-- e-Delivery Section end -->

        </div>
        <div class="order-detail-total">
            <div class="order-total">
                <div class="order-total-inner-wrapper">
                    <div>
                        <span class="font-bold order-total-text"><spring:theme
                                code="text.order.detail.page.one.order.total"/></span>
                    </div>
                    <div class="item-content order-total-amount">
                        <c:if test="${not empty orderData.totalMiles && orderData.totalMiles > 0}">
                            <c:set var="fullCash" value="false"/>
                            <svg class="icon-yellow">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-yellow"/>
                            </svg>
                            <span class="font-bold total-miles"><fmt:formatNumber value="${orderData.totalMiles}"
                                                                                  maxFractionDigits="0"/></span>
                        </c:if>
                        <c:set var="orderTotalPriceCash" value="${orderData.totalPriceCash}"/>
                        <c:if test="${not empty orderTotalPriceCash.value and orderTotalPriceCash.value > 0}">
                            <span class="font-SemiBold total-cash"><span><c:if
                                    test="${not empty fullCash}">+&nbsp;</c:if></span>${orderData.cashCurrencyIsocode}&nbsp;<fmt:formatNumber
                                    value="${orderTotalPriceCash.value}" minFractionDigits="2"
                                    maxFractionDigits="2"/></span>
                        </c:if>
                    </div>
                </div>
                <c:if test="${totalEarnedMiles gt 0}">
                    <div class="earn-miles">
                        <div class="earn-miles-content">
                            <div class="earn-miles-content__title">
                                <p class="font-SemiBold"><spring:theme code="basket.page.miles.earned1"/></p>
                            </div>
                            <c:if test="${orderData.totalEarnedMiles gt 0}">
	                            <div class="earn-miles-content__row">
	                                <div class="earn-miles-content__row-content-left">
	                                    <span><spring:theme code="basket.page.miles.cashspending"/></span>
	                                </div>
	                                <div class="earn-miles-content__row-content-right">
	                                    <svg class="am-icon">
	                                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num"/>
	                                    </svg>
	                                    <span class="font-bold"><fmt:formatNumber value="${orderData.totalEarnedMiles}" type="number"/></span>
	                                </div>
	                            </div>
                            </c:if>
                             <c:forEach  items="${orderData.appliedBonusPromotions }" var="promotion">
											<div class="earn-miles-content__row">
				                      	 <div class="earn-miles-content__row-content-left">
													 <span>${promotion.promotionData.name }</span>
												</div>
												<div class="earn-miles-content__row-content-right">
													<svg class="am-icon">
														<use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-header-num"/>
													</svg>
													<span class="font-bold"><fmt:formatNumber value="${promotion.bonusMiles}" type="number"/></span>
												</div>
											</div>
										</c:forEach>
                        </div>
                        <div class="earn-miles-remark">
                            <p class="font-SemiBold">
	                           <spring:theme code="basket.page.miles.remindstart"/>
				                	<a href=${overviewProfileURL} target="_blank"><spring:theme code="basket.page.miles.remindlink"/></a>
				                	<spring:theme code="basket.page.miles.remindend"/>
                            </p>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="order-alert-msg J-numCopied">
            <svg class="icon-successful" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    <path fill="#FACF00" fill-rule="nonzero" stroke="#272F38" stroke-linejoin="round" stroke-width="1.5" d="M9.598 14.506l10.14-10.14 3.23 3.232-13.37 13.37L.939 12.31l3.232-3.232 5.427 5.428z"/>
            </svg>
            <p class="font-SemiBold alert-msg-text"><spring:theme code ="text.order.detail.V2.status.order.your.copied.tracking"/></p>
        </div>
        <div class="order-alert-msg J-voucherResent">
            <svg class="icon-successful" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    <path fill="#FACF00" fill-rule="nonzero" stroke="#272F38" stroke-linejoin="round" stroke-width="1.5" d="M9.598 14.506l10.14-10.14 3.23 3.232-13.37 13.37L.939 12.31l3.232-3.232 5.427 5.428z"/>
            </svg>
            <p class="font-SemiBold alert-msg-text"><spring:theme code = "text.order.detail.V2.status.you.voucher"/></p>
        </div>
    </div>

    <script src="/_ui/responsive/aml/js/common.js"></script>
    <script src="/_ui/responsive/aml/js/orderDetailsInfo.js"></script>
    <script src="/_ui/responsive/aml/js/applyAllPages.js"></script>
