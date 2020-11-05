<div class="container step-two">
    <p class="step-two__title">Asia Miles Membership Verification</p>
    <div class="step-two__topWarn J-warning-box">
        <div>
            <svg class="icon-warning">
                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-small-warning" />
            </svg>
            <input type="hidden" id="errorMessage1" value="false" />
            <input type="hidden" id="errorMessage2" value="false" />
            <input type="hidden" id="errorMessage3" value="false" />
            <input type="hidden" id="errorCode" value="true" />
            <p class="J-error-message1">Sorry, you have exceeded the maximum request limites(6) of One-Time Password
                within 24 hours, please try
                agian later or contact Asia Miles Service Center for assistance.</p>
            <p class="J-error-message2">Sorry, you have exceeded the maximum number of failed attempts with 24 hours,
                please try again later or
                contact our Live Chat.</p>
            <p class="J-error-message3">Sorry, you will need to request another one-time password since you have made
                too many failed attempts
                with this one already.</p>
        </div>
    </div>
    <div class="step-two__content">
        <p>The verification code was sent to (+852) 9000 9999.</p>
        <p class="J-count-num">You could request again in <span class="font-SemiBold J-count-down">0</span>.</p>
        <p class="J-count-again">If you cannot receive verification code, request again:</p>
        <div class="step-two__content__sendBtn J-send-btn" data-url="" tabindex="0">
            <div>
                <svg class="icon-sendMes">
                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-sms-black" />
                </svg>
                <span class="font-SemiBold">Resend SMS</span>
            </div>
        </div>
        <div class="step-two__content__sendBtn--disabled J-send-disBtn">
            <div>
                <svg class="icon-sendMes">
                    <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-sms-grey" />
                </svg>
                <span class="font-SemiBold">Resend SMS</span>
            </div>
        </div>
    </div>
    <div class="step-two__submit">
        <div class="step-two__submit--code">
            <div class="input-component J-input-transform">
                <input type="text" id="code" class="J-code" />
                <label class=" placeholder J-input-placeholder" for="code">Verification code</label>
                <div class="errorBox J-error-code">
                    <div class="errorMes">
                        <svg class="icon-warning">
                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
                        </svg>
                        <span class="font-SemiBold">Sorry, your verification code is incorrect, please try again.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="J-verification half" tabindex="0">
            <button class="button-yellow font-SemiBold ">Verify and Place Order</button>
        </div>
        <div class="J-backHome half disappear">
            <button class="button-yellow font-SemiBold">Back to home</button>
        </div>

    </div>
</div>
