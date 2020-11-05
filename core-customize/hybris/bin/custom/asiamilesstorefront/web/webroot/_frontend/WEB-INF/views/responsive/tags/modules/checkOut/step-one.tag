<div class="container checkoutStep1Page-error-message clearfix">
    <!-- top alert message -->
    <div class="checkoutStep1Page-alert">
        <svg class="icon-triangle-important">
            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-triangle-important"></use>
        </svg>
        <span class="error-text">The award(s) can only be delivered to the country/region shown in the first field. If you would like delivery to another country/region, please return to the <a href="https://lifestyle.asiamiles.com/">Lifestyle Awards homepage</a> and select your desired country/region from the top navigation bar.</span>
    </div>
    <!-- /top alert message -->
</div>

<div class="step-one">
    <div class="step-one__deliver">
        <div class="step-one__deliver--left">
            <span>Where are you delivering to?</span>
        </div>
        <input type="hidden" id="formType" value="self">
        <div class="row step-one__deliver--right">
            <div class="col-sm-12 radio-group">
                <div class="radio-group__item J-radio-item">
                    <div class="select-circle" tabindex="0" aria-label="Where are you delivering to: Myself radio button.">
                        <div></div>
                    </div>
                    <span class="font-SemiBold">Myself</span>
                </div>
                <div class="radio-group__item J-radio-item">
                    <div class="select-circle" tabindex="0" aria-label="Where are you delivering to: Other radio button.">
                        <div></div>
                    </div>
                    <span class="font-SemiBold">Other</span>
                </div>
            </div>
        </div>
    </div>
    @require('./step-one-mySelf.tag')
    @require('./step-one-other.tag')
</div>