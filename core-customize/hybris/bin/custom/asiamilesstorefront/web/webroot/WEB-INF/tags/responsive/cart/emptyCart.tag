<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="empty-cart">
    <h2 class="empty-cart-headline"><span class="text font-light"><spring:theme code="text.cart.page.title"/></span></h2>

    <div class="empty-cart--content">
        <p class="title"><spring:theme code="text.empty.cart.page.empty.cart"/></p>
        <p class="detail"><spring:theme code="text.empty.cart.page.add.items"/></p>
        <c:url value="/" var="home"/>
        <a href="${home }" class="button-yellow font-SemiBold content"><spring:theme code="text.empty.cart.page.continue.shopping"/></a>
    </div>
</div>