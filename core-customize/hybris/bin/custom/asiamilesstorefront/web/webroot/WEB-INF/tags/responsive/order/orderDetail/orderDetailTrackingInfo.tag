<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="consignment" required="true" type="com.asiamiles.facades.Data.OrderDetailConsignmentData" %>

	<c:if test="${not empty consignment.trackingID}">
	<div class="track-info">
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
             <span class="font-regular track-title-text"><spring:theme code ="text.order.detail.V2.status.order.tracking.number"/>:
             </span>
         </span>
         <span class="track-number">
             <span class="font-SemiBold track-number-text J-courierNum">${consignment.trackingID }</span>
             <span class="font-regular copy-track-number J-copyNumBtn"><spring:theme code = "text.order.detail.V2.status.order.copy"/></span>
         </span>
         <span class="visit-courier" event_component="courier status" event_value="status click">
             <a href="${consignment.trackingUrl }">
                 <span class="font-regular visit-courier-title"><spring:theme code ="text.order.detail.V2.status.order.go.to.delivery"/></span>
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