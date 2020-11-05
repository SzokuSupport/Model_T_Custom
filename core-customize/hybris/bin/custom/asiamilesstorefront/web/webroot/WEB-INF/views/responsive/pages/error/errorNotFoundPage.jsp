<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
    <head>
        <title>404</title>
    </head>
    <body>
         <script type="text/javascript">
         function getRoot() {
        	    var hostname = location.hostname;
        	    var pathname = location.pathname;
        	    var contextPath = pathname.split("/")[1];
        	    var port = location.port;
        	    var protocol = location.protocol;
        	    return protocol + "//" + hostname + ":" + port + "/";
        	}
         window.location.href=getRoot()+'campaign/pagenotfound';
 			</script>
    </body>
</html>
