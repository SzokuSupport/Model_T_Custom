<%@ tag body-content="empty" trimDirectiveWhitespaces="true"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product"%>
<%@ taglib prefix="storepickup"
	tagdir="/WEB-INF/tags/responsive/storepickup"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ attribute name="titles" required="true" type="java.util.List"%>
<%@ attribute name="title" required="false" type="java.lang.String"%>
   
<div class="dropdown-group__checkOut">
			<label for="selectedTitle" class="dropdown-label">
					<spring:theme code="checkout.step1.title"/>
			</label>
    		<a class="dropdown-selected J-selectTrigger" aria-hidden="false" tabindex="0">
        		<span class="dropdown-selected-text J-code"></span>
				<input class="J-select-input" name="selectedTitle" type="hidden" id='selectedTitle' value="${title}"/>
       			<svg class="icon-dropdown" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
					<g fill="none" fill-rule="evenodd" transform="translate(5 8)">
						<path d="M15 0v8.414H0V0z"/>
						<path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
					</g>
       			</svg>
    		</a>
   
		    <!-- desktop dropdown -->
		    <div class="dropdown-selected-control J-selectedControl">
		        <ul class="listbox" role="listbox" aria-expanded="true">
	        		<c:forEach items="${titles}" var="titleList">
		        		<c:if test="${titleList.code==title}">
			        		<button tabindex="0" class="option selected" role="option" data="${titleList.code}">
			                	<a class="link"><span class="J-code-title">${titleList.name}</span></a>
			            	</button>
						</c:if>
						<c:if test="${titleList.code!=title}">
			        		<li tabindex="0" class="option" role="option" data="${titleList.code}">
			                	<a class="link"><span class="J-code-title">${titleList.name}</span></a>
			            	</li>
						</c:if>
		            </c:forEach>
		        </ul>
		    </div>
    		<!-- /desktop dropdown -->
    		<!-- mobile dropdown -->
    		<select use="f" class="dropdown-selected-control--mobile J-selectedControlMobile" placeholder="<spring:theme code="checkout.step1.title"/>">
        		<c:forEach items="${titles}" var="titleList">
	        		<option class="option" ${(titleList.code eq title) ? 'selected="selected"' : ''} value="${titleList.code}" >${titleList.name}</option>
    		    </c:forEach>
    		</select>
    		
    		<!-- /mobile dropdown -->
		    <div class="errorBox J-error-box">
        		<div class="errorMes">
            		<svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                		<g fill="none" fill-rule="evenodd">
							<path fill="#D0021B" d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
							<path fill="#FFF" d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
						</g>
            		</svg>
            		<span class="J-error-back">
            			<spring:theme code="checkout.step1.title.error"/>
           			</span>
        		</div>
    		</div>
		</div>