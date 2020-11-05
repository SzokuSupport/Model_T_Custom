<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header-search-replacement-block"></div>
<div class="header-banner">
    <div class="container header-banner-content J-header-banner-content" data-interval=${interval*1000}>
        <c:if test="${not empty messages}">
            <c:forEach var="message" items="${messages}">
                <div>
                    <c:set var="aTarget" value="_self"/>
                    <c:if test="${message.ifOpenANewTag eq true}">
                        <c:set var="aTarget" value="_blank"/>
                    </c:if>
                    <c:choose>
                    <c:when test="${not empty message.url}">
                    <a href="${message.url}" target="${aTarget}">
                        </c:when>
                        <c:otherwise>
                        <a href="javascript:void(0);" target="_self">
                            </c:otherwise>
                            </c:choose>
                            <div class="header-banner-message">
                                <c:choose>
                                    <c:when test="${message.icon eq 'ALERT'}">
                                     <span class="header-banner-message-icon header-banner-message-icon--alert">
                                         <img src="/_ui/responsive/aml/img/header-banner-icon-alert.svg"/>
                                     </span>
                                    </c:when>
                                    <c:otherwise>
                                    <span class="header-banner-message-icon header-banner-message-icon--promotion">
                                        <img src="/_ui/responsive/aml/img/header-banner-icon-promotion.svg"/>
                                    </span>
                                    </c:otherwise>
                                </c:choose>
                                <div class="message-title-wrapper">
                                    <span class="font-bold">${message.messageTitle}</span>
                                </div>
                                <span class="message-details">${message.messageDescription}</span>
                            </div>
                        </a>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>