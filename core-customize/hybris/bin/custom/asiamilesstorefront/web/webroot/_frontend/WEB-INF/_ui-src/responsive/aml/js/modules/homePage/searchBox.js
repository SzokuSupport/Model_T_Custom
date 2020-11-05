export default function shareSearchBoxThis() {
  let $searchInput = $('.J-searchInputBox'),
    $closeSearch = $('.J-cancelSearch'),
    $searchOptions = $('.J-searchOptionBox'),
    $optionList = $('.J-optionListBox'),
    $hotToBox = $('.J-hotBox'),
    $placeholder = $searchInput.siblings('.J-placeholder'),
    hotTags = '',
    optionListTags = '',
    tag,
    tagPage,
    language = document.getElementsByTagName( 'html' )[0].getAttribute('lang');

  let viewAll = {
    'en': 'See all results',
    'zh': '查看所有结果',
    'zh_TW': '查看所有結果',
    'ko': '검색 결과 모두 보기',
    'ja': 'すべての検索結果を見る',
  };
  $closeSearch.on('click', function (event) {
    closeSearchBox();
    event.preventDefault();
  });

  //  click search  input get  data
  $searchInput.on('click', function () {
    hotTags = '';
    $hotToBox.empty();
    if ($searchInput[0].value === '') {
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
            $hotToBox.empty();
            $hotToBox[0].innerHTML = hotTags;
          }
        }
      });
      $searchOptions.show();
      $closeSearch.show();
    }
  })

  // monitor input values and reconstruct data after meeting requirements
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
            tag = '<li class="font-regular list-item J-search-item all-results"><a href="' + tagPage + '" event_component="internal_search" event_value="' + viewAll[language] + '">' + viewAll[language] + '</a><a href="' + tagPage + '"><svg class="icon-arrow-right" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><g fill="none" fill-rule="nonzero"><path fill="#272F38" d="M13.51 11.924L9 16.434l1.414 1.415 5.925-5.925L10.414 6 9 7.414z"/><path fill="#FACF00" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zm0 2a9 9 0 1 1 0 18 9 9 0 0 1 0-18z"/></g></svg></a></li>';
            optionListTags += tag;

            $optionList.empty();
            $optionList[0].innerHTML = '<ul>' + optionListTags + '</ul>';
            $optionList.show();
          } else {
            $optionList.hide();
          }
        }
      });
    } else {
      $optionList.hide();
    }
  });

  $(document).mouseup(function (e) {
    if (!$searchInput.is(e.target) && $searchInput.has(e.target).length === 0
      && !$searchOptions.is(e.target) && $searchOptions.has(e.target).length === 0
      && !$optionList.is(e.target) && $optionList.has(e.target).length === 0) {
      closeSearchBox();
    }
  });
  $searchInput.on('input', function () {
    $searchOptions.hide();
    $closeSearch.show();
  });
  function closeSearchBox() {
    $searchInput.val('');
    $searchOptions.hide();
    $optionList.hide();
    $closeSearch.hide();
    $placeholder.show();
  }
}