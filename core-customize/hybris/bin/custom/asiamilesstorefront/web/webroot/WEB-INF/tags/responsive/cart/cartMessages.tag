<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product"%>
<%@ taglib prefix="storepickup" tagdir="/WEB-INF/tags/responsive/storepickup"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h2 class="cartPage-headline">
	<span class="text"><spring:theme code="text.cart.page.title"/></span>
</h2>
<div class="container cartPage-error-message clearfix">
	<!-- top error message -->
	<c:if test="${cartData.errorMegFlag || cartData.insufficientBalance}">
		<div class="cartPage-error J-cart-error" event_component="error_message" event_value='<spring:theme code="text.cart.page.cart.error.common.message"/>'>
			<svg class="icon-small-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
				<g fill="none" fill-rule="evenodd">
					<path fill="#D0021B" d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
					<path fill="#FFF" d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
				</g>
			</svg>
			<span class="error-text"><spring:theme code="text.cart.page.cart.error.common.message"/></span>
		</div>
	</c:if>
	<!-- /top error message -->
	<!-- top alert message -->
	<c:if test="${not empty validationDatas }">
		<c:forEach items="${validationDatas}" var="modification">
			<c:choose>
				<c:when test="${modification.statusCode eq 'lowStock'}">
					<c:set var="topLowStockFlag" value="true"/>
				</c:when>
			</c:choose>
		</c:forEach>
	</c:if>
	<c:if test="${topLowStockFlag }">
		<div class="cartPage-alert">
			<svg class="icon-triangle-important" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
				<g fill="none" fill-rule="evenodd">
					<circle cx="12" cy="12" r="9" fill="#FACF00"/>
					<path fill="#272F38" d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
				</g>
			</svg>
			<spring:theme code="text.cart.page.cart.alert.insufficient.stock"/>
		</div>
	</c:if>

	<c:forEach var="entry" items="${cartData.entries}" varStatus="status">
		<c:if test="${country eq 'HK' && not empty entry.product.specialProductType && entry.product.specialProductType eq 'ELECTRONIC'}">
			<c:choose>
				<c:when test="${empty entry.statutoryRemovalService}">
					<c:set var="reeStatusAlertMesgFlag" value="true"/>
				</c:when>
				<c:otherwise>
					<c:set var="reeStatusAlertMesgFlag" value="false"/>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:forEach>
	<c:if test="${reeStatusAlertMesgFlag eq true}">
		<div class="cartPage-alert">
			<svg class="icon-triangle-important" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
				 viewBox="0 0 24 24">
				<g fill="none" fill-rule="evenodd">
					<circle cx="12" cy="12" r="9" fill="#FACF00"/>
					<path fill="#272F38"
						  d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
				</g>
			</svg>
			<spring:theme code="text.cart.page.ree.not.in.hk.ee.product.alert.msg"/>
		</div>
	</c:if>
	<!-- /top alert message -->
	<!-- when remove item message -->
	<c:if test="${not empty accInfoMsgs}">
		<c:forEach items="${accInfoMsgs}" var="msg">
			<div class="cartPage-removed">
				<svg class="icon-successful" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
					<path fill="#FACF00" fill-rule="nonzero" stroke="#272F38" stroke-linejoin="round" stroke-width="1.5" d="M9.598 14.506l10.14-10.14 3.23 3.232-13.37 13.37L.939 12.31l3.232-3.232 5.427 5.428z"/>
				</svg>
				<svg class="icon-close J-removeAlertMessage" tabindex="0" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
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
				<spring:theme code="${msg.code}" arguments="${msg.attributes}" htmlEscape="false" var="warningMessages"/>
				${ycommerce:sanitizeHTML(warningMessages)}
			</div>
		</c:forEach>
	</c:if>
	<!-- /when remove item message -->
</div>
