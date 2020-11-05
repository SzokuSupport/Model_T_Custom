import getProductList from './getProductList'
import isTabEnter from '../../utils/isTabEnter'

function _filterProduct(triggerType, className, flag, Q) {
  $(document).on(triggerType, className, function () {
    let brand,
      page = $('#J-getCurrentPage').val(),
      pageSize = $('#J-getCurrentPageSize').val(),
      // sort = flag ? (Q ? (''): ($('#J-sort').val()) ) : $(this).data("code") ,
      sort = flag ? Q ? '' : $('#J-sort').val() : ($(this).data('code') ? $(this).data('code') : $(this).val()),
      paramsNoText;

    brand = Q ? (flag ? ('') : ($('#J-q').val())) : ($(this).siblings('.J-q').val());
    paramsNoText = {
      page: '0',
      pagesize: pageSize,
      q: brand,
      sort: sort
    };
    getProductList(false, paramsNoText)
    if ($(this).parent().siblings('.J-best-deals').length === 1) {
      let flag = $(this).prop('checked'),
        text = $(this).siblings('.filter-in-plp').text()
      if (flag) {
        // scEvent('filter_best_deal|Best Deals:'+text)
        console.log('filter_best_deal|Best Deals:' + text)
      }

    } else if ($(this).parent().siblings('.J-ways-to-shop').length === 1) {
      let flag = $(this).prop('checked'),
        text = $(this).siblings('.filter-in-plp').text()
      if (flag) {
        // scEvent('filter_ways_to_shop|Ways to Shop:'+text)
        console.log('filter_ways_to_shop|Ways to Shop:' + text)
      }

    }
    if (!flag) {
      // scEvent('sort_by_filter|Sort By:'+$(this).text())
      console.log('sort_by_filter|Sort By:' + $.trim($(this).text()))
    }
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