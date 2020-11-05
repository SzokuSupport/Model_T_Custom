import isSmallScreen from './isSmallScreen';
import isIESvg from './isIESvg'
import isTabEnter from '../utils/isTabEnter'

export default function shareThis() {
  let $showSearch = $('.J-showSearch'),
    $navRight = $('.J-navRight'),
    $searchBox = $('.J-searchBox'),
    $searchInput = $('.J-searchInput'),
    $placeholder = $searchInput.siblings('.J-placeholder'),
    $closeSearch = $('.J-closeSearch'),
    $searchOptions = $('.J-searchOption'),
    $optionList = $('.J-optionList'),
    $headerSearch = $('.header__search'),
    $hotBox = $('.J-headerHotTags'),
    $headerNav = $('.header__nav'),
    $searchIcon = $('.J-search-icon'),
    hotTags = '',
    optionListTags = '',
    tag,
    tagPage,
    language = document.getElementsByTagName( 'html' )[0].getAttribute('lang'),
    viewAll = {
      'en': 'See all results',
      'zh': '查看所有结果',
      'zh_TW': '查看所有結果',
      'ko': '검색 결과 모두 보기',
      'ja': 'すべての検索結果を見る',
    };

  /* click the search icon, show search input box,
  * hide other icons in header bar，
  * and get hottags from backend
  */
  $showSearch.on('click', function () {
    $navRight.hide();
    $.ajax({
      url: '/search/hottags',
      method: 'get',
      dataType: 'json',
      async: true,
      success: function (data) {
        if (data && data.tagName) {
          hotTags = '';
          for (let i = 0; i < data.tagName.length; i++) {
            tagPage = '/search?text=' + data.tagName[i];
            tag = '<a class="font-SemiBold option-item J-search-item" href="' + tagPage + '">' + data.tagName[i] + '</a>';
            hotTags += tag;
          }
          $hotBox.empty();
          $hotBox[0].innerHTML = hotTags;
          isIESvg()
        }
      }
    });
    $headerSearch.show(0, function () {
      $(this).find('.header__search--input').addClass('active')
    });
    setTimeout(function () {
      $searchInput.focus();
      $searchOptions.show();
      $('.header__search--input').addClass('show-text');
      $placeholder.show();
    }, 700);

  })

  /* hide the search input */
  $closeSearch.on('click', function (event) {
    $placeholder.hide();
    closeSearchBox();
    event.preventDefault();
  })
  isTabEnter('.J-closeSearch', function () {
    $(this).trigger('click');
  })

  /* when mobile, click the search input to focus,
  * the search input box scroll up
  */
  $searchInput.on('click', function () {
    $.ajax({
      url: '/search/hottags',
      method: 'get',
      dataType: 'json',
      async: true,
      success: function (data) {
        if (data && data.tagName) {
          hotTags = '';
          for (let i = 0; i < data.tagName.length; i++) {
            tagPage = '/search?text=' + data.tagName[i];
            tag = '<a class="font-SemiBold option-item J-search-item" href="' + tagPage + '">' + data.tagName[i] + '</a>';
            hotTags += tag;
          }
          $hotBox.empty();
          $hotBox[0].innerHTML = hotTags;
          isIESvg()
        }
      }
    });
    if ($searchInput[0].value === '') {
      if (isSmallScreen()) {
        $('body').css({
          'overflow': 'hidden',
          'height': '100%'
        });
        $headerNav.hide()
        $(this).css({
          'box-sizing': 'content-box',
          'padding': '24px 35px 12px',
          'height': '23px',
          'line-height': '23px',
        })
        $searchIcon.css({
          top: '24px',
          left: '0',
          transition: 'all 0.5s',
        })
        $placeholder.css({
          left: '35px',
          top: '24px',
        })
        $searchOptions.css({
          top: '59px',
        })
        $searchBox.removeClass('fixed');
        $searchBox.addClass('active');
        $searchBox.css({
          top: '4px',
          transition: 'all 0.5s'
        });
        $closeSearch.css({
          top: '24px',
        })
        // $placeholder.show();
        $closeSearch.show();
        setTimeout(function () {
          $searchOptions.show()
        }, 500);
        return;
      }
      $searchOptions.show();
    }
  })

  /* fill in the search input box, get option list from back-end */
  $searchInput.on('input propertychange', function () {
    $(this).attr('event_value', $(this).val())
    if ($searchInput[0].value.length) {
      $placeholder.hide();
    } else {
      $placeholder.show();
    }
    if ($searchInput[0].value.length >= $(this).data('options').minCharactersBeforeRequest) {
      optionListTags = '';
      $optionList.empty();
      let url = $(this).data('options').autocompleteUrl + '?term=' + $searchInput[0].value;
      $.ajax({
        url: url,
        method: 'get',
        dataType: 'json',
        async: true,
        success: function (data) {
          if (data && (data.suggestions.length || data.products.length)) {
            optionListTags = '';
            let suggestionsLength = data.suggestions.length > 5 ? 5 : data.suggestions.length;
            let productsLength = data.products.length > 5 ? 5 : data.products.length;
            for (let i = 0; i < suggestionsLength; i++) {
              tagPage = language != '' ? '/' + language + '/' + data.suggestions[i].redirectUrl : '/' + data.suggestions[i].redirectUrl;
              tag = '<li class="font-regular list-item J-search-item"><a href="' + tagPage + '" event_component="internal_search" event_value="' + data.suggestions[i].term + '">' + data.suggestions[i].term + '</a></li>';
              optionListTags += tag;
            }

            for (let j = 0; j < productsLength; j++) {
              tagPage = language != '' ? '/' + language + '/' + data.products[j].url : '/' + data.products[j].url;
              tag = '<li class="font-regular list-item J-search-item"><a href="' + tagPage + '" event_component="internal_search" event_value="' + data.products[j].name + '">' + data.products[j].name + '</a></li>';
              optionListTags += tag;
            }

            tagPage = '/search/?text=' + $searchInput[0].value;
            tag = '<li class="font-regular list-item all-results J-search-item"><a href="' + tagPage + '" event_component="internal_search" event_value="' + viewAll[language] + '">' + viewAll[language] + '</a><a href="' + tagPage + '"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="icon-arrow-right"><g fill="none" fill-rule="nonzero"><path fill="#272F38" d="M13.51 11.924L9 16.434l1.414 1.415 5.925-5.925L10.414 6 9 7.414z"/><path fill="#FACF00" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/></g></svg></a></li>';
            optionListTags += tag;

            $optionList.empty();
            $optionList[0].innerHTML = '<ul>' + optionListTags + '</ul>';
            $optionList.show();
            isIESvg()
          } else {
            $optionList.hide();
          }
        }
      });
    } else {
      $optionList.hide();
    }

    $searchOptions.hide();
    if (isSmallScreen()) {
      $searchBox.addClass('active');
    }
  })

  /* when click other place, hide the search box */
  $(document).mouseup(function (e) {
    if (!$searchInput.is(e.target) && $searchInput.has(e.target).length === 0 &&
      !$searchOptions.is(e.target) && $searchOptions.has(e.target).length === 0 &&
      !$optionList.is(e.target) && $optionList.has(e.target).length === 0) {
      closeSearchBox();
      // $placeholder.hide();
    }
  })

  /* hide search box */
  function closeSearchBox() {
    $searchInput.val('');
    $navRight.show();
    $searchOptions.hide();
    $optionList.hide();
    $('.header__search--input').removeClass('active show-text')

    if (isSmallScreen()) {
      $('body').removeAttr('style');
      $closeSearch.hide();
      $placeholder.show();
      $headerNav.show()
      $searchInput.css({
        'padding': '0 50px',
        'height': '50px',
        'box-sizing': 'border-box',
      })
      $searchIcon.css({
        top: '12px',
        left: '15px',
        transition: 'all 0s'
      })
      $placeholder.css({
        top: '12px',
        left: '49px',
      })
      $searchBox.removeClass('active');
      $searchBox.css({
        top: '68px',
        transition: 'all 0s'
      })
    } else {
      $headerSearch.hide();
    }
  }
}