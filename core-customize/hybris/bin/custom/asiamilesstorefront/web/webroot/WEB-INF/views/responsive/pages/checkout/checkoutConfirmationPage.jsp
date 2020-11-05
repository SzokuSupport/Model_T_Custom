<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/responsive/common/header"%>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Asia Miles iRedeem</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="/_ui/responsive/assets/css/common.css">
    <link rel="stylesheet" href="/_ui/responsive/assets/css/jquery-ui.min.css">  
  </head>
  <body>
  <header:asiamilesHeader/>
    <div class="order-summary">
    <!-- order confirmation page left side graphic -->
<div class="confirm-side">
    <div class="confirm-pic">
        <img src="/_ui/responsive/assets/svg/confirm-pic.svg" alt="">
    </div>
    <div class="notice">
        <h3>Order has been placed!</h3>
        <p>Thanks for shopping at iRedeem.<br>
            Your current Asiamiles balance is: </p>
            <!-- order total -->
        <div class="order-total">
            <img src="/_ui/responsive/assets/svg/logo.svg" alt="">
            <span class="side-miles"><fmt:formatNumber value="${accountBalance}" maxFractionDigits="3"/></span>
        </div>
    </div>
</div>
    <div class="confirm-info">
    <div class="confirm-info-header">
        <p>A confirmation email will be sent to your email <strong>${deliveryAddress.email}</strong>.<br>
            For any enquiry, please call +852 2747 3838 or +800 938038</p>
        <h1>Order summary</h1>
        <hr>
    </div>
    <div class="confirm-info-content">
        <div class="confirm-section">
            <p class="c-title">Order No.</p>
            <p class="c-information">${orderCode}</p>
        </div>
        <div class="confirm-section">
            <p class="c-title">Delivery Address</p>
            <p class="c-information">${deliveryAddress.firstName}</p>
            <p class="c-information">
                <c:if test="${not empty deliveryAddress.line1}">${deliveryAddress.line1},<br></c:if>
                <c:if test="${not empty deliveryAddress.line2}">${deliveryAddress.line2},<br></c:if>
                ${deliveryAddress.town}<br>
                ${deliveryAddress.country.name}
            </p>
        </div>
        <div class="confirm-section">
            <p class="c-title">Delivery Contact</p>
            <p class="c-information">${deliveryAddress.phoneAreaCode}&nbsp${deliveryAddress.phone}</p>
        </div>
    </div>
    <div class="redeem-section">
        <div class="items-list">
        		<c:forEach var="entry" items="${orderData.entries}">
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
			            <div class="black-bg">
			                <span class="delivery"><spring:theme code="asiamiles.cart.item.product.productType.${entry.product.productType}"/></span>
			            </div>
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
        <div class="redemption-total">
            <div class="c-one">
                <h3>Payment via</h3>
                <img src="/_ui/responsive/assets/img/confirm-payment-method.png" style="width: 100px; margin: 15px 0;" alt="">
            </div>
            <div class="c-two">
                <span>Redemption total</span>
            </div>
            <div class="c-three">
                <div class="miles">
                    <img src="/_ui/responsive/assets/svg/logo.svg" alt="">
                    <span><fmt:formatNumber value="${orderData.totalPrice.value}" maxFractionDigits="3"/></span>
                </div>
                <div class="cash">
                    <em class="fa fa-plus"></em>
                    <span class="currency"><spring:theme code="asiamiles.currency.display.${orderData.totalPriceCash.currencyIso}"/></span>
                    <span><fmt:formatNumber value="${orderData.totalPriceCash.value}" maxFractionDigits="3"/></span>
                </div>
            </div>
        </div>
        <div class="checkout-check" style="margin-bottom: 0;">
            <div class="confirm-contatiner">
                <div class="check-btn">
                    <a href="/"><button style="width:300px;background:#fff;border:1px solid #bec0c3;color:#000;">Back to home</button></a>
                    <button style="width:300px;margin-left:30px;">Print</button>
                </div>
            </div>
        </div>
    </div>
    
    <div class="box my-promise">
    <div class="title">
        <span>Our promises</span>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 item">
                <div class="img-box">
                    <!-- <svg class="icon promise-img">
                        <use xlink:href="/_ui/responsive/assets/svg/promise-secure.svg"/>
                    </svg> -->
                    <img src="/_ui/responsive/assets/svg/promise-secure.svg" class="promise-img" alt="Secure Transaction">
                </div>
                <div class="descript">
                    <span class="subtitle">Secure Transaction</span>
                    <p class="detail">Redemption now requires an SMS one-time password (OTP)</p>
                </div>
            </div>
            <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 item">
                <div class="img-box">
                    <!-- <svg class="icon promise-img">
                        <use xlink:href="/_ui/responsive/assets/svg/promise-delivery.svg"/>
                    </svg> -->
                    <img src="/_ui/responsive/assets/svg/promise-delivery.svg" class="promise-img" alt="Free Delivery">
                </div>
                <div class="descript">
                    <span class="subtitle">Free Delivery</span>
                    <p class="detail">Miles shown include delivery</p>
                </div>
            </div>
            <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 item">
                <div class="img-box">
                    <!-- <svg class="icon promise-img">
                        <use xlink:href="/_ui/responsive/assets/svg/promise-selection.svg"/>
                    </svg> -->
                    <img src="/_ui/responsive/assets/svg/promise-selection.svg" class="promise-img" alt="Best Selection">
                </div>
                <div class="descript">
                    <span class="subtitle">Best Selection</span>
                    <p class="detail">We aim to select the best deal for your rewarded life</p>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
  <footer:asiamilesFooter/> 
  </body>
</html>