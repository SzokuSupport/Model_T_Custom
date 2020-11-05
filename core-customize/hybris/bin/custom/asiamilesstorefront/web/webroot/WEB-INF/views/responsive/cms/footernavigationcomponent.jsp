<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<div class="J-overlayout">
    <footer:first-visit />
</div>
<div class="J-share-bar-overLayout"></div>
<%-- <div class="live-chat-container J-live-chat">
    <div class="live-chat">
        <a href="javascript:$zopim.livechat.window.show()" tabindex='0' class="content">
            <svg class="icon-chat" width="21" height="22" viewBox="0 0 21 22">
                <path fill="#272F38" fill-rule="nonzero" d="M1.82 22c-.98 0-1.54-.413-1.68-1.1-.42-1.1.7-1.787 1.12-2.063.84-.55 1.26-.962 1.4-1.375 0-.274-.14-.55-.42-.962 0 0 0-.137-.14-.137C.7 14.575 0 12.375 0 10.175 0 4.537 4.76 0 10.5 0S21 4.537 21 10.175c0 5.637-4.76 10.175-10.5 10.175-.7 0-1.4-.138-2.1-.275C4.76 21.863 2.1 22 2.1 22h-.28zm2.8-7.012c.7.962.98 2.062.84 3.024 0 .138-.14.413-.14.55.7-.274 1.4-.55 2.24-.962.28-.138.56-.275.84-.138h.14c.56.138 1.26.276 1.96.276 4.2 0 7.7-3.3 7.7-7.425 0-4.126-3.5-7.563-7.7-7.563s-7.7 3.3-7.7 7.425c0 1.65.56 3.3 1.68 4.537 0 .138.14.138.14.276z"/>
            </svg>
            <span>
                <spring:theme code="text.generic.live.chat.button" /></span>
        </a>
    </div>
</div> --%>


<c:if test="${component.visible}">

    <div class="footer-container">
        <div class="footer-inner clearfix">
            <div class="footer-share">
                <c:forEach items="${socialMedias}" var="socialMedia">
                    <c:url var="internalPath" value="${socialMedia.urlLink }" />
                    <a href="${socialMedia.external?socialMedia.urlLink:internalPath }" event_component="social shares" event_value="${socialMedia.iconType}"
                        shareLink="${socialMedia.iconType}" tabindex='0'
                        aria-label="Visit ${socialMedia.name} page of iRedeem- Graphics-Opens in a new window.">
                        <img class="footer-share__img" src="${socialMedia.media.url}"
                            alt="Visit ${socialMedia.name} page of iRedeem- Graphics-Opens in a new window." />
                    </a>
                </c:forEach>
            </div>
            <div class="footer-menu">
                <ul class="footer-menu-items clearfix J-footer-menu-items" data-current-country-code="${country}">
                    <c:forEach items="${component.navigationNode.children[0].children}" var="childLevel1">
                    		<c:if test="${not empty childLevel1.entries[0].item }">
                    			<c:set var="nodeItem" value="${childLevel1.entries[0].item}"/>
                    			<c:set var="countryList" value=""/>
                    			<c:forEach items="${nodeItem.countries}" var="activityCountry">
                    				<c:set var="countryList" value="${countryList},${activityCountry.isocode}"/>
                    			</c:forEach>
                    			<c:set var="geoList" value=""/>
                    			<c:forEach items="${nodeItem.geoLocations}" var="geolocation">
                    				<c:set var="geoList" value="${geoList},${geolocation}"/>
                    			</c:forEach>
									<li data-country-list="${countryList}" data-geolocation-list="${geoList}">
									    <span class="vertical-bar">|</span>
									    <a href="${nodeItem.localizedUrl}" tabindex='0'>${nodeItem.linkName}</a>
									</li>
								</c:if>
						  </c:forEach>
                </ul>
                <div class="footer-copyright">
                    <span class="text">${fn:escapeXml(component.notice)}</span>
                    <a href="javascript:;" tabindex='0' aria-label='Visit Asia Miles- Open in a new window'>
                        <img class="footer-copyright__img" src="${firstLogo.url}"
                            alt='Visit Asia Miles- Open in a new window' />
                    </a>
                    <a href="javascript:;" tabindex='0' aria-label='Visit Cathay Pacific- Opens in a new window'>
                        <img class="footer-copyright__img" src="${secondLogo.url}"
                            alt='Visit Cathay Pacific- Opens in a new window' />
                    </a>
                    <a href="javascript:;" tabindex='0' aria-label='Visit Cathay Dragon- Opens in a new window'>
                        <img class="footer-copyright__img" src="${thirdLogo.url}"
                            alt='Visit Cathay Dragon- Opens in a new window' />
                    </a>
                </div>
            </div>
        </div>
    </div>
</c:if>