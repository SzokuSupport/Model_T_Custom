!function(t){var e={};function r(n){if(e[n])return e[n].exports;var a=e[n]={i:n,l:!1,exports:{}};return t[n].call(a.exports,a,a.exports,r),a.l=!0,a.exports}r.m=t,r.c=e,r.d=function(t,e,n){r.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:n})},r.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},r.t=function(t,e){if(1&e&&(t=r(t)),8&e)return t;if(4&e&&"object"==typeof t&&t&&t.__esModule)return t;var n=Object.create(null);if(r.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var a in t)r.d(n,a,function(e){return t[e]}.bind(null,a));return n},r.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return r.d(e,"a",e),e},r.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},r.p="",r(r.s=0)}([function(t,e,r){"use strict";r.r(e);var n=!1;function a(){for(var t=[],e=0;e<arguments.length;e++)t[e]=arguments[e];n&&console.log.apply(console,t)}function i(t){return ACC.sanitizer.sanitize(t)}var o=function(){function t(e,r,n){this.tenant=this._getTenantId(),this.strategy=e,this.numberToDisplay=n,this.category=this._getCategory(),this.facets=this._getFacets(),this.siteId=this._getSiteId(),this.language=this._getLanguage(),this.productId=this._getProductId(),this.url=this._buildUrl(r),this.consentReference=window.localStorage.getItem(t.CONSENT_REFERENCE)}return t.prototype.getProducts=function(){var t=this.consentReference?{"consent-reference":this.consentReference}:null;return $.ajax({type:"GET",url:this.url,headers:t})},t.prototype._buildUrl=function(t){var e=null;if(!this.strategy||!this.tenant)return null;e=t+"/"+this.tenant+"/strategies/"+this.strategy+"/products";var r="";return this.category&&(r=this._buildQueryString(r,"category="+this.category)),this.facets&&(r=this._buildQueryString(r,"facets="+this.facets)),this.numberToDisplay&&(r=this._buildQueryString(r,"pageSize="+this.numberToDisplay)),this.siteId&&(r=this._buildQueryString(r,"site="+this.siteId)),this.language&&(r=this._buildQueryString(r,"language="+this.language)),this.productId&&(r=this._buildQueryString(r,"products="+this.productId)),r&&(e=e+"?"+r),e},t.prototype._buildQueryString=function(t,e){return t&&(t+="&"),t+e},t.prototype._getTenantId=function(){var t=null;try{t=JSON.parse(ACC.addons.merchandisingaddon.hybrisTenant).properties.hybrisTenant}catch(t){a("JSON parser error",t)}return t},t.prototype._getCategory=function(){var t=null;try{t=JSON.parse(ACC.addons.merchandisingaddon.ItemCategory).properties.ItemCategory}catch(t){a("JSON parser error",t)}return t},t.prototype._getProductId=function(){var t=null;try{t=JSON.parse(ACC.addons.merchandisingaddon.product).properties.product}catch(t){a("JSON parser error",t)}return t},t.prototype._getFacets=function(){var t=null;try{var e=JSON.parse(ACC.addons.merchandisingaddon.ContextFacets);t="",e.properties.ContextFacets.forEach(function(e){e.values.forEach(function(r){t+=e.code+":"+r+":"})})}catch(t){a("JSON parser error",t)}return t},t.prototype._getSiteId=function(){var t=null;try{t=JSON.parse(ACC.addons.merchandisingaddon.siteId).properties.siteId}catch(t){a("JSON parser error",t)}return t},t.prototype._getLanguage=function(){var t=null;try{t=JSON.parse(ACC.addons.merchandisingaddon.language).properties.language}catch(t){a("JSON parser error",t)}return t},t.prototype.setConsentReference=function(e){this.consentReference=e,window.localStorage.setItem(t.CONSENT_REFERENCE,e)},t.CONSENT_REFERENCE="merchandising-consent-reference",t}(),s=function(){var t=function(e,r){return(t=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(t,e){t.__proto__=e}||function(t,e){for(var r in e)e.hasOwnProperty(r)&&(t[r]=e[r])})(e,r)};return function(e,r){function n(){this.constructor=e}t(e,r),e.prototype=null===r?Object.create(r):(n.prototype=r.prototype,new n)}}(),u=function(t,e){this.name=t,this.data=e},l=function(){function t(t){this.data=t}return t.prototype.getData=function(){return this.data},t}(),h=function(t){function e(e,r,n){var a=t.call(this,e)||this;return a.slot=r,a.productId=n,a}return s(e,t),e.prototype.getSlot=function(){return this.slot},e.prototype.getProductId=function(){return this.productId},e}(l),p=function(){function t(){var t=this;this.handleViewEvent=function(e){var r=e.getData(),n=r.items.map(function(t){return t.id}),a={carouselId:r.carouselId,strategyId:r.strategy,productSkus:n,metadata:r.metadata,carouselName:r.name},i=new u("CarouselViewed",a);t.pushEvent(i)},this.handleClickEvent=function(e){var r=e.getData(),n=r.items.filter(function(t){return t.id===e.getProductId()}).map(function(t){return t.thumbnailImage})[0],a={carouselId:r.carouselId,strategyId:r.strategy,slotId:e.getSlot(),sku:e.getProductId(),imageUrl:n,carouselName:r.name,metadata:r.metadata},i=new u("CarouselClicked",a);t.pushEvent(i)},this.pushEvent=function(t){window.Y_TRACKING&&window.Y_TRACKING.eventLayer&&window.Y_TRACKING.eventLayer.push(t)}}return t.prototype.initialize=function(){var t=this;window.addEventListener("cds.merchandising.carouselViewed",function(e){t.handleViewEvent(e.detail)}),window.addEventListener("cds.merchandising.carouselClicked",function(e){t.handleClickEvent(e.detail)})},t}();(function(){function t(t){var e=t.el,r=t.data,n=void 0===r?{}:r;this.metadata="",this.defaultViewportPercentage=80,this.$el=$(e),this.data=n}return t.prototype.render=function(){a("render",this.data),this.$el.html(this.getHtml()).find(".js-merch-carousel").owlCarousel({scrollPerPage:"ALLVISIBLE"===this.data.scroll,navigation:!0,navigationText:["<span class='glyphicon glyphicon-chevron-left'></span>","<span class='glyphicon glyphicon-chevron-right'></span>"],pagination:!1,itemsCustom:[[0,2],[640,4],[1024,5],[1400,7]]}),this.registerIntersectionObserver()},t.prototype.registerIntersectionObserver=function(){var e=this.data.viewportpercentage?this.data.viewportpercentage:this.defaultViewportPercentage,r=new IntersectionObserver(function(e,r){e.filter(function(t){return 0<t.intersectionRatio}).forEach(function(e){var n=new l(window.__merchcarousels[e.target.id].data);t.raiseEvent("cds.merchandising.carouselViewed",n),r.unobserve(document.getElementById(e.target.id))})},{root:null,rootMargin:"0px",threshold:e/100}),n=document.getElementById(this.data.carouselId);r.observe(n)},t.raiseEvent=function(t,e){var r=new CustomEvent(t,{detail:e});window.dispatchEvent(r)},t.onClick=function(e,r,n){var a=window.__merchcarousels[e],i=new h(a.data,n,r);t.raiseEvent("cds.merchandising.carouselClicked",i)},t.prototype.getHtml=function(){var t=this,e=this.data,r=e.backgroundcolour,n=e.textcolour,a="",o="",s="carousel__item--name",c="carousel__item--price";n&&(a='style="color: '+n+'"'),r&&(o='style="background-color: '+r+'"',s+=" merchcarousel_custom-color",c+=" merchcarousel_custom-color");var d=this.data.items.reduce(function(e,r,n){return e+'\n\t\t\t\t\t<div class="carousel__item" onclick="window.__merchcarousels.CarouselComponent.onClick(\''+i(t.data.carouselId)+"', '"+i(r.id)+"', "+(n+1)+')">\n\t\t\t\t\t\t<a href="'+i(r.pageUrl)+'">\n\t\t\t\t\t\t\t<div class="carousel__item--thumb">\n\t\t\t\t\t\t\t\t<img src="'+r.mainImage+'" alt="'+i(r.name)+'" title="'+i(r.name)+'"/>\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\t<div class="'+s+'" '+i(a)+">"+i(r.name)+'</div>\n\t\t\t\t\t\t\t<div class="'+c+'" '+i(a)+">"+i(t.data.currency)+i(r.price)+'</div>\n\t\t\t\t\t\t</a>\n\t\t\t\t\t\t<div id="data-merchandising-product-'+i(r.id)+'" class="data-merchandising-product" '+function(t,e){var r="data-merchandising-product-id="+i(t.id)+" data-merchandising-product-slot="+i(e);if(t.metadata)for(var n in t.metadata){var a=t.metadata[n];r+=" data-merchandising-product-"+i(n)+'="'+i(a)+'"'}return r}(r,n+1)+"></div>\n\t\t\t\t\t</div>\n\t\t\t\t"},"");if(this.metadata+='data-merchandising-carousel-title="'+i(this.data.title)+'" ',this.metadata+='data-merchandising-carousel-name="'+i(this.data.name)+'" ',this.metadata+='data-merchandising-carousel-strategyid="'+i(this.data.strategy)+'" ',this.metadata+='data-merchandising-carousel-id="'+i(this.data.carouselId)+'"',this.metadata+='data-merchandising-carousel-slots="'+i(this.data.items.length)+'"',this.data&&this.data.metadata)for(var u in this.data.metadata){var l=this.data.metadata[u];this.metadata+=" data-merchandising-carousel-"+i(u)+'="'+i(l)+'" '}return'\n\t\t\t\t<div class="carousel__component merchandising-carousel" '+i(o)+'>\n\t\t\t\t\t<div class="carousel__component--headline" '+i(a)+">"+i(this.data.title)+'</div>\n\t\t\t\t\t<div class="carousel__component--carousel js-merch-carousel">'+d+'</div>\n\t\t\t\t\t<div id="data-merchandising-carousel-'+i(this.data.carouselId)+'" class="data-merchandising-carousel" '+this.metadata+"></div>\n\t\t\t\t</div>\n\t\t\t"},t.init=function(){a("init"),(new p).initialize(),Object.keys(window.__merchcarousels||{}).forEach(function(e){var r=window.__merchcarousels[e],n=r.el,i=r.inited;if(r.data,n&&!i){var s=n.dataset,c=s.numbertodisplay,d=s.title,u=s.name,l=s.currency,h=s.strategy,p=s.scroll,g=s.url,f=s.backgroundcolour,m=s.textcolour,v=s.viewportpercentage,y=+c;r.inited=!0;var _=new o(h,g,y);window.addEventListener("profiletag_consentReferenceLoaded",function(t){a("profiletag_consentReferenceLoaded",t),_.setConsentReference(t.detail.consentReference)}),a("inited"),_.getProducts().then(function(r){a("data received",r);var i,o=null;r&&r.products&&(o=0!==y?r.products.slice(0,y):r.products),r&&r.metadata&&(i=r.metadata),a("numbertodisplay",y),a("items",o);var s={scroll:p,items:o,title:d,name:u,currency:l,backgroundcolour:f,textcolour:m,strategy:h,carouselId:e,metadata:i,viewportpercentage:v};o&&o.length&&null!=$.fn.owlCarousel&&(new t({el:n,data:s}).render(),window.__merchcarousels[e].data=s,a("rendered"))})}}),window.__merchcarousels=window.__merchcarousels||{},window.__merchcarousels.CarouselComponent=t},t})().init()}]);