import getProductList from './getProductList'
import isTabEnter from '../../utils/isTabEnter'

function _filterProduct(triggerType, className, flag, Q) {
  // flag=false : sort    Q=false:J-sort value
  $(document).on(triggerType, className, function () {
    let brand,
      page = $('#J-getCurrentPage').val(),
      pageSize = $('#J-getCurrentPageSize').val(),
      sort = flag ? Q ? '' : $('#J-sort').val() : ($(this).data('code') ? $(this).data('code') : $(this).val()),
      text = $('#J-text').val(),
      params;

    brand = Q ? ( flag ? ('') : ( $('#J-q').val() ) ) : ( $(this).siblings('.J-q').val() );

    // url params json
    params = {
      page: '0',
      pagesize: pageSize,
      q: brand,
      sort: sort,
      text: text,
    };
    getProductList(false, params)

  })
}

export default function filterProduct() {
  _filterProduct('click', '.J-plpFilter', true, false)
  _filterProduct('click', '.J-plpFilterRadio', true, false)
  _filterProduct('click', '.J-deleteLable', true, false)
  _filterProduct('click', '#J-clearAll', true, true)
  _filterProduct('click', '.J-option', false, true)
  _filterProduct('change', '.J-selectedControlMobile', false, true)
  isTabEnter('.J-plp-checkGroup', function () {
    $(this).find('.J-plpFilter').trigger('click')
  })
  isTabEnter('.J-plp-radioGroup', function () {
    $(this).find('.J-plpFilterRadio').trigger('click')
  })
}