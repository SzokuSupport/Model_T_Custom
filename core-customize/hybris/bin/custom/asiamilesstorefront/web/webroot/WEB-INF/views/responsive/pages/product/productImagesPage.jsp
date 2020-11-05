<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container zoomIn-content J-zoomInContent">
    <div class="row">
        <div class="col-lg-12">
            <svg class="icon-close J-close-tooltip" tabindex="0" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
              <g stroke="none" stroke-width="1" fill-rule="evenodd">
                  <g>
                      <g transform="translate(2.000000, 2.000000)">
                          <path d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                          <path fill-rule="nonzero" d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                          <g>
                              <mask>
                                  <path d="M10,8.79200422 L18.7920042,0 L20,1.20799578 L11.2079958,10 L20,18.7920042 L18.7920042,20 L10,11.2079958 L1.20799578,20 L0,18.7920042 L8.79200422,10 L0,1.20799578 L1.20799578,0 L10,8.79200422 Z"></path>
                              </mask>
                          </g>
                      </g>
                  </g>
              </g>
            </svg>
            <c:if test="${externalRedirect==null}">
            <div class="product-img--ZoomIn">
                <div class="zoomIn-mask J-zoomIn-mask"></div>
                <div class="item-lists J-sliderZoomIn">
                   <c:if test="${not empty vedioUrl && empty vedioType}">
                       <div class="item-list">
                           <iframe height=100% width=100% title="" src="${vedioUrl}" frameborder=0 'allowfullscreen'></iframe>
                       </div>
                   </c:if>
                   <c:if test="${not empty vedioType && empty vedioUrl}">
                       <div class="item-list">
                           <div id="J-youTuBeLarge" class="imageWithVideo--large" data-videoplayedid="J-youTuBeLarge" data-videourlid="${vedioType}"></div>
                       </div>
                   </c:if>
                   <c:forEach items="${galleryImages}" var="container" varStatus="varStatus">
                       <div class="item-list ImgToBg">
                           <img class="item-list__img" src="${fn:escapeXml(container.superZoom.url)}" alt="${fn:escapeXml(container.superZoom.altText)}" />
                       </div>
                   </c:forEach>
                </div>   
            </div>
            </c:if>
            <c:if test="${externalRedirect!=null}">
                <c:if test="${not empty galleryImages}">
                <div class="product-img--ZoomIn">
                    <div class="item-lists J-sliderZoomIn">
                    <c:forEach items="${galleryImages}" var="container" varStatus="varStatus" begin="0" end="0">
                        <div class="item-list ImgToBg">
                            <img class="item-list__img" src="${fn:escapeXml(container.superZoom.url)}" alt="${fn:escapeXml(container.superZoom.altText)}" />
                        </div>
                    </c:forEach>
                    </div>
                </div>
                </c:if>
            </c:if>
        </div>
    </div>
</div>

