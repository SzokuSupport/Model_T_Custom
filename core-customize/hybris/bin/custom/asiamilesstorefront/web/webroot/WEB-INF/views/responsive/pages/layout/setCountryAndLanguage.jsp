<%@ page trimDirectiveWhitespaces="true" contentType="application/json" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product"%>

{
    "setLanuage":"<spring:escapeBody javaScriptEscape="true">
    <c:forEach items="${homeLanguages}" var="l">
        <input type="radio" name="language" value="${l.isocode}" <c:if test="${l.isocode eq language}">checked</c:if>>${l.nativeName}
    </c:forEach>
    </spring:escapeBody>",
    "setCountry":"<spring:escapeBody javaScriptEscape="true">
    <c:forEach items="${countrys}" var="c">
        <option value="${c.isocode}" <c:if test="${c.isocode == country}">selected</c:if>>${c.name}(${c.isocode})</option>
    </c:forEach>
    </spring:escapeBody>"
}
