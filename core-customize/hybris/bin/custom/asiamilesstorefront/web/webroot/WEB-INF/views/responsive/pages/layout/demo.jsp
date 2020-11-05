<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/responsive/common" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="breadcrumb" tagdir="/WEB-INF/tags/responsive/nav/breadcrumb" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="pos" tagdir="/WEB-INF/tags/responsive/pos" %>
<%@ taglib prefix="map" tagdir="/WEB-INF/tags/responsive/map" %>

<template:page pageTitle="${pageTitle}">
	<jsp:attribute name="pageScripts">
		
			<script src="/_ui/responsive/aml/js/common.js"></script>
		
			<script src="/_ui/responsive/aml/js/applyAllPages.js"></script>
		
			<script src="/_ui/responsive/aml/js/demo.js"></script>
		
	</jsp:attribute>
	<jsp:body>		
	<%-- end shop list module --%>


	</jsp:body>
</template:page>
<map:map currentIsoCode="${CDNData.countryIsoCode}"></map:map>
