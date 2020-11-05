<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="consignment" required="true" type="com.asiamiles.facades.Data.OrderDetailConsignmentData" %>

<c:set var="status" value="${consignment.consignmentStatus.code}"/>
<c:set var="collectionMethod" value="${consignment.collectionMethod.code}"/>

<c:if test="${collectionMethod eq 'HOME_DELIVERY' || collectionMethod eq 'REDEMPTION_LETTER'}">
    <c:if test="${status eq 'CREATED' || status eq 'CREATED_ON_HOLD' }">
        <div class="delivery-status-bar">
            <span class="status-item status-black">
                <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <title>svg/web/tick_small copy 5</title>
                    <desc>Created with Sketch.</desc>
                    <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                        <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                            <g>
                                <g transform="translate(17.000000, 308.000000)">
                                    <g transform="translate(3.000000, 4.000000)">
                                        <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </svg>
                <pre class="font-bold status-text"><spring:theme code="text.order.status.general.order.placed"/></pre>
            </span>
            <span class="status-line"></span>
            <span class="status-item status-yellow">
                <pre class="font-bold status-text"><spring:theme
                        code="text.order.status.general.order.processing"/></pre>
            </span>
            <span class="status-line grey-line"></span>
            <span class="status-item status-grey">
                <pre class="font-regular status-text"><spring:theme
                        code="text.order.status.home.delivery.order.shipped"/></pre>
            </span>
        </div>
    </c:if>

    <c:if test="${status eq 'DELIVERING' || status eq 'SHIPPED' }">
        <div class="delivery-status-bar">
        	<span class="status-item status-black">
            <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>svg/web/tick_small copy 5</title>
                    <desc>Created with Sketch.</desc>
                    <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                        <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                            <g>
                                <g transform="translate(17.000000, 308.000000)">
                                    <g transform="translate(3.000000, 4.000000)">
                                        <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
            </svg>
            <pre class="font-bold status-text"><spring:theme code="text.order.status.general.order.placed"/></pre>
        </span>
            <span class="status-line"></span>
            <span class="status-item status-black">
            <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>svg/web/tick_small copy 5</title>
                    <desc>Created with Sketch.</desc>
                    <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                        <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                            <g>
                                <g transform="translate(17.000000, 308.000000)">
                                    <g transform="translate(3.000000, 4.000000)">
                                        <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
            </svg>
            <pre class="font-bold status-text"><spring:theme code="text.order.status.general.order.processing"/></pre>
        </span>
            <span class="status-line"></span>
            <span class="status-item status-black">
            <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>svg/web/tick_small copy 5</title>
                    <desc>Created with Sketch.</desc>
                    <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                        <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                            <g>
                                <g transform="translate(17.000000, 308.000000)">
                                    <g transform="translate(3.000000, 4.000000)">
                                        <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
            </svg>
            <pre class="font-regular status-text"><spring:theme
                    code="text.order.status.home.delivery.order.shipped"/></pre>
        </span>
        </div>
    </c:if>

    <c:if test="${status eq 'AUTO_CANCELLED' || status eq 'CANCELLED' || status eq 'WAIT_REVERSE_OFFLINE' }">
        <div class="delivery-status-bar status-refunded">
            <div class="refunded-mask"></div>
            <span class="status-item status-black">
            <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>svg/web/tick_small copy 5</title>
                    <desc>Created with Sketch.</desc>
                    <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                        <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                            <g>
                                <g transform="translate(17.000000, 308.000000)">
                                    <g transform="translate(3.000000, 4.000000)">
                                        <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
            </svg>
            <pre class="font-bold status-text"><spring:theme code="text.order.status.general.order.placed"/></pre>
        </span>
            <span class="status-line"></span>
            <span class="status-item status-black">
            <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>svg/web/tick_small copy 5</title>
                    <desc>Created with Sketch.</desc>
                    <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                        <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                            <g>
                                <g transform="translate(17.000000, 308.000000)">
                                    <g transform="translate(3.000000, 4.000000)">
                                        <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
            </svg>
            <pre class="font-bold status-text"><spring:theme code="text.order.status.general.order.processing"/></pre>
        </span>
            <span class="status-line"></span>
            <span class="status-item status-black">
            <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>svg/web/tick_small copy 5</title>
                <desc>Created with Sketch.</desc>
                <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                    <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                        <g>
                            <g transform="translate(17.000000, 308.000000)">
                                <g transform="translate(3.000000, 4.000000)">
                                    <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
            </svg>
            <pre class="font-regular status-text"><spring:theme
                    code="text.order.status.home.delivery.order.shipped"/></pre>
        </span>
        </div>
    </c:if>
</c:if>

<c:if test="${collectionMethod eq 'EVOUCHER_QR' || collectionMethod eq 'EVOUCHER_QR_THIRDPARTY' || collectionMethod eq 'EVOUCHER_AN' || collectionMethod eq 'EVOUCHER_BAR' || collectionMethod eq 'EVOUCHER_URL'}">
    <c:set var="subMethod" value="${consignment.subCollectionMethod.code}"/>
    <c:set var="flag" value="${consignment.consumptionDate}"/>

    <c:if test="${status eq 'CREATED' || status eq 'CREATED_ON_HOLD' }">
        <div class="more-padding">
            <div class="more-delivery J-more">
                <div class="left-arrow J-left-more">
                    <svg class="icon-arrow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                        <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                            <path d="M15 0v8.414H0V0z"/>
                            <path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                        </g>
                    </svg>
                </div>
                <div class="right-arrow J-right-more">
                    <svg class="icon-arrow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                        <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                            <path d="M15 0v8.414H0V0z"/>
                            <path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                        </g>
                    </svg>
                </div>
                <div class="delivery-status-more J-delivery">
		                <span class="status-item status-black J-status-item">
		                    <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
		                        <title>svg/web/tick_small copy 5</title>
                    <desc>Created with Sketch.</desc>
                    <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                        <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                            <g>
                                <g transform="translate(17.000000, 308.000000)">
                                    <g transform="translate(3.000000, 4.000000)">
                                        <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
		                    </svg>
		                    <pre class="font-bold status-text"><spring:theme
                                    code="text.order.status.general.order.placed"/></pre>
		                </span>
                    <span class="status-line J-status-line"></span>
                    <span class="status-item status-yellow J-status-item">
		                    <pre class="font-bold status-text"><spring:theme
                                    code="text.order.status.general.order.processing"/></pre>
		                </span>
                    <span class="status-line grey-line J-status-line"></span>
                    <span class="status-item status-grey J-status-item">
		                    <pre class="font-regular status-text"><spring:theme
                                    code="text.order.status.voucher.delivery.order.voucher.sent"/></pre>
		                </span>
                    <span class="status-line grey-line J-status-line"></span>
                    <span class="status-item status-grey J-status-item">
		                    <pre class="font-regular status-text"><spring:theme
                                    code="text.order.status.voucher.delivery.order.voucher.used"/></pre>
		                </span>
                </div>
            </div>
        </div>
    </c:if>

    <c:if test="${status eq 'EVOUCHER_SENT' || (status eq 'DELIVERING' && subMethod eq 'COMMITMENT' && !flag)}">
        <div class="more-padding">
            <div class="more-delivery J-more">
                <div class="left-arrow J-left-more">
                    <svg class="icon-arrow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                        <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                            <path d="M15 0v8.414H0V0z"/>
                            <path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                        </g>
                    </svg>
                </div>
                <div class="right-arrow J-right-more">
                    <svg class="icon-arrow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                        <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                            <path d="M15 0v8.414H0V0z"/>
                            <path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                        </g>
                    </svg>
                </div>
                <div class="delivery-status-more J-delivery">
                <span class="status-item status-black J-status-item">
                    <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <title>svg/web/tick_small copy 5</title>
                        <desc>Created with Sketch.</desc>
                        <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                            <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                                <g>
                                    <g transform="translate(17.000000, 308.000000)">
                                        <g transform="translate(3.000000, 4.000000)">
                                            <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </svg>
                    <pre class="font-bold status-text"><spring:theme
                            code="text.order.status.general.order.placed"/></pre>
                </span>

                    <span class="status-line J-status-line"></span>
                    <span class="status-item status-black J-status-item">
                    <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <title>svg/web/tick_small copy 5</title>
                        <desc>Created with Sketch.</desc>
                        <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                            <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                                <g>
                                    <g transform="translate(17.000000, 308.000000)">
                                        <g transform="translate(3.000000, 4.000000)">
                                            <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </svg>
                  <pre class="font-bold status-text"><spring:theme
                          code="text.order.status.general.order.processing"/></pre>
                </span>
                    <span class="status-line J-status-line"></span>
                    <span class="status-item status-black J-status-item">
                    <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <title>svg/web/tick_small copy 5</title>
                        <desc>Created with Sketch.</desc>
                        <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                            <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                                <g>
                                    <g transform="translate(17.000000, 308.000000)">
                                        <g transform="translate(3.000000, 4.000000)">
                                            <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </svg>
                    <pre class="font-bold status-text"><spring:theme
                            code="text.order.status.voucher.delivery.order.voucher.sent"/></pre>
                </span>
                    <span class="status-line grey-line J-status-line"></span>
                    <span class="status-item status-grey J-status-item">
                    <pre class="font-regular status-text"><spring:theme
                            code="text.order.status.voucher.delivery.order.voucher.used"/></pre>
                </span>
                </div>
            </div>
        </div>

    </c:if>

    <c:if test="${status eq 'DELIVERING' && ((subMethod eq 'COMMITMENT' && flag) || subMethod eq 'MAPPING')}">

        <div class="more-padding">
            <div class="more-delivery J-more">
                <div class="left-arrow J-left-more">
                    <svg class="icon-arrow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                        <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                            <path d="M15 0v8.414H0V0z"/>
                            <path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                        </g>
                    </svg>
                </div>
                <div class="right-arrow J-right-more">
                    <svg class="icon-arrow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                        <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                            <path d="M15 0v8.414H0V0z"/>
                            <path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                        </g>
                    </svg>
                </div>
                <div class="delivery-status-more J-delivery">
                <span class="status-item status-black J-status-item">
                    <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <title>svg/web/tick_small copy 5</title>
                        <desc>Created with Sketch.</desc>
                        <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                            <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                                <g>
                                    <g transform="translate(17.000000, 308.000000)">
                                        <g transform="translate(3.000000, 4.000000)">
                                            <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </svg>
                     <pre class="font-bold status-text"><spring:theme
                             code="text.order.status.general.order.placed"/></pre>
                </span>
                    <span class="status-line J-status-line"></span>
                    <span class="status-item status-black J-status-item">
                    <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <title>svg/web/tick_small copy 5</title>
                        <desc>Created with Sketch.</desc>
                        <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                            <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                                <g>
                                    <g transform="translate(17.000000, 308.000000)">
                                        <g transform="translate(3.000000, 4.000000)">
                                            <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </svg>
                   <pre class="font-bold status-text"><spring:theme
                           code="text.order.status.general.order.processing"/></pre>
                </span>
                    <span class="status-line J-status-line"></span>
                    <span class="status-item status-black J-status-item">
                    <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <title>svg/web/tick_small copy 5</title>
                        <desc>Created with Sketch.</desc>
                        <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                            <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                                <g>
                                    <g transform="translate(17.000000, 308.000000)">
                                        <g transform="translate(3.000000, 4.000000)">
                                            <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </svg>
                    <pre class="font-bold status-text"><spring:theme
                            code="text.order.status.voucher.delivery.order.voucher.sent"/></pre>
                </span>
                    <span class="status-line J-status-line"></span>
                    <span class="status-item status-black J-status-item">
                    <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <title>svg/web/tick_small copy 5</title>
                        <desc>Created with Sketch.</desc>
                        <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                            <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                                <g>
                                    <g transform="translate(17.000000, 308.000000)">
                                        <g transform="translate(3.000000, 4.000000)">
                                            <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </svg>
                    <pre class="font-bold status-text"><spring:theme
                            code="text.order.status.voucher.delivery.order.voucher.used"/></pre>
                </span>
                </div>
            </div>
        </div>

    </c:if>

    <c:if test="${status eq 'AUTO_CANCELLED' || status eq 'CANCELLED' || status eq 'WAIT_REVERSE_OFFLINE' }">
        <div class="more-padding">
            <div class="more-delivery J-more">
                <div class="refunded-mask">
                </div>
                <div class="left-arrow J-left-more">
                    <svg class="icon-arrow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                        <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                            <path d="M15 0v8.414H0V0z"/>
                            <path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                        </g>
                    </svg>
                </div>
                <div class="right-arrow J-right-more">
                    <svg class="icon-arrow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                        <g fill="none" fill-rule="evenodd" transform="translate(5 8)">
                            <path d="M15 0v8.414H0V0z"/>
                            <path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
                        </g>
                    </svg>
                </div>
                <div class="delivery-status-more J-delivery">
                <span class="status-item status-black J-status-item">
                    <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <title>svg/web/tick_small copy 5</title>
                    <desc>Created with Sketch.</desc>
                    <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                        <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                            <g>
                                <g transform="translate(17.000000, 308.000000)">
                                    <g transform="translate(3.000000, 4.000000)">
                                        <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    </svg>
                    <pre class="font-bold status-text"><spring:theme
                            code="text.order.status.general.order.placed"/></pre>
                </span>

                    <span class="status-line J-status-line"></span>
                    <span class="status-item status-black J-status-item">
                    <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <title>svg/web/tick_small copy 5</title>
                        <desc>Created with Sketch.</desc>
                        <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                            <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                                <g>
                                    <g transform="translate(17.000000, 308.000000)">
                                        <g transform="translate(3.000000, 4.000000)">
                                            <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </svg>
                    <pre class="font-bold status-text"><spring:theme
                            code="text.order.status.general.order.processing"/></pre>
                </span>
                    <span class="status-line J-status-line"></span>
                    <span class="status-item status-black J-status-item">
                    <svg class="icon-tick">
                        <title>svg/web/tick_small copy 5</title>
                        <desc>Created with Sketch.</desc>
                        <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                            <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                                <g>
                                    <g transform="translate(17.000000, 308.000000)">
                                        <g transform="translate(3.000000, 4.000000)">
                                            <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </svg>
                    <pre class="font-bold status-text"><spring:theme
                            code="text.order.status.voucher.delivery.order.voucher.sent"/></pre>
                </span>
                    <span class="status-line J-status-line"></span>
                    <span class="status-item status-black J-status-item">
                <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <title>svg/web/tick_small copy 5</title>
                    <desc>Created with Sketch.</desc>
                    <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                        <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                            <g>
                                <g transform="translate(17.000000, 308.000000)">
                                    <g transform="translate(3.000000, 4.000000)">
                                        <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </svg>
                <pre class="font-bold status-text"><spring:theme
                        code="text.order.status.voucher.delivery.order.voucher.used"/></pre>
            </span>
                </div>
            </div>
        </div>
    </c:if>
</c:if>

<c:if test="${collectionMethod eq 'EMAIL_DELIVERY'}">
    <c:if test="${status eq 'CREATED' || status eq 'CREATED_ON_HOLD' }">
        <div class="delivery-status-bar">
            <span class="status-item status-black">
                <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <title>svg/web/tick_small copy 5</title>
                    <desc>Created with Sketch.</desc>
                    <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                        <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                            <g>
                                <g transform="translate(17.000000, 308.000000)">
                                    <g transform="translate(3.000000, 4.000000)">
                                        <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </svg>
                <pre class="font-bold status-text"><spring:theme code="text.order.status.general.order.placed"/></pre>
            </span>
            <span class="status-line"></span>
            <span class="status-item status-yellow">
                <pre class="font-bold status-text"><spring:theme
                        code="text.order.status.general.order.processing"/></pre>
            </span>
            <span class="status-line grey-line"></span>
            <span class="status-item status-grey">
                <pre class="font-regular status-text"><spring:theme code="text.order.status.home.delivery.order.shipped"/></pre>
            </span>
        </div>
    </c:if>

    <c:if test="${status eq 'DELIVERING'}">
        <div class="delivery-status-bar">
        <span class="status-item status-black">
            <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>svg/web/tick_small copy 5</title>
                <desc>Created with Sketch.</desc>
                <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                    <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                        <g>
                            <g transform="translate(17.000000, 308.000000)">
                                <g transform="translate(3.000000, 4.000000)">
                                    <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
            </svg>
            <pre class="font-bold status-text"><spring:theme code="text.order.status.general.order.placed"/></pre>
        </span>
            <span class="status-line"></span>
            <span class="status-item status-black">
            <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>svg/web/tick_small copy 5</title>
                <desc>Created with Sketch.</desc>
                <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                    <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                        <g>
                            <g transform="translate(17.000000, 308.000000)">
                                <g transform="translate(3.000000, 4.000000)">
                                    <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
            </svg>
            <pre class="font-bold status-text"><spring:theme code="text.order.status.general.order.processing"/></pre>
        </span>
            <span class="status-line"></span>
            <span class="status-item status-black">
            <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>svg/web/tick_small copy 5</title>
                    <desc>Created with Sketch.</desc>
                    <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                        <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                            <g>
                                <g transform="translate(17.000000, 308.000000)">
                                    <g transform="translate(3.000000, 4.000000)">
                                        <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
            </svg>
            <pre class="font-bold status-text"><spring:theme code="text.order.status.email.delivery.order.sent"/> </pre>
        </span>
        </div>
    </c:if>

    <c:if test="${status eq 'AUTO_CANCELLED' || status eq 'CANCELLED' || status eq 'WAIT_REVERSE_OFFLINE' }">
        <div class="delivery-status-bar status-refunded">
            <div class="refunded-mask"></div>
            <span class="status-item status-black">
            <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>svg/web/tick_small copy 5</title>
                <desc>Created with Sketch.</desc>
                <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                    <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                        <g>
                            <g transform="translate(17.000000, 308.000000)">
                                <g transform="translate(3.000000, 4.000000)">
                                    <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
            </svg>
            <pre class="font-bold status-text"><spring:theme code="text.order.status.general.order.placed"/></pre>
        </span>
            <span class="status-line"></span>
            <span class="status-item status-black">
            <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>svg/web/tick_small copy 5</title>
                <desc>Created with Sketch.</desc>
                <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                    <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                        <g>
                            <g transform="translate(17.000000, 308.000000)">
                                <g transform="translate(3.000000, 4.000000)">
                                    <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
            </svg>
            <pre class="font-bold status-text"><spring:theme code="text.order.status.general.order.processing"/></pre>
        </span>
            <span class="status-line"></span>
            <span class="status-item status-black">
            <svg class="icon-tick" width="14px" height="11px" viewBox="0 0 14 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>svg/web/tick_small copy 5</title>
                <desc>Created with Sketch.</desc>
                <g stroke="none" stroke-width="1" fill="#ffffff" fill-rule="evenodd">
                    <g transform="translate(-20.000000, -315.000000)" fill="#ffffff" fill-rule="nonzero">
                        <g>
                            <g transform="translate(17.000000, 308.000000)">
                                <g transform="translate(3.000000, 4.000000)">
                                    <polygon id="Path-9-Copy" transform="translate(7.156071, 6.722085) rotate(-45.000000) translate(-7.156071, -6.722085) " points="3.48556315 8.22208467 3.48556315 3.22208467 1.48556315 3.22208467 1.48556315 10.2220847 12.8265788 10.2220847 12.8265788 8.22208467"></polygon>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
            </svg>
            <pre class="font-bold status-text"><spring:theme code="text.order.status.home.delivery.order.shipped"/> </pre>
        </span>
        </div>
    </c:if>
</c:if>