<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:url value="${urlLink}" var="simpleBannerUrl" />

<div class="banner__component simple-banner">
	<picture>
		<a href="${fn:escapeXml(logourl)}">
       <source media="(max-width: 768px)" srcset="${fn:escapeXml(desklogo.url)}">
       <img class="logo-img" src="${fn:escapeXml(mobilelogo.url)}" alt="logo">
       </a>
   </picture>
</div>