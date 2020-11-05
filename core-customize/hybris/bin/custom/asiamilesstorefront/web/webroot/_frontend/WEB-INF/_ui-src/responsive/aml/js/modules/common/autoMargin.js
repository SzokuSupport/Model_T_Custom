/*
 *
 * When the content height is not enough, automatically fill the content height
 */
export default function autoMargin(selector) {
  let height = window.innerHeight,
      margin = height - getHeight(selector)

  $('footer').css({
    marginTop: margin > 0? `${margin}px`: ''
  })

  $(window).on('resize', function () {
    let margin = window.innerHeight - getHeight(selector)

    $('footer').css({
      marginTop: margin > 0? `${margin}px`: ''
    })
  })

}

function getHeight(selector) {
  let banners = document.querySelectorAll('product-banner'),
      // searchBar = document.querySelector('.header__search-fixed'),
      checkNavDesktop = document.querySelectorAll('.checkOut-step-nav--desktop'),
      checkNavMobile = document.querySelectorAll('.checkOut-step-nav--mobile'),
      header = document.querySelector('.header'),
      contents = document.querySelectorAll(selector),
      footer = document.querySelector('footer');
    
  let bannerHeight = banners.length > 0? banners[0].offsetHeight: 0,
      // searchBarHeight = searchBar.offsetHeight,
      searchBarHeight = 0,
      checkNavHeight = checkNavDesktop.length === 0
                        ? checkNavMobile.length === 0
                          ? 0
                          : checkNavMobile[0].offsetHeight
                        : checkNavMobile.length === 0
                          ? checkNavDesktop[0].offsetHeight
                          : checkNavDesktop[0].offsetHeight > 0
                            ? checkNavDesktop[0].offsetHeight
                            : checkNavMobile[0].offsetHeight,
      headerHeight = header.offsetHeight,
      mainHeight = contents.length > 0? contents[0].offsetHeight: 0,
      footerHeight = footer.offsetHeight;
      return  headerHeight + footerHeight + mainHeight + bannerHeight + checkNavHeight + searchBarHeight;
}