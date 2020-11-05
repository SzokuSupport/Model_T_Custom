<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="orderProduct" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>

<div class="deliver-contact-info col-lg-7">
	<span class="font-regular delivery-info-title"><spring:theme code ="text.order.detail.page.two.order.contact.details"/></span>
	<c:if test="${not empty orderProduct.deliveryPartnerTelephone || not empty orderProduct.deliveryPartnerEmail || not empty orderProduct.deliveryPartnerCompanyName}">
	<div class="inquiries-delivery">
		<p class="font-SemiBold inquiries-title"><spring:theme code ="text.order.detail.page.two.order.inquiries.about.delivery"/></p>
		
		<p class="font-SemiBold inquiries-sub-title">${orderProduct.deliveryPartnerCompanyName } </p> 
		<c:if test="${not empty orderProduct.deliveryPartnerTelephone }">
		<p class="font-regular contact-info"> 
		<svg class="icon-tel" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
			<path fill="#272F38" fill-rule="nonzero" d="M19.843 18.568a.468.468 0 0 0 0-.655l-2.202-2.202a.464.464 0 0 0-.647-.006l-1.107 1.134a1.985 1.985 0 0 1-2.804 0l-5.41-5.41a1.985 1.985 0 0 1 0-2.803L8.786 7.51a.466.466 0 0 0-.001-.655L6.585 4.654a.466.466 0 0 0-.655 0L4.526 6.059a14.03 14.03 0 0 0 4.117 9.54c2.7 2.7 6.307 4.146 10.049 4.12l1.151-1.15zm-.81 2.666a15.552 15.552 0 0 1-11.465-4.56A15.554 15.554 0 0 1 3 5.756a.76.76 0 0 1 .223-.543L4.855 3.58a1.986 1.986 0 0 1 2.805 0l2.2 2.201a1.986 1.986 0 0 1 .002 2.805L8.747 9.7a.465.465 0 0 0 0 .653l5.41 5.41a.464.464 0 0 0 .648.007l1.108-1.135a1.986 1.986 0 0 1 2.803 0l2.203 2.202a1.988 1.988 0 0 1 0 2.805l-1.37 1.369a.76.76 0 0 1-.516.222z"/>
		</svg> 
		${orderProduct.deliveryPartnerTelephone }
		</p> 
		</c:if>
		<c:if test="${not empty orderProduct.deliveryPartnerEmail}">
		<p class="font-regular contact-info"> 
		<svg class="icon-email" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
			<path fill="#272F38" fill-rule="nonzero" d="M3.605 7.288v10.443h16.79V7.288l-7.928 5.487a.824.824 0 0 1-.933 0L3.605 7.288zm1.702-.733L12 11.187l6.693-4.632H5.307zm-2.504 12.73A.79.79 0 0 1 2 18.509V5.778c0-.43.36-.778.803-.778h18.394a.79.79 0 0 1 .803.777v12.731a.79.79 0 0 1-.803.778H2.803z"/>
		</svg> 
		${orderProduct.deliveryPartnerEmail}
		</p>
		</c:if>
	</div>
	</c:if>
	<c:if test="${not empty orderProduct.productPartnerCompanyName || not empty orderProduct.productPartnerTelephone || not empty orderProduct.productPartnerEmail}">
	<div class="inquiries-product">
		<p class="font-SemiBold inquiries-title"><spring:theme code ="text.order.detail.page.two.order.inquiries.about.product"/></p>
		<p class="font-SemiBold inquiries-sub-title">${orderProduct.productPartnerCompanyName } </p> 
		<c:if test="${not empty orderProduct.productPartnerTelephone}">
		<p class="font-regular contact-info"> 
		<svg class="icon-tel" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
			<path fill="#272F38" fill-rule="nonzero" d="M19.843 18.568a.468.468 0 0 0 0-.655l-2.202-2.202a.464.464 0 0 0-.647-.006l-1.107 1.134a1.985 1.985 0 0 1-2.804 0l-5.41-5.41a1.985 1.985 0 0 1 0-2.803L8.786 7.51a.466.466 0 0 0-.001-.655L6.585 4.654a.466.466 0 0 0-.655 0L4.526 6.059a14.03 14.03 0 0 0 4.117 9.54c2.7 2.7 6.307 4.146 10.049 4.12l1.151-1.15zm-.81 2.666a15.552 15.552 0 0 1-11.465-4.56A15.554 15.554 0 0 1 3 5.756a.76.76 0 0 1 .223-.543L4.855 3.58a1.986 1.986 0 0 1 2.805 0l2.2 2.201a1.986 1.986 0 0 1 .002 2.805L8.747 9.7a.465.465 0 0 0 0 .653l5.41 5.41a.464.464 0 0 0 .648.007l1.108-1.135a1.986 1.986 0 0 1 2.803 0l2.203 2.202a1.988 1.988 0 0 1 0 2.805l-1.37 1.369a.76.76 0 0 1-.516.222z"/>
		</svg> 
		${orderProduct.productPartnerTelephone }
		</p> 
		</c:if>
		<c:if test="${not empty orderProduct.productPartnerEmail}">
		<p class="font-regular contact-info"> 
		<svg class="icon-email" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
			<path fill="#272F38" fill-rule="nonzero" d="M3.605 7.288v10.443h16.79V7.288l-7.928 5.487a.824.824 0 0 1-.933 0L3.605 7.288zm1.702-.733L12 11.187l6.693-4.632H5.307zm-2.504 12.73A.79.79 0 0 1 2 18.509V5.778c0-.43.36-.778.803-.778h18.394a.79.79 0 0 1 .803.777v12.731a.79.79 0 0 1-.803.778H2.803z"/>
		</svg> 
		${orderProduct.productPartnerEmail }
		</p>
		</c:if>
	</div>
	</c:if>
</div>