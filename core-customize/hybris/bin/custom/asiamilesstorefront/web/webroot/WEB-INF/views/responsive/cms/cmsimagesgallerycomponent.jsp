<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container gallery">
    <c:if test="${not empty title}">
        <h3 class="font-SemiBold">${title}</h3>
    </c:if>
    <div class="row gallery-row gallery-row--primary">
        <c:if test="${not empty mediaOne}">
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                <a href="${mediaOne.linkUrl}" event_component="gallery" event_value="${mediaOne.description}" event_position="1">
                    <img class="gallery-image--large" src="${mediaOne.url}" title="${mediaOne.description}"/>
                 </a>
            </div>
        </c:if>
    			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 row gallery-row--primary-child-row">
            <c:if test="${not empty mediaTwo}">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-6">
                    <a href="${mediaTwo.linkUrl}" event_component="gallery" event_value="${mediaTwo.description}" event_position="2">
                        <img class="gallery-image--normal" src="${mediaTwo.url}" title="${mediaTwo.description}"/>
                    </a>
                </div>
            </c:if>
            <c:if test="${not empty mediaThree}">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-6">
                    <a href="${mediaThree.linkUrl}" event_component="gallery" event_value="${mediaThree.description}" event_position="3">
                        <img class="gallery-image--normal" src="${mediaThree.url}" title="${mediaThree.description}"/>
                    </a>
                </div>
            </c:if>
        </div>
    </div>

    <div class="row gallery-row gallery-row--secondary">
        <c:if test="${not empty mediaFour}">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <a href="${mediaFour.linkUrl}" event_component="gallery" event_value="${mediaFour.description}" event_position="4">
                    <img class="gallery-image--first" src="${mediaFour.url}" title="${mediaFour.description}"/>
                </a>
            </div>
        </c:if>
        		<c:if test="${not empty mediaFive}">
               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                    <a href="${mediaFive.linkUrl}" event_component="gallery" event_value="${mediaFive.description}" event_position="5">
                       <img class="gallery-image--others" src="${mediaFive.url}" title="${mediaFive.description}"/>
                    </a>
                </div>
            </c:if>
            <c:if test="${not empty mediaSix}">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                    <a href="${mediaSix.linkUrl}" event_component="gallery" event_value="${mediaSix.description}" event_position="6">
                        <img class="gallery-image--others" src="${mediaSix.url}" title="${mediaSix.description}"/>
                    </a>
                </div>
            </c:if>
    </div>

    <div class="row gallery-row gallery-row--secondary">
        <c:if test="${not empty mediaSeven}">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <a href="${mediaSeven.linkUrl}" event_component="gallery" event_value="${mediaSeven.description}" event_position="7">
                    <img class="gallery-image--first" src="${mediaSeven.url}" title="${mediaSeven.description}"/>
                </a>
            </div>
        </c:if>
            <c:if test="${not empty mediaEight}">
       			 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                     <a href="${mediaEight.linkUrl}" event_component="gallery" event_value="${mediaEight.description}" event_position="8">
                         <img class="gallery-image--others" src="${mediaEight.url}" title="${mediaEight.description}"/>
                    </a>
                </div>
            </c:if>
            <c:if test="${not empty mediaNine}">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                    <a href="${mediaNine.linkUrl}" event_component="gallery" event_value="${mediaNine.description}" event_position="9">
                        <img class="gallery-image--others" src="${mediaNine.url}" title="${mediaNine.description}"/>
                    </a>
                </div>
            </c:if>
    </div>
</div>
