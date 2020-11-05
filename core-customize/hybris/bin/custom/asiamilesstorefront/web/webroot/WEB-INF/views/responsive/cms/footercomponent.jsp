<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer"  %>

<footer>
    <div class="footer-container">
        <div class="footer-inner clearfix">
            <div class="footer-share">
	            <c:forEach items="${socialMedias}" var= "socialMedia">
	            	<a href="javascript:;">
                    <img class="footer-share__img" src="${socialMedia.media.url}" alt="${socialMedia.name}" />
                	</a>
	            </c:forEach>
            </div>
            <div class="footer-menu">
                <ul class="footer-menu-items clearfix">
                     <c:forEach items="${links}" var="link">
	                    <li>
	                        <span class="vertical-bar">|</span>
	                        <a href="${link.localizedUrl}">${link.linkName}</a>
	                    </li>
                    </c:forEach>
                </ul>
                <div class="footer-copyright">
                    <span class="text">${fn:escapeXml(notice)}</span>
                    <a href="javascript:;">
                        <img class="footer-copyright__img" src="${firstLogo.url}" alt="" />
                    </a>
                    <a href="javascript:;">
                        <img class="footer-copyright__img" src="${secondLogo.url}" alt="" />
                    </a>
                    <a href="javascript:;">
                        <img class="footer-copyright__img" src="${thirdLogo.url}" alt="" />
                    </a>
                </div>
            </div>
         
        </div>
    </div>
</footer>