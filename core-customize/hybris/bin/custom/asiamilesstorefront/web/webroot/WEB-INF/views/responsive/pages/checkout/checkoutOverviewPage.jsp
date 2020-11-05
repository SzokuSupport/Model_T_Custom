<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/responsive/formElement" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/responsive/order" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/responsive/common/header"%>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Asia Miles iRedeem</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="/_ui/responsive/assets/css/jquery-ui.min.css">
    <link rel="stylesheet" href="/_ui/responsive/assets/css/common.css">
  </head>
 <body>
	<header:asiamilesHeader/>
    <div class="checkout-title">
	    <div class="checkout-title-content">
	        <h3>Check out</h3>
	        <hr>
	        <p>The redemption letter(s)/item(s) will be sent to this recipient. Please complete the delivery details below.</p>
	    </div>
	</div>
	<c:url value="/checkout/placeOrder" var="placeOrderUrl" />
	<form:form id="J-place-order" action="${placeOrderUrl}" method="post" commandName="placeOrderForm">
	    <div class="delivery-address">
	   		<input class="form-item" name="addressForm.addressId" type="hidden" value="${placeOrderForm.addressForm.addressId}">
		    <div class="delivery-address-intro">
		        <div class="delivery-address-name">Delivery address</div>
		        <div class="delivery-address-info">Post office box addresses will not be accepted. For award items that are gift cards or vouchers, or if you have requested redemption letter delivery by express courier, a signed acknowledgement is required upon receipt of the mailing.</div>
		    </div>
		    <div class="delivery-address-content">
		        <div class="form">
		            <label class="form-label">Recipient name</label>
		            <input class="form-item" name="addressForm.firstName" type="text" value="${placeOrderForm.addressForm.firstName}">
		        </div>
		        <div class="form">
		            <label class="form-label">Country</label>
		            <select class="form-item" name="addressForm.countryIso" id="">
		                <option value ="AT" <c:if test="${placeOrderForm.addressForm.countryIso eq 'AT'}">selected = "selected"</c:if>>Austria</option>
		                <option value="CA" <c:if test="${placeOrderForm.addressForm.countryIso eq 'CA'}">selected = "selected"</c:if>>Canada</option>
		                <option value ="CN" <c:if test="${placeOrderForm.addressForm.countryIso eq 'CN'}">selected = "selected"</c:if>>China</option>
		                <option value="FR" <c:if test="${placeOrderForm.addressForm.countryIso eq 'FR'}">selected = "selected"</c:if>>France</option>
		            </select>
		            <em class="fa fa-chevron-down"></em>
		            <!-- <input class="form-item" type="text" value="Hong kong SAR"> -->
		        </div>
		        <div class="form">
		            <label class="form-label">Address line one</label>
		            <input class="form-item" name="addressForm.line1" type="text" value="${placeOrderForm.addressForm.line1}">
		        </div>
		        <div class="form">
		            <label class="form-label">Address line two (optional)</label>
		            <input class="form-item" name="addressForm.line2" type="text" value="${placeOrderForm.addressForm.line2}">
		        </div>
		        <div class="form">
		            <label class="form-label">City / Town / Suburb</label>
		            <input class="form-item" name="addressForm.townCity" type="text" value="${placeOrderForm.addressForm.townCity}">
		        </div>
		        <div class="form-special">
		            <div class="form" style="width:295px;">
		                <label class="form-label">State / Province / Territory </label>
		                <input class="form-item" name="addressForm.regionIso" type="text" value="${placeOrderForm.addressForm.regionIso}">
		            </div>
		            <div class="form" style="width:295px;margin-left:30px;">
		                <label class="form-label">Postal / Zip code</label>
		                <input class="form-item" name="addressForm.postcode" type="text" value="${placeOrderForm.addressForm.postcode}">
		            </div>
		        </div>
		        <div class="note">
		            <input type="checkbox" class="deliver-address-checkbox" id="checkbox" checked>
		            <p class="delivery-days">Express crurier to deliver in 4 working days for Hong Kong address.10 working days for overseas depend on mailing location.</p>
		        </div>
		       
		    </div>
		</div>
	    <div class="delivery-contact">
		    <div class="delivery-contact-intro">
		        <div class="delivery-contact-name">Delivery Contact</div>
		        <div class="delivery-contact-info">Please be advised that your indicated daytime contact number will be used by the respective Partner in contacting you for the delivery arrangement of the redeemed award item(s).</div>
		    </div>
		    <div class="delivery-contact-content">
		        <div class="form">
		            <label class="form-label">Email address</label>
		            <input class="form-item" type="text" name="addressForm.email" value="${placeOrderForm.addressForm.email}">
		        </div>
		        <div class="contact-number-form">
		            <div class="select-contact-number">
		             	<input type="hidden" name="addressForm.phoneAreaCode" value="+852">
		                <img src="/_ui/responsive/assets/img/hongkong.png" alt="hongkong" style="width:40px;height:28px;">
		                <p>+852</p>
		            </div>
		            <div class="form" style="width:460px;">
		                <label class="form-label">Daytime contact number</label>
		                <input class="form-item" name="addressForm.phone" type="text" value="${placeOrderForm.addressForm.phone}">
		            </div>
		        </div>
		    </div>
		</div>
	    <div class="checkout-payment">
		    <div class="checkout-payment-intro">
		        <div class="checkout-payment-name">Payment method</div>
		        <div class="checkout-payment-info">Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. </div>
		    </div>
		    <div class="delivery-contact-content">
		    		<input type="hidden" name="paymentForm.paymentId" value="${placeOrderForm.paymentForm.paymentId}">
		    		<input type="hidden" name="paymentForm.cardTypeCode" value="visa">
		        <div class="form" style="border:none;display:flex;justify-content:center;">
		            <img src="/_ui/responsive/assets/img/payment-method.png" alt="payment-method" class="img-pay-method">
		        </div>
		        <div class="form">
		            <label class="form-label">Name on card</label>
		            <input class="form-item" name="paymentForm.nameOnCard" type="text" value="${placeOrderForm.paymentForm.nameOnCard}">
		        </div>
		        <div class="form">
		            <label class="form-label">Credit card number</label>
		            <input class="form-item" name="paymentForm.cardNumber" type="text" value="${placeOrderForm.paymentForm.cardNumber}">
		        </div>
		        <div class="form-special">
		            <div class="form" style="width:295px;">
		                <label class="form-label">Expiry MM</label>
		                <select class="form-item" name="paymentForm.expiryMonth" id="">
		                    <option value ="01" <c:if test="${placeOrderForm.paymentForm.expiryMonth eq '01'}">selected = "selected"</c:if>>01</option>
		                    <option value ="02" <c:if test="${placeOrderForm.paymentForm.expiryMonth eq '02'}">selected = "selected"</c:if>>02</option>
		                    <option value ="03" <c:if test="${placeOrderForm.paymentForm.expiryMonth eq '03'}">selected = "selected"</c:if>>03</option>
		                    <option value ="04" <c:if test="${placeOrderForm.paymentForm.expiryMonth eq '04'}">selected = "selected"</c:if>>04</option>
		                    <option value ="05" <c:if test="${placeOrderForm.paymentForm.expiryMonth eq '05'}">selected = "selected"</c:if>>05</option>
		                    <option value ="06" <c:if test="${placeOrderForm.paymentForm.expiryMonth eq '06'}">selected = "selected"</c:if>>06</option>
		                    <option value ="07" <c:if test="${placeOrderForm.paymentForm.expiryMonth eq '07'}">selected = "selected"</c:if>>07</option>
		                    <option value ="08" <c:if test="${placeOrderForm.paymentForm.expiryMonth eq '08'}">selected = "selected"</c:if>>08</option>
		                    <option value ="09" <c:if test="${placeOrderForm.paymentForm.expiryMonth eq '09'}">selected = "selected"</c:if>>09</option>
		                    <option value ="10" <c:if test="${placeOrderForm.paymentForm.expiryMonth eq '10'}">selected = "selected"</c:if>>10</option>
		                    <option value ="11" <c:if test="${placeOrderForm.paymentForm.expiryMonth eq '11'}">selected = "selected"</c:if>>11</option>
		                    <option value ="12" <c:if test="${placeOrderForm.paymentForm.expiryMonth eq '12'}">selected = "selected"</c:if>>12</option>
		                </select>
		                <em class="fa fa-chevron-down"></em>
		                <!-- <input class="form-item" type="text" value="03"> -->
		            </div>
		            <div class="form" style="width:295px;margin-left:30px;">
		                <label class="form-label">Expiry YY</label>
		                <select class="form-item" name="paymentForm.expiryYear" id="">
		                    <option value ="18" <c:if test="${placeOrderForm.paymentForm.expiryYear eq '18'}">selected = "selected"</c:if>>18</option>
		                    <option value ="19" <c:if test="${placeOrderForm.paymentForm.expiryYear eq '19'}">selected = "selected"</c:if>>19</option>
		                    <option value ="20" <c:if test="${placeOrderForm.paymentForm.expiryYear eq '20'}">selected = "selected"</c:if>>20</option>
		                    <option value ="21" <c:if test="${placeOrderForm.paymentForm.expiryYear eq '21'}">selected = "selected"</c:if>>21</option>
		                    <option value ="22" <c:if test="${placeOrderForm.paymentForm.expiryYear eq '22'}">selected = "selected"</c:if>>22</option>
		                    <option value ="23" <c:if test="${placeOrderForm.paymentForm.expiryYear eq '23'}">selected = "selected"</c:if>>23</option>
		                    <option value ="24" <c:if test="${placeOrderForm.paymentForm.expiryYear eq '24'}">selected = "selected"</c:if>>24</option>
		                </select>
		                <em class="fa fa-chevron-down"></em>
		                <!-- <input class="form-item" type="text" value="22"> -->
		            </div>
		        </div>
		        <div class="form-special">
		            <div class="form" style="width:295px;">
		                <label class="form-label">Security code</label>
		                <input class="form-item" name="paymentForm.cvNumber" type="text" value="">
		            </div>
		        </div>
		    </div>
		</div>
	 
	    <div class="checkout-items">
		    <div class="checkout-container">
		        <h3>Redeem items</h3>
		        <div class="items-list">
		        		<c:forEach var="entry" items="${cartData.entries}">
		        			<div class="redeem-item">
			                <div class="item-pic">
			                    <product:productPrimaryImage product="${entry.product}" format="thumbnail"/>
			                </div>
			                <div class="item-detail">
			                    <div class="item-name">
			                        <span>${fn:escapeXml(entry.product.name)}</span>
			                    </div>
			                    <div class="item-type">
			                    		<c:if test="${not empty entry.product.baseOptions}">
										<c:forEach var="productOption" items="${entry.product.baseOptions}">
											<c:if test="${productOption.variantType eq 'AMLSeatVariantProduct'}">
												<c:forEach var="selectedOption" items="${productOption.selected.variantOptionQualifiers}">
													<c:choose>
														<c:when test="${selectedOption.qualifier eq 'seat'}">
															<c:set var="seatVariantValue" value="${selectedOption.value}" />
														</c:when>
														<c:when test="${selectedOption.qualifier eq 'time'}">
															<c:set var="timeVariantValue" value="${selectedOption.value}" />
														</c:when>
													</c:choose>
												</c:forEach>
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${not empty timeVariantValue or not empty seatVariantValue}">
										<c:if test="${not empty timeVariantValue}">
											<span class="detail">Time: <strong>${timeVariantValue}</strong></span> 
										</c:if>
										<c:if test="${not empty seatVariantValue}">
											<span class="detail">Seat: <strong>${seatVariantValue}</strong></span> 
										</c:if>
									</c:if>
									<div>
			                            <span>Avaliable Country: <strong>Hong Kong</strong></span>
			                        </div>
			                        <c:set var="seatVariantValue" value="" />
								    <c:set var="timeVariantValue" value="" />
			                    </div>
			                </div>
			                <div class="item-info">
			                	    <c:if test="${not empty entry.product.productType}">
				                    <div class="black-bg">
				                        <span class="delivery"><spring:theme code="asiamiles.cart.item.product.productType.${entry.product.productType}"/></span>
				                    </div>
			                    </c:if>
			                    <div class="miles">
			                        <img src="/_ui/responsive/assets/svg/logo.svg" alt="">
			                        <span><fmt:formatNumber value="${entry.totalPrice.value}" maxFractionDigits="3"/></span>
			                    </div>
			                    <div class="cash">
			                        <em class="fa fa-plus"></em>
			                        <span class="currency"><spring:theme code="asiamiles.currency.display.${entry.totalPriceCash.currencyIso}"/></span>
			                        <span><fmt:formatNumber value="${entry.totalPriceCash.value}" maxFractionDigits="3"/></span>
			                    </div>
			                </div>
			            </div>
		        		</c:forEach>
		        </div>
		        <!-- <div class="express">
		            <span>Express cruier</span>
		            <div class="express-miles">
		                <img src="/_ui/responsive/assets/svg/logo.svg" alt="">
		                <span>5,000</span>
		            </div>
		        </div> -->
		        <div class="redemption-total">
		            <div class="c-one">
		                <h3>Redemption total</h3>
		            </div>
		            <div class="c-two">
		                <span>Miles total</span>
		            </div>
		            <div class="c-three">
		                <div class="miles">
		                    <img src="/_ui/responsive/assets/svg/logo.svg" alt="">
		                    <span><fmt:formatNumber value="${cartData.totalPrice.value}" maxFractionDigits="3"/></span>
		                </div>
		                <div class="cash">
		                    <em class="fa fa-plus"></em>
		                    <span class="currency"><spring:theme code="asiamiles.currency.display.${cartData.totalPriceCash.currencyIso}"/></span>
		                    <span><fmt:formatNumber value="${cartData.totalPriceCash.value}" maxFractionDigits="3"/></span>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	    <div class="checkout-check">
		    <div class="check-container">
		        <div class="check-btn">
		            <button type='submit'>Confirm & redeem</button>
		        </div>
		    </div>
		</div>
	</form:form>
    <footer:asiamilesFooter/>
  </body>
</html>
