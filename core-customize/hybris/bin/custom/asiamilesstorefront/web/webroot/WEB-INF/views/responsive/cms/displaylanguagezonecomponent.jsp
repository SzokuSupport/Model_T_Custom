<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<spring:htmlEscape defaultHtmlEscape="true" />

<div class="header-language  J-headerLanguage" tabindex='2' aria-label="language selection link- selected language ${language}">
	<span class="font-SemiBold" aria-hidden="true">${languageUpperCase}</span>
</div>

