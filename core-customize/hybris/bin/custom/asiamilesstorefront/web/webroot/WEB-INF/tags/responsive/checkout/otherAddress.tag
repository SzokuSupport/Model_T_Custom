<%@ tag body-content="empty" trimDirectiveWhitespaces="true"
        pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="storepickup"
           tagdir="/WEB-INF/tags/responsive/storepickup" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ attribute name="physicalDeliveryInfo" required="true"
              type="com.asiamiles.core.dto.PhysicalDeliveryInfo" %>
<input type="text" hidden=true name="needPhysicalDelivery" value="${physicalDeliveryInfo.needPhysicalDelivery}"/>
<c:if test="${physicalDeliveryInfo.needPhysicalDelivery}">
    <div class="step-one__addressEnglish">
        <div class="step-one__addressEnglish--left">
			<span><spring:theme code="asiamiles.check.out.stype.nav.delivery.address"/>
				<span>
					<spring:theme code="asiamiles.check.out.stype.nav.delivery.address2"/>
				</span>
			</span>
            <c:if test="${physicalDeliveryInfo.countryCode eq 'TW'}">
                <div class="country-message-taiwan">
                    <svg class="icon-triangle-important">
                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-triangle-important"></use>
                    </svg>
                    <div class="message-body">
                        <p class="title"><spring:theme code="text.checkout.step.one.page.taiwan.delivery.alert.message1"/> </p>
                        <p class="content"><spring:theme code="text.checkout.step.one.page.taiwan.delivery.alert.message2"/></p>
                    </div>
                </div>
            </c:if>
        </div>
        <div class="row step-one__addressEnglish--right">
            <div class="col-lg-12 col-sm-12">
                <div class="input-component__disable J-input-transform">
                    <input type="text" hidden=true value="${physicalDeliveryInfo.countryCode}" name="countryCode"
                           id="country"/>
                    <input type="text" id="regionOther" name="country" value="${physicalDeliveryInfo.country}"
                           readonly/>
                    <label class=" placeholder J-input-placeholder" for="regionOther"><spring:theme
                            code="asiamiles.check.out.stype.nav.country.region"/></label>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="companyNameOther" name="companyName"
                           value="${physicalDeliveryInfo.companyName}"/>
                    <label class=" placeholder J-input-placeholder" for="companyNameOther"><spring:theme
                            code="asiamiles.check.out.stype.nav.company.name"></spring:theme></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                 viewBox="0 0 24 24">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="addressLineOther1" name="enAddress1"
                           value="${physicalDeliveryInfo.enAddress1}"/>
                    <label class=" placeholder J-input-placeholder" for="addressLineOther1"><spring:theme
                            code="asiamiles.check.out.stype.nav.address.1"/></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                 viewBox="0 0 24 24">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="addressLineOther2" name="enAddress2"
                           value="${physicalDeliveryInfo.enAddress2}"/>
                    <label class=" placeholder J-input-placeholder" for="addressLineOther2"><spring:theme
                            code="asiamiles.check.out.stype.nav.address.2"/></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="addressLineOther3" name="enAddress3"
                           value="${physicalDeliveryInfo.enAddress3}"/>
                    <label class=" placeholder J-input-placeholder" for="addressLineOther3"><spring:theme
                            code="asiamiles.check.out.stype.nav.address.3"/></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                 viewBox="0 0 24 24">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="cityOther" name="enCity" value="${physicalDeliveryInfo.enCity}"/>
                    <label class=" placeholder J-input-placeholder" for="cityOther"><spring:theme
                            code="asiamiles.check.out.stype.nav.city.suburb"/></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="provinceOther" name="enState" value="${physicalDeliveryInfo.enState}"/>
                    <label class=" placeholder J-input-placeholder" for="provinceOther"><spring:theme
                            code="asiamiles.check.out.stype.nav.state.province"/></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                 viewBox="0 0 24 24">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="postalOther" name="enPostalCode"
                           value="${physicalDeliveryInfo.enPostalCode}"/>
                    <c:set var="postalLable"><spring:theme
                            code="asiamiles.check.out.stype.nav.portal.zip.code.optinonal"/></c:set>
                    <c:if test="${physicalDeliveryInfo.countryCode eq 'AU' or physicalDeliveryInfo.countryCode eq 'CN' or physicalDeliveryInfo.countryCode eq 'CA' or physicalDeliveryInfo.countryCode eq 'GB' or physicalDeliveryInfo.countryCode eq 'US'}">
                        <c:set var="postalLable"><spring:theme
                                code="asiamiles.check.out.stype.nav.portal.zip.code"/></c:set>
                    </c:if>
                    <label class=" placeholder J-input-placeholder" for="postalOther">${postalLable}</label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                 viewBox="0 0 24 24">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <input type="hidden" class="J-local-flag" value="${physicalDeliveryInfo.localAddressExit}"
                       name="localAddressExit"/>
                <input type="hidden" value="${physicalDeliveryInfo.hasLocalAddress}" name="hasLocalAddress"/>
                <c:if test="${physicalDeliveryInfo.hasLocalAddress}">
                    <input type="hidden" class="J-local-flag" value="${physicalDeliveryInfo.localAddressExit}"
                           name="localAddressExit"/>
                    <div class="checkbox-group J-toggle-local">
                        <input type="checkbox" id="localLanguageOther">
                        <label class="check-local" for="localLanguageOther"><spring:theme
                                code="asiamiles.check.out.stype.nav.select.my.local.language"/></label>
                    </div>
                    <p class="suggest ">
                        <spring:theme code="asiamiles.check.out.stype.nav.use.official.local.language"/>
                        <!-- <span class="font-bold">official local language.</span> -->
                    </p>
                </c:if>
            </div>
        </div>
    </div>
    <div class="step-one__addressLocal J-localLanguage disappear">
        <div class="step-one__addressLocal--left">
            <span><spring:theme code="asiamiles.check.out.stype.nav.delivery.local.address"/></span>
            <c:if test="${physicalDeliveryInfo.countryCode eq 'TW'}">
                <div class="country-message-taiwan">
                    <svg class="icon-triangle-important">
                        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-triangle-important"></use>
                    </svg>
                    <div class="message-body">
                        <p class="title"><spring:theme code="text.checkout.step.one.page.taiwan.delivery.alert.message1"/> </p>
                        <p class="content"><spring:theme code="text.checkout.step.one.page.taiwan.delivery.alert.message2"/></p>
                    </div>
                </div>
            </c:if>
        </div>
        <div class="row step-one__addressLocal--right">
            <div class="col-lg-12 col-sm-12">
                <div class="input-component__disable J-input-transform">
                    <input type="text" id="countryLocal" value="${physicalDeliveryInfo.localCountry}"
                           name="localCountry" readonly/>
                    <label class=" placeholder J-input-placeholder" for="country"><spring:theme
                            code="asiamiles.check.out.stype.nav.country.region"/></label>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="companyNameLocalOther" name="localCompanyName"
                           value="${physicalDeliveryInfo.localCompanyName}"/>
                    <label class="placeholder J-input-placeholder" for="companyNameOther"><spring:theme
                            code="asiamiles.check.out.stype.nav.company.name"/></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                 viewBox="0 0 24 24">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>

                <div class="input-component J-input-transform">
                    <input type="text" id="localAddressLineOther1" name="localAddress1"
                           value="${physicalDeliveryInfo.localAddress1}"/>
                    <label class=" placeholder J-input-placeholder" for="localAddressLineOther1"><spring:theme
                            code="asiamiles.check.out.stype.nav.address.1"/></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                 viewBox="0 0 24 24">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="localAddressLineOther2" name="localAddress2"
                           value="${physicalDeliveryInfo.localAddress2}"/>
                    <label class=" placeholder J-input-placeholder" for="localAddressLineOther2"><spring:theme
                            code="asiamiles.check.out.stype.nav.address.2"/></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="localAddressLineOther3" name="localAddress3"
                           value="${physicalDeliveryInfo.localAddress3}"/>
                    <label class=" placeholder J-input-placeholder" for="localAddressLineOther3"><spring:theme
                            code="asiamiles.check.out.stype.nav.address.3"/></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                 viewBox="0 0 24 24">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="localCityOther" name="localCity" value="${physicalDeliveryInfo.localCity}"/>
                    <label class=" placeholder J-input-placeholder" for="localCityOther"><spring:theme
                            code="asiamiles.check.out.stype.nav.city.suburb"/></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="localProvinceOther" name="localState"
                           value="${physicalDeliveryInfo.localState}"/>
                    <label class=" placeholder J-input-placeholder" for="localProvinceOther"><spring:theme
                            code="asiamiles.check.out.stype.nav.state.province"/></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                 viewBox="0 0 24 24">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="localPostalOther" name="localPostalCode"
                           value="${physicalDeliveryInfo.localPostalCode}"/>
                    <label class=" placeholder J-input-placeholder" for="localPostalOther"><spring:theme
                            code="asiamiles.check.out.stype.nav.portal.zip.code"/></label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                 viewBox="0 0 24 24">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#D0021B"
                                          d="M10.738 3.062l-8.422 15.32c-.777 1.412-.072 2.57 1.585 2.57h16.5c1.661 0 2.368-1.15 1.587-2.57l-8.423-15.32C13.176 2.355 12.665 2 12.15 2c-.51 0-1.023.353-1.413 1.062z"/>
                                    <path fill="#FFF"
                                          d="M11.022 16.828c0-.54.451-.979 1.006-.979a.993.993 0 0 1 1.004.98c0 .54-.45.978-1.004.978a.992.992 0 0 1-1.006-.979zM11 7.115h2v6.691h-2v-6.69z"/>
                                </g>
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>