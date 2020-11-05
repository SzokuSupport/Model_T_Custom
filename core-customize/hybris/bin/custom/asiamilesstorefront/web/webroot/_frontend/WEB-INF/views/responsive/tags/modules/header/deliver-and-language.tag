        <div class="deliver-language J-deliverLanguage">
            <div class="deliver-tabs">
                <div class="radio-group J-radioBox select" data-language="en" tabindex="1">
                    <input type="radio" class="ui-radio" id="language-en" name="radiobutton" checked>
                    <label for="language-en" class="field-label">English</label>
                </div>
                <div class="radio-group J-radioBox" data-language="zh" tabindex="1">
                    <input type="radio" class="ui-radio" id="language-zh" name="radiobutton">
                    <label for="language-zh" class="field-label">繁體中文</label>
                </div>
                <div class="radio-group J-radioBox" data-language="cn" tabindex="1">
                    <input type="radio" class="ui-radio" id="language-cn" name="radiobutton">
                    <label for="language-cn" class="field-label">简体中文</label>
                </div>
                <div class="radio-group J-radioBox" data-language="ja" tabindex="1">
                    <input type="radio" class="ui-radio" id="language-ja" name="radiobutton">
                    <label for="language-ja" class="field-label">日本語</label>
                </div>
                <div class="radio-group J-radioBox" data-language="ko" tabindex="1">
                    <input type="radio" class="ui-radio" id="language-ko" name="radiobutton">
                    <label for="language-ko" class="field-label">한국어</label>
                </div>
            </div>
            <!-- dropdown list content -->
            <div class="deliver-content J-deliverContent select">
                <h2 class="headline language"><span class="text font-SemiBold">Choose your language</span></h2>
                <h2 class="headline"><span class="text font-SemiBold">Delivery & payment currency</span></h2>
                <div class="dropdown-group">
                    <span class="dropdown-selected J-selectTrigger" aria-hidden="false" tabindex="0">
                        <span class="dropdown-selected-text">Hong Kong (HKD)</span>
                        <input type="hidden" class="J-curcode">
                        <svg class="icon-dropdown">
                            <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown"></use>
                        </svg>
                    </span>
                    <!-- desktop dropdown -->
                    <div class="dropdown-selected-control J-selectedControl">
                        <ul class="listbox" role="listbox" aria-expanded="true">
                            <li class="option selected" role="option" data-deliver="hong-kong1">
                                <a class="link" href="javascript:;">Hong Kong (HKD)</a>
                            </li>
                            <li class="option" role="option" data-deliver="hong-kong-sar1">
                                <a class="link" href="javascript:;">Hong Kong SAR (HKD)</a>
                            </li>
                            <li class="option" role="option" data-deliver="china1">
                                <a class="link" href="javascript:;">China - Mainland (USD)</a>
                            </li>
                            <li class="option" role="option" data-deliver="macao1">
                                <a class="link" href="javascript:;">Macao SAR (USD)</a>
                            </li>
                            <li class="option" role="option" data-deliver="taiwan1">
                                <a class="link" href="javascript:;">Taiwan regions (USD)</a>
                            </li>
                        </ul>
                    </div>
                    <!-- /desktop dropdown -->
                </div>
                <a href="javascript:;" class="button-yellow font-SemiBold J-apply-button">Apply</a>
            </div>
            <!-- /dropdown list content -->
            <select class="J-selectedControlMobile" style="display:none"></select>
        </div>