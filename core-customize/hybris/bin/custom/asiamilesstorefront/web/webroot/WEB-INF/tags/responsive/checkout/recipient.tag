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

<%@ attribute name="recipientInfo" required="true"
	type="com.asiamiles.core.dto.RecipientInfo"%>

<div class="row step-one__recipient">
	<div class="step-one__recipient--left">
		<span>Recipient's Details</span>
	</div>
	<div class="row step-one__recipient--right">
		<div class="col-lg-12 col-sm-12">
			<div class="input-component J-input-transform">
	<input type="text" id="familyName" name="familyName" value="${recipientInfo.familyName}"/>
	<label class=" placeholder J-input-placeholder" for="familyName">Recipient's family name</label>
			</div>
			<div class="input-component J-input-transform">
	<input type="text" id="givenName" name="givenName" value=${recipientInfo.givenName }/>
	<label class=" placeholder J-input-placeholder" for="givenName">Recipient’s given name</label>
			</div>
		</div>
		<div class="col-lg-6 col-sm-6">
			<div class="dropdown-group__checkOut"  tabindex="0" aria-label="Country or Region Code combo box- collapsed.
			selected ${recipientInfo.countryCode}.">
				<span class="dropdown-selected J-selectTrigger" aria-hidden="true"
					tabindex="0"> <span class="dropdown-selected-text"></span>
					<div class="font-SemiBold" id=countryCode
						value="${recipientInfo.countryCode}">${recipientInfo.countryCode}</div>
					<input type="text" id="recipientCountryCodeHidden"
					name="recipientInfo.givenName" value="${recipientInfo.countryCode}"
					hidden=true name="recipientCountryCode" /> 
					<label for="countryCode" class="dropdown-label">Country/Region</label>
					<svg
						class="icon-dropdown" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
						<g fill="none" fill-rule="evenodd" transform="translate(5 8)">
							<path d="M15 0v8.414H0V0z"/>
							<path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
						</g>
							</svg>
				</span>
				<!--desktop dropdown-->
				<div class="dropdown-selected-control J-selectedControl">
					<ul class="listbox" role="listbox" aria-expanded="true">
						<li class="option" role="option" data-href=""><a class="link"
							href="javascript:;">32GB</a></li>
						<li class="option selected" role="option"
							data-href="https://www.baidu.com"><a class="link"
							href="javascript:;">64GB</a></li>
						<li class="option" role="option" data-href=""><a class="link"
							href="javascript:;">32GB</a></li>
							<li class="option" role="option" data-href=""><a class="link"
                            							href="javascript:;">34GB</a></li>
                            							<li class="option" role="option" data-href=""><a class="link"
                                                        							href="javascript:;">35GB</a></li>
                                                        							<li class="option" role="option" data-href=""><a class="link"
                                                                                    							href="javascript:;">36GB</a></li>
                                                                                    							<li class="option" role="option" data-href=""><a class="link"
                                                                                                                                                                                                    							href="javascript:;">23GB</a></li>
					</ul>
				</div>
				<!--/desktop dropdown-->
				<!--mobile dropdown-->
				<select
					class="dropdown-selected-control--mobile J-selectedControlMobile"
					name="title" placeholder="??????">
					<option class="option" value="#">16GB</option>
					<option class="option" value="#" selected>32GB</option>
					<option class="option" value="#">64GB</option>
					<option class="option" value="https://www.baidu.com">128GB</option>
					<option class="option" value="#">256GB</option>
					<option class="option" value="#">132GB</option>
				</select>
				<!--/mobile dropdown-->
			</div>
		</div>
		<div class="col-lg-6 col-sm-6">
			<div class="input-component J-input-transform">
	<input type="text" id="phone" name="phone" value="${recipientInfo.phoneNo}"/>
	<label class=" placeholder J-input-placeholder" for="phone">Mobile phone no. </label>
			</div>
		</div>
	</div>
</div>
