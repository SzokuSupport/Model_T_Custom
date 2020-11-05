<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="consignment" required="true" type="com.asiamiles.facades.Data.OrderDetailConsignmentData" %>

<c:if test="${not empty consignment.alertMsg || not empty consignment.cancelAlertMsg}">
<span class="font-regular order-warning-msg">
	<c:if test="${not empty consignment.alertMsg }">
		<div class="warning-message">
			<svg class="icon-triangle-important" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
				<g fill="none" fill-rule="evenodd">
					<circle cx="12" cy="12" r="9" fill="#FACF00"/>
					<path fill="#272F38" d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
				</g>
			</svg>
			<span>${consignment.alertMsg}</span>
		</div>
	</c:if>
	<c:if test="${not empty consignment.cancelAlertMsg }">
			<span class="voucher-date"><spring:theme code="${consignment.cancelAlertMsg}"/> </span>
	</c:if>
</span>
</c:if>