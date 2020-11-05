<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="<c:url value="/static/oidcsinglesignon-webapp.css"/>" type="text/css"
          media="screen, projection"/>
</head>
<body>
<div class="container">
    <br/>
    <br/>
    <br/>
    <p style="text-align: center">
<%--        <a href="https://127.0.0.1:9002/oidcsinglesignon/oidc/piwiktrackingstorefront/electronics/en/?site=electronics&asm=true">Go To SAP Commerce ASM</a>--%>
        <br/>
        <br/>
        <br/>
<%--        <a href="https://127.0.0.1:9002/oidcsinglesignon/oidc/backoffice">Go To SAP Commerce Backoffice</a>--%>
        <br/>
        <br/>
        <a href="https://127.0.0.1:9002/oidcsinglesignon/oidc/smartedit">Go To Smartedit</a>
    </p>
</div>
</body>
</html>