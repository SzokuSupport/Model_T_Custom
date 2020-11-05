<form class="step-one__mySelf" id="mySelf" action="https://www.baidu.com" method="post">
    <input type="hidden" id="emailNeed" value=false />
    <input type="hidden" id="SMSNeed" value=true />
    <input type="hidden" class="validationResult" />
    <div class="step-one__recipient">
        <div class="step-one__recipient--left">
            <span>Recipient's Details</span>
        </div>
        <div class="row step-one__recipient--right">
            <div class="col-lg-12 col-sm-12">
                @require('./appellationTitle.tag')
                <div class="input-component J-input-transform">
                    <input type="text" id="familyName" name="familyName" value="aa" aria-label="Title Combo box collapsed.
                    selected"/>
                    <label class=" placeholder J-input-placeholder" for="familyName">Recipient's family name</label>
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
                    <input type="text" id="givenName" name="givenName" />
                    <label class=" placeholder J-input-placeholder" for="givenName">Recipient’s given name</label>
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
                    <label class=" placeholder J-input-placeholder" for="phone" aria-hidden='true'>Mobile phone no. </label>
                    <input type="text" id="phone" name="recipientPhoneNo"  aria-label="Mobile phone number"/>
                    
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
                    <input type="text" id="country" value="CA" name="country" disabled/>
                    <label class=" placeholder J-input-placeholder" for="country">Country / Region</label>
                </div>
                <div class="input-component J-input-transform">
                    <input type="text" id="companyName" name="companyName" />
                    <label class=" placeholder J-input-placeholder" for="companyName">Company name (optional)</label>
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
                    <input type="text" id="addressLine1" name="enAddress1" />
                    <label class=" placeholder J-input-placeholder" for="addressLine1">Address line 1</label>
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
                    <input type="text" id="addressLine2" name="enAddress2" />
                    <label class=" placeholder J-input-placeholder" for="addressLine2">Address line 2 (optional)</label>
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
                    <input type="text" id="addressLine3" name="enAddress3" />
                    <label class=" placeholder J-input-placeholder" for="addressLine3">Address line 3 (optional)</label>

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
                    <input type="text" id="city" name="enCity" />
                    <label class=" placeholder J-input-placeholder" for="city">City / Town / Suburb</label>
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
                    <input type="text" id="province" name="enState" />
                    <label class=" placeholder J-input-placeholder " for="province">State / Province / Territory (optional)
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
                    <input type="text" id="postal" name="enPostalCode" />
                    <label class=" placeholder J-input-placeholder" for="postal">Postal / Zip code (optional)</label>
                    <div class="errorBox J-error-box">
                        <div class="errorMes">
                            <svg class="icon-warning">
                                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                            </svg>
                            <span class="J-error-back">Sorry, your verification code is incorrect, please try again.</span>
                        </div>
                    </div>
                </div>
                <input type="hidden" class="J-local-flag" value=true />
                <div class="checkbox-group J-toggle-local">
                    <input type="checkbox" id="localLanguage">
                    <label class="check-local" for="localLanguage">I would like to enter my address in local language.
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
                    <input type="text" id="companyNameLocal" name="localCompanyName" />
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
                    <input type="text" id="localAddressLine1" name="localAddress1" />
                    <label class=" placeholder J-input-placeholder" for="localAddressLine1">Address line 1</label>
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
                    <input type="text" id="localAddressLine2" name="localAddress2" />
                    <label class=" placeholder J-input-placeholder" for="localAddressLine2">Address line 2 (optional)
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
                    <input type="text" id="localAddressLine3" name="localAddress3" />
                    <label class=" placeholder J-input-placeholder" for="localAddressLine3">Address line 3 (optional)
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
                    <input type="text" id="localCity" name="localCity" />
                    <label class=" placeholder J-input-placeholder" for="localCity">City / Town / Suburb</label>
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
                    <input type="text" id="localProvince" name="localState" />
                    <label class=" placeholder J-input-placeholder" for="localProvince">State / Province / Territory (optional)
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
                    <input type="text" id="localPostal" name="localPostalCode" />
                    <label class=" placeholder J-input-placeholder" for="localPostal">Postal / Zip code (optional)
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
    <div class="step-one__email J-email-need-self">
        <div class="step-one__email--left">
            <span>Email e-Delivery</span>
        </div>
        <div class="row step-one__email--right">
            <div class="col-lg-12 col-sm-12">
                <div class="input-component J-input-transform">
                    <input type="text" id="email" name="deliveryEmailAddress" />
                    <label class=" placeholder J-input-placeholder" for="email">Recipient’s email address </label>
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
    <div class="step-one__SMS J-SMS-need-self">
        <div class="step-one__SMS--left">
            <span>SMS e-Delivery</span>
        </div>
        <div class="row step-one__SMS--right">
            <div class="col-lg-6 col-sm-6">
                @require('./countryCode.tag')
            </div>
            <div class="col-lg-6 col-sm-6">
                <div class="input-component J-input-transform">
                    <input type="text" id="phones" name="smsDeliveryPhoneNo" />
                    <label class=" placeholder J-input-placeholder" for="phones">Mobile phone no. </label>
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