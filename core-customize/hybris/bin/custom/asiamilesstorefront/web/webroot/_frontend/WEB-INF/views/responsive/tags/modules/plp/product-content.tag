<div class="container container-fluid-mobile plp-container-mobile J-plp-main-content">
    <input type="hidden" id="resFlag" value="true" />
  <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-4 mobile-filter J-mobile-filter-disappear">

          @require('../common/mile-slider.tag')
          @require('./product-selector.tag')
      </div>
      <div class="col-lg-9 col-md-9 col-sm-8 product-list-content">
          @require('./product-sort.tag')
          @require('./product-list.tag')
      </div>
  </div>
</div>