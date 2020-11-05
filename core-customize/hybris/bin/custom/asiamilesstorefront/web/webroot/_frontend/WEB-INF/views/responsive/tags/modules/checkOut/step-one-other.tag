<form class="step-one__other" id="other" action="https://www.baidu.com" method="post">
    <input type="hidden" id="emailNeedOther" value=true />
    <input type="hidden" id="SMSNeedOther" value=false />
    <input type="hidden" class="validationResult" />
    <div class="step-one__recipient">
        <div class="step-one__recipient--left">
            <span>Recipient's Details</span>
        </div>
        <div class="row step-one__recipient--right">
            <div class="col-lg-12 col-sm-12">
                @require('./appellationTitle.tag')
            </div>
            <div class="col-lg-12 col-sm-12">
                <div class="input-component J-input-transform">
                    <input type="text" id="familyNameOther" name="familyName" />
                    <label class=" placeholder J-input-placeholder" for="familyNameOther">Recipient's family name
                    </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="givenNameOther" name="givenName" />
                    <label class=" placeholder J-input-placeholder" for="givenNameOther">Recipient’s given name</label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-sm-6">
                @require('./countryCode.tag')
            </div>
            <div class="col-lg-6 col-sm-6">
                <div class="input-component J-input-transform">
                    <input type="text" id="phoneOther" name="recipientPhoneNo"  aria-label="Mobile phone number"/>
                    <label class="placeholder J-input-placeholder" for="phoneOther" aria-hidden='true'>Mobile phone no. </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step-one__addressEnglish">
        <div class="step-one__addressEnglish--left">
            <span>Delivery address
                <span>(English)</span>
            </span>
            <div class="country-message-taiwan">
                <svg class="icon-triangle-important">
                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-triangle-important"></use>
                </svg>
                <div class="message-body">
                    <p class="title">For deliveries to Taiwan China</p>
                    <p class="content">In accordance with the Taiwan Customs Administration import regulation, please ensure to provide recipient's name in English (under "Recipient's Details") as shown on the Taiwan identification card or passport. If recipient's name is a Chinese name, please also complete in Chinese character (under the "Company Name") field.</p>
                </div>
            </div>
        </div>
        <div class="row step-one__addressEnglish--right">
            <div class="col-lg-12 col-sm-12">
                <div class="input-component__disable J-input-transform">
                    <input type="text" id="country" value="GB" name="country" disabled/>
                    <label class=" placeholder J-input-placeholder" for="country">Country / Region</label>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="companyNameOther" name="companyName" />
                    <label class=" placeholder J-input-placeholder" for="companyNameOther">Company name (optional)
                    </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="addressLineOther1" name="enAddress1" />
                    <label class=" placeholder J-input-placeholder" for="addressLineOther1">Address line 1</label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="addressLineOther2" name="enAddress2" />
                    <label class=" placeholder J-input-placeholder" for="addressLineOther2">Address line 2 (optional)
                    </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="addressLineOther3" name="enAddress3" />
                    <label class=" placeholder J-input-placeholder" for="addressLineOther3">Address line 3 (optional)
                    </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="cityOther" name="enCity" />
                    <label class=" placeholder J-input-placeholder" for="cityOther">City / Town / Suburb</label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="provinceOther" name="enState" />
                    <label class=" placeholder J-input-placeholder" for="provinceOther">State / Province / Territory (optional)
                    </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="postalOther" name="enPostalCode" />
                    <label class=" placeholder J-input-placeholder" for="postalOther">Postal / Zip code (optional)
                    </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <input type="hidden" class="J-local-flag" value=false />
                <div class="checkbox-group J-toggle-local">
                    <input type="checkbox" id="localLanguageOther">
                    <label class="check-local" for="localLanguageOther">I would like to enter my address in local language.
                    </label>
                </div>
                <p class="suggest ">To ensure the most accurate domestic delivery, we suggest you to provide delivery address in your
                    <span class="font-bold">official local language.</span>
                </p>
            </div>
        </div>
    </div>
    <div class="step-one__addressLocal J-localLanguage disappear">
        <div class="step-one__addressLocal--left">
            <span>Delivery address
                <span>(Local Language)</span>
            </span>
            <div class="country-message-taiwan">
                <svg class="icon-triangle-important">
                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-triangle-important"></use>
                </svg>
                <div class="message-body">
                    <p class="title">For deliveries to Taiwan China</p>
                    <p class="content">In accordance with the Taiwan Customs Administration import regulation, please ensure to provide recipient's name in English (under "Recipient's Details") as shown on the Taiwan identification card or passport. If recipient's name is a Chinese name, please also complete in Chinese character (under the "Company Name") field.</p>
                </div>
            </div>
        </div>
        <div class="row step-one__addressLocal--right">
            <div class="col-lg-12 col-sm-12">
                <div class="input-component__disable J-input-transform">
                    <input type="text" id="countryLocal" value="Hong Kong" name="country" disabled/>
                    <label class=" placeholder J-input-placeholder" for="country">Country / Region</label>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="companyNameLocalOther" name="localCompanyName" />
                    <label class=" placeholder J-input-placeholder" for="companyNameOther">Company name (optional)
                    </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="localAddressLineOther1" name="localAddress1" />
                    <label class=" placeholder J-input-placeholder" for="localAddressLineOther1">Address line 1
                    </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="localAddressLineOther2" name="localAddress2" />
                    <label class=" placeholder J-input-placeholder" for="localAddressLineOther2">Address line 2 (optional)
                    </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="localAddressLineOther3" name="localAddress3" />
                    <label class=" placeholder J-input-placeholder" for="localAddressLineOther3">Address line 3 (optional)
                    </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="localCityOther" name="localCity" />
                    <label class=" placeholder J-input-placeholder" for="localCityOther">City / Town / Suburb
                    </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="localProvinceOther" name="localState" />
                    <label class=" placeholder J-input-placeholder" for="localProvinceOther">State / Province / Territory (optional)</label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="localPostalOther" name="localPostalCode" />
                    <label class=" placeholder J-input-placeholder" for="localPostalOther">Postal / Zip code (optional)
                    </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step-one__email J-email-need-other">
        <div class="step-one__email--left">
            <span>Email e-Delivery</span>
        </div>
        <div class="row step-one__email--right">
            <div class="col-lg-12 col-sm-12">
                <div class="input-component J-input-transform">
                    <input type="text" id="emailOther" name="deliveryEmailAddress" />
                    <label class=" placeholder J-input-placeholder" for="emailOther">Recipient’s email address </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="step-one__SMS J-SMS-need-other">
        <div class="step-one__SMS--left">
            <span>SMS e-Delivery</span>
        </div>
        <div class="row step-one__SMS--right">
            <div class="col-lg-6 col-sm-6">
                @require('./countryCode.tag')
            </div>
            <div class="col-lg-6 col-sm-6">
                <div class="input-component J-input-transform">
                    <input type="text" id="phoneOther" name="smsDeliveryPhoneNo" />
                    <label class=" placeholder J-input-placeholder" for="phoneOther">Mobile phone no. </label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @require('../common/order-detail.tag') @require('./step-one-total.tag')
</form>