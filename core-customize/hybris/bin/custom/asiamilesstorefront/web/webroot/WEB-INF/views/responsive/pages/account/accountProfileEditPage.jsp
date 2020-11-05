<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/responsive/formElement" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/responsive/common/header"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<spring:htmlEscape defaultHtmlEscape="true" />

<!-- account111 -->

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Asia Miles iRedeem</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="/_ui/responsive/assets/css/jquery-ui.min.css">
    <link rel="stylesheet" href="/_ui/responsive/assets/css/common.css">
    <link rel="stylesheet" href="/_ui/responsive/assets/css/slick.css">
    <link rel="stylesheet" href="/_ui/responsive/assets/css/slick-theme.css">
  </head>
  <body>
 <header:asiamilesHeader/>

<div class="main-header login-wrapper">
    <div class="login-popup fade J-login">
        <div class="popover-login" role="tooltip" id="popover693583">
            <h1 class="tc">Frequent Flyer Login</h1>
            <div class="ql-login-widget ql-login-grey-bg">
                <div class="ql-login-parent-container">
                <div class="ql-login-row">
                    <div class="ql-login-column ql-login-12 ql-login-column-margin-top">
                    <label class="ql-login-widget__label" for="form-member-id-undefined">Membership number</label>
                    <input id="form-member-id-undefined" aria-label="Membership Number" autocomplete="off" class="ql-login-input null"
                        maxlength="14" name="memberId" type="text" v-model="userName">
                    </div>
                </div>
                <div class="ql-login-row">
                    <div class="ql-login-column ql-login-12 ql-login-pin-row">
                    <label class="ql-login-widget__label ql-login-pull-left" for="form-member-pin-undefined">PIN</label>
                    <input id="form-member-pin-undefined" aria-label="PIN Number" autocomplete="off" class="ql-login-input null"
                        maxlength="20" name="memberPin" type="password" v-model="password">
                    </div>
                </div>
                <div class="ql-login-row mt-5">
                    <div class="ql-login-column">
                    <button :disabled="!userName || !password" class="ql-login-submit-button" v-on:click="login">LOG IN</button>
                    </div>
                </div>
                </div>
            </div>
            <img class="close J-close" src="/_ui/responsive/assets/svg/cross.svg" alt="">  
        </div>
        <div class="login-mask"></div>  
    </div>
</div>

    <div class="i-overview-title">
    <h1 class="your-iRedeem-Overvie">Your iRedeem Overview</h1>
    <hr>
</div>
<div class="i-overview-content-wrapper">
    <div class="i-overview-content">
        <div class="basic-info">
            <h3>Membership No.</h3>
            <p class="membership">${customerData.customerId}</p>
            <h3>Account balance</h3>
            <div class="account-balance">
                <img src="/_ui/responsive/assets/svg/logo.svg" alt="logo" style="width:31px;height:38px;margin-top: 3px;">
                <p><fmt:formatNumber value="${customerData.accountBalance}" pattern="#" type="number" /></p>
            </div>
            <div class="manage-profile">
                <a>Manage your profile</a>
                <em class="fa fa-chevron-right i-right"></em>
            </div>
        </div>
        <div class="detail-info">
            <div class="detail-info-title">
                <h2>Recent redemption orders</h2>
                <a href="/my-account/orders">Redemption history</a>
                <em class="fa fa-chevron-right i-right"></em>
            </div>
            <div class="detail-info-intro">
                <p>Select an order below to view details or track the delivery.<br>Please note that order cancellation must be requested within 24 hours of receiving your order</p>
            </div>
            
         <c:set var="status" value="0"></c:set>
 		<c:forEach items="${searchPageData.results}" var="order" varStatus="j">
 		<c:if test="${j.count< 4}">
	 		<div class="order-item">
			    			<a href="#">
			        <div class="info-bar">
			            <div class="order-no">
			                <div class="info-title">Order no.</div>
			                <div class="info-detail">${order.code}</div>
			            </div>
			            <div class="order-date">
			                <div class="info-title">Order date</div>
			                <div class="info-detail"><fmt:formatDate value="${order.placed}" dateStyle="medium" timeStyle="short" type="both"/></div>
			            </div>
			            <div class="order-total">
			                <div class="info-title">Redemption total</div>
			                <div class="info-detail">
			                    <div class="miles">
			                        <img src="/_ui/responsive/assets/svg/logo.svg" alt="">
								<%--<span><fmt:formatNumber value="${order.total.value}" pattern="#" type="number" /></span> --%>
			                        <span><fmt:formatNumber type="number" maxFractionDigits="0" value="${order.total.value}"/></span>
			                    </div>
			                    <div class="cash">
			                        +
			                        <span class="currency">USD</span>
								<%-- <span><fmt:formatNumber value="${order.totalPriceCash.value}" pattern="#" type="number" /></span> --%>
			                        <span> <fmt:formatNumber type="number" maxFractionDigits="0" value="${order.totalPriceCash.value}"/> </span>
			                    </div>
			                </div>
			            </div>
			            <div class="order-status">
			                <div class="info-title">Status</div>
			                <div class="info-detail">${order.statusDisplay}</div>
			            </div>
			        </div>
			        <div class="action-bar">
			            <div class="delivery-img">
			                <img src="/_ui/responsive/assets/svg/delivery.svg" alt="">
			            </div>
			            <div class="goto-detail">
			                <!-- go to order detail page -->
			                <a href="/my-account/order/${order.code}">
			                    <span>Details</span>
			                    <em class="far fa-circle yellow-circle">
			                        <em class="fa fa-chevron-right goto"></em>
			                    </em>
			                </a>
			            </div>
			        </div>
			    </a>
			</div>
 		</c:if>            
		</c:forEach>
        </div>
    </div>
</div>
<div class="clollection">
    <p class="collection-title">Rewards collections for you</p>
    <div class="js-slick">
        <div class="slick-item"><img src="/_ui/responsive/assets/img/carousel-img.jpg" alt="" width="100%"></div>
        <div class="slick-item"><img src="/_ui/responsive/assets/img/carousel-img.jpg" alt="" width="100%"></div>
        <div class="slick-item"><img src="/_ui/responsive/assets/img/carousel-img.jpg" alt="" width="100%"></div>
        <div class="slick-item"><img src="/_ui/responsive/assets/img/carousel-img.jpg" alt="" width="100%"></div>
        <div class="slick-item"><img src="/_ui/responsive/assets/img/carousel-img.jpg" alt="" width="100%"></div>
        <div class="slick-item"><img src="/_ui/responsive/assets/img/carousel-img.jpg" alt="" width="100%"></div>
    </div>
</div>
<div class="viewed">
    <p class="collection-title">Recently viewed</p>
    <div class="products-lists product-grid" style="padding: 0;overflow:hidden;max-width: 1400px;">
       <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 product-item item">
		    <div class="shadow-wrapper">
		        <a class="item-link" :href="`/pages/pdp/index.html?productId=${item.code}&catergoryName=${categoryName}`" tabindex="-1">
		            <div class="img-box">
		                <img class="product-img" src="/_ui/responsive/assets/img/pdp-product.png" alt="">
		            </div>
		            <div class="product-detail">
		                <h3>Lenovo 310</h3>
		                <p class="product-descript" v-html="item.description"></p>
		                <div class="last">
		                    <span class="item-price-current current-price">
		                    <img src="/_ui/responsive/assets/svg/logo.svg"  alt="" style="position: relative;width:20px; top: -3px; left: -3px; display: inline-block;">
		                    10000
		                    </span>
		                    <p class="loc">Hong Kong</p>
		                </div>
		            </div>
		        </a>
		    </div>
		</div>
		        <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 product-item item">
		    <div class="shadow-wrapper">
		        <a class="item-link" :href="`/pages/pdp/index.html?productId=${item.code}&catergoryName=${categoryName}`" tabindex="-1">
		            <div class="img-box">
		                <img class="product-img" src="/_ui/responsive/assets/img/pdp-product.png"  alt="">
		            </div>
		            <div class="product-detail">
		                <h3>Lenovo 310</h3>
		                <p class="product-descript" v-html="item.description"></p>
		                <div class="last">
		                    <span class="item-price-current current-price">
		                    <img src="/_ui/responsive/assets/svg/logo.svg"  alt="" style="position: relative;width:20px; top: -3px; left: -3px; display: inline-block;">
		                    10000
		                    </span>
		                    <p class="loc">Hong Kong</p>
		                </div>
		            </div>
		        </a>
		    </div>
		</div>
		<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 product-item item">
		    <div class="shadow-wrapper">
		        <a class="item-link" :href="`/pages/pdp/index.html?productId=${item.code}&catergoryName=${categoryName}`" tabindex="-1">
		            <div class="img-box">
		                <img class="product-img" src="/_ui/responsive/assets/img/pdp-product.png"  alt="">
		            </div>
		            <div class="product-detail">
		                <h3>Lenovo 310</h3>
		                <p class="product-descript" v-html="item.description"></p>
		                <div class="last">
		                    <span class="item-price-current current-price">
		                    <img src="/_ui/responsive/assets/svg/logo.svg" style="position: relative;width:20px; top: -3px; left: -3px; display: inline-block;" alt="">
		                    10000
		                    </span>
		                    <p class="loc">Hong Kong</p>
		                </div>
		            </div>
		        </a>
		    </div>
		</div>
    </div>
</div>
    <footer class="global-footer">
    <div class="sub-footer">
        <div class="sub-footer-wrapper">
            <div class="foot-container">
                <div class="links-list">
                    <ul class="portal-links">
                        <li>
                            <a href="https://www.asiamiles.com/en/about-asia-miles.html">
                            About Asia Miles</a>
                        </li>
                        <li>
                            <a href="https://www.asiamiles.com/en/partnership-enquiry.html">
                            Partnership opportunities</a>
                        </li>
                        <li>
                            <a href="https://www.asiamiles.com/en/career.html">
                            Careers</a>
                        </li>
                        <li>
                            <a href="https://www.asiamiles.com/en/media-centre.html">
                            Media centre</a>
                        </li>
                        <li>
                            <a href="https://www.asiamiles.com/en/terms-and-conditions.html">
                            Terms and conditions</a>
                        </li>
                        <li>
                            <a href="https://www.asiamiles.com/en/privacy-policy.html">
                            Privacy policy</a>
                        </li>
                        <li>
                            <a href="https://www.asiamiles.com/en/disclaimer.html">
                            Disclaimer</a>
                        </li>
                    </ul>
                    <ul class="no-space follow-links">
                        <li>
                            <a href="https://www.facebook.com/Qantas" aria-label="Link to facebook" title="Facebook" target="_blank">
                                <img src="/_ui/responsive/assets/svg/footer-facebook.svg" alt="">
                                <span class="aria-visible">Facebook</span>
                            </a>
                        </li>
                        <li>
                            <a href="https://instagram.com/Qantas/" aria-label="Link to instagram" title="Instagram" target="_blank">
                                <img src="/_ui/responsive/assets/svg/footer-instagram.svg" alt="">
                                <span class="aria-visible">Instagram</span>
                            </a>
                        </li>
                        <li>
                            <a href="https://twitter.com/Qantas" aria-label="Link to twitter" title="Twitter" target="_blank">
                                <img src="/_ui/responsive/assets/svg/footer-twitter.svg" alt="">
                                <span class="aria-visible">Twitter</span>
                            </a>
                        </li>
                        <li>
                            <a href="http://weibo.com/asiamileslimited" aria-label="Link to weibo" title="Weibo" target="_blank">
                                <img src="/_ui/responsive/assets/svg/footer-weibo.svg" alt="">
                                <span class="aria-visible">Weibo</span>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.asiamiles.com/sc/support/help-centre/contact-us.html#/social-media" aria-label="Link to wechat" title="WeChat" target="_blank">
                                <img src="/_ui/responsive/assets/svg/footer-wechat.svg" alt="">
                                <span class="aria-visible">WeChat</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="copyright">
                    <p>Copyright � Asia Miles is managed and operated by Asia Miles Limited.</p>
                </div>
            </div>
        </div>
    </div>
</footer>
    <script src="/_ui/responsive/assets/js/jquery-ui.min.js"></script>
    <script src="/_ui/responsive/assets/js/slick.min.js"></script>
    <script src="/_ui/responsive/assets/js/common.js"></script>
  </body>