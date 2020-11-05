<div class="dropdown-group__checkOut J-appellation-title">
    <label for="selectedTitle" class="dropdown-label">Title</label>
    <a class="dropdown-selected J-selectTrigger" aria-hidden="false" tabindex="0">
        <span class="dropdown-selected-text J-code"></span>
        <input class="J-select-input"  name="selectedTitle" type="hidden" id="selectedTitle" />
        <svg class="icon-dropdown">
        <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-dropdown"></use>
        </svg>
    </a>
    <!-- desktop dropdown -->
    <div class="dropdown-selected-control J-selectedControl">
    <ul class="listbox" role="listbox" aria-expanded="true" >
    <button class="option" role="option" data="miss">
    <a class="link"><span class="J-code-title">Miss</span></a>
    </button>
    <button class="option" role="option" data="ms">
    <a class="link"><span class="J-code-title">Ms</span></a>
    </button>
    <button class="option" role="option" data="dr">
    <a class="link"><span class="J-code-title">Dr.</span></a>
    </button>
    <button class="option selected" role="option" data="mr">
    <a class="link"><span class="J-code-title">Mr</span></a>
    </button>
    <button class="option" role="option" data="mrs">
    <a class="link"><span class="J-code-title">Mrs</span></a>
    </button>
    <button class="option" role="option" data="master">
    <a class="link"><span class="J-code-title">Master</span></a>
    </button>
    <button class="option" role="option" data="prof">
    <a class="link"><span class="J-code-title">Prof.</span></a>
    </button>
    </ul>
    </div>
    <!-- /desktop dropdown -->
    <!-- mobile dropdown -->
    <select class="dropdown-selected-control--mobile J-appellationSelectMobile" placeholder="称谓">
    <option class="option" value="miss">Miss</option>
    <option class="option" value="ms">Ms</option>
    <option class="option" value="dr">Dr.</option>
    <option class="option" selected="selected" value="mr">Mr</option>
    <option class="option" value="mrs">Mrs</option>
    <option class="option" value="master">Master</option>
    <option class="option" value="prof">Prof.</option>

    </select>
    <!-- /mobile dropdown -->
    <div class="errorBox J-error-box">
        <div class="errorMes">
            <svg class="icon-warning">
                <use xlink:href="/_ui/responsive/aml/img/sprite.svg#icon-warning" />
            </svg>
            <span class="J-error-back">Please select your title</span>
        </div>
    </div>
</div>