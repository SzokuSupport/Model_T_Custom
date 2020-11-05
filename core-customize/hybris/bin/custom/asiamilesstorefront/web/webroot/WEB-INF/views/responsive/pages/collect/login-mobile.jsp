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

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Asia Miles iRedeem</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
  </head>
  <body> 
    <!-- show brands in the bottom of page -->
<div class="collect-mobile">
    <div style="padding:10px;border-bottom:1px solid #e8e8e8;">
        <img src="/_ui/responsive/assets/img/header-logo.png" width="40%" alt="iRedeem">
    </div>
    <div>
        <h3 style="text-align: center;margin-bottom: 40px;margin-top:40px;font-family: open-sans-light;"> Partner Login</h3>
        <form action="/evoucher/collect-login" method="post">
            <input type='text' name='j_username' placeholder="Username" style="display:block;width:80%;margin:0 auto 20px;border:1px solid #d4d5d7;padding:10px 15px;"/>
            <input type='password' name='j_password' placeholder="Password" style="display:block;width:80%;margin:0 auto 40px;border:1px solid #d4d5d7;padding:10px 15px;"/>
            <input type="submit" value="Log in" style="display:block;height:40px;line-height:40px;background-color:#facf04;text-align:center; margin:0 auto; width:80%;border: none;font-family:open-sans-bold;">
        <input type="hidden" name="CSRFToken" value="${ycommerce:encodeJavaScript(CSRFToken.token)}"/>
        </form>
    </div>
</div>   
  </body>
</html>