<%@ page trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="user" tagdir="/WEB-INF/tags/responsive/user"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/responsive/formElement"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/responsive/common/header"%>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<template:page pageTitle="${pageTitle}">

  <jsp:attribute name="pageCss">
		<link href="/_ui/responsive/aml/css/common.css" rel="stylesheet">
  		<link href="/_ui/responsive/aml/css/campaign.css" rel="stylesheet">
  		<link href="/_ui/responsive/aml/css/homePage.css" rel="stylesheet">
  	</jsp:attribute>
  	
	<jsp:attribute name="pageScripts">
		<script src="/_ui/responsive/aml/js/common.js"></script>
    	<script src="/_ui/responsive/aml/js/campaign.js"></script>
    	<script src="/_ui/responsive/aml/js/homePage.js"></script>
		<script src="/_ui/responsive/aml/js/homepagePlugin.js"></script>
		<script src="/_ui/responsive/aml/js/campaignPlugin.js"></script>
		<script src="/_ui/responsive/aml/js/applyAllPages.js"></script>
	</jsp:attribute>
	
	<jsp:body>
	<div class="container promotion-campaign-title"> 
    	<h3 class="campaign-headline"><span class="text font-light">
    		${not empty cmsPage.title ? fn:escapeXml(cmsPage.title) : ''}
    	</span></h3>
	</div>
	<div>
		<cms:pageSlot position="SectionA1" var="feature"  class="" >
			<cms:component component="${feature}" class="no-space yComponentWrapper"/>
    	</cms:pageSlot>
    </div>
   
	<div>
		<cms:pageSlot position="SectionA2" var="feature"  class="" >
			<cms:component component="${feature}" class="no-space yComponentWrapper"/>
    	</cms:pageSlot>
    </div>
    <div>
		<cms:pageSlot position="SectionA3" var="feature"  class="" >
			<cms:component component="${feature}" class="no-space yComponentWrapper"/>
    	</cms:pageSlot>
    </div>
    <div>
		<cms:pageSlot position="SectionA4" var="feature" class="" >
			<cms:component component="${feature}" class="no-space yComponentWrapper"/>
    	</cms:pageSlot>
    </div>
	
	<div>
		<cms:pageSlot position="SectionA5" var="feature" class="" >
			<cms:component component="${feature}" class="no-space yComponentWrapper"/>
    	</cms:pageSlot>
    </div>
    <div>
		<cms:pageSlot position="SectionA6" var="feature" class="" >
			<cms:component component="${feature}" class="no-space yComponentWrapper"/>
    	</cms:pageSlot>
    </div>
    
    <div>
		<cms:pageSlot position="SectionA7" var="feature" class="" >
			<cms:component component="${feature}" class="no-space yComponentWrapper"/>
    	</cms:pageSlot>
    </div>
   
    <div>
		<cms:pageSlot position="SectionA8" var="feature" class="" >
			<cms:component component="${feature}" class="no-space yComponentWrapper"/>
    	</cms:pageSlot>
    </div>
   
	
	<div>
		<cms:pageSlot position="SectionA9" var="feature">
			<cms:component component="${feature}"  class="no-space yComponentWrapper"/>
    	</cms:pageSlot>
    </div>
    <div>
		<cms:pageSlot position="SectionA10" var="feature">
			<cms:component component="${feature}"  class="no-space yComponentWrapper"/>
    	</cms:pageSlot>
    </div>
   
	</jsp:body>
	

</template:page>

