<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="cms" tagdir="/WEB-INF/tags/responsive/template/cms" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>

<template:javaScriptVariables/>

<c:set var="commonResourcePathHtml" value="${fn:escapeXml(commonResourcePath)}"/>
<c:choose>
	<c:when test="${wro4jEnabled}">
	  	<script type="text/javascript" src="${fn:escapeXml(contextPath)}/wro/all_responsive.js"></script>
	  	<script type="text/javascript" src="${fn:escapeXml(contextPath)}/wro/addons_responsive.js"></script>
	</c:when>
	<c:otherwise>
		<%-- jquery --%>
		
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery-ui-1.12.1.min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/enquire.min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/Imager.min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.colorbox-min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.form.min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.hoverIntent.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/js.cookie.2.2.1.js"></script>
		
		
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.cms.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.common.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.global.js"></script>
		<script type="text/javascript" src="/_ui/shared/js/analyticsmediator.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.profile.consent.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.track.js"></script>
		
		<c:if test="${needAddonJSLoad eq true}">
		<%-- plugins --%>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/enquire.min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/Imager.min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/purify.min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.blockUI-2.66.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.colorbox-min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.form.min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.hoverIntent.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.pstrength.custom-1.2.0.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.syncheight.custom.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.tabs.custom.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery-ui-1.12.1.min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.zoom.custom.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/owl.carousel.custom.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.tmpl-1.0.0pre.min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.currencies.min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.waitforimages.min.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/jquery.slideviewer.custom.1.2.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/js.cookie.2.2.1.js"></script>
		
		<%-- Custom ACC JS --%> 
		
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.address.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.autocomplete.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.carousel.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.cart.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.cartitem.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.checkout.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.checkoutsteps.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.cms.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.colorbox.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.common.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.forgottenpassword.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.global.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.hopdebug.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.imagegallery.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.langcurrencyselector.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.minicart.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.navigation.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.order.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.paginationsort.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.payment.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.paymentDetails.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.pickupinstore.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.product.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.productDetail.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.quickview.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.ratingstars.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.refinements.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.sanitizer.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.silentorderpost.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.tabs.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.termsandconditions.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.track.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.storefinder.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.futurelink.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.productorderform.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.savedcarts.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.multidgrid.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.quickorder.js"></script>
		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.quote.js"></script>
		</c:if>
		<%-- Comment out by Jumbo Cheung, since the default consent bar will not be used --%>
		<%-- <script type="text/javascript" src="${commonResourcePathHtml}/js/acc.consent.js"></script>--%>


		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.cookienotification.js"></script>

		<script type="text/javascript" src="${commonResourcePathHtml}/js/acc.csv-import.js"></script>

		<script type="text/javascript" src="${commonResourcePathHtml}/js/_autoload.js"></script>
		
		<%-- Cms Action JavaScript files  --%>
		<c:forEach items="${cmsActionsJsFiles}" var="actionJsFile">
		    <script type="text/javascript" src="${commonResourcePathHtml}/js/cms/${fn:escapeXml(actionJsFile)}"></script>
		</c:forEach>
		
		<%-- AddOn JavaScript files --%>
		<c:forEach items="${addOnJavaScriptPaths}" var="addOnJavaScript">
		    <script type="text/javascript" src="${fn:escapeXml(addOnJavaScript)}"></script>
		</c:forEach>
		
	</c:otherwise>
</c:choose>

<!-- <script src="/_ui/responsive/assets/js/common.js"></script> -->

<!-- <script src="/_ui/responsive/aml/js/common.js"></script> -->
<%-- Cookie Consent Bar JavaScript file --%>
<c:if test="${not empty cookieConsentJs and not empty cookieConsentCss}">
	<script type="text/javascript" src="${cookieConsentJs}"></script>
</c:if>
<cms:previewJS cmsPageRequestContextData="${cmsPageRequestContextData}" />
