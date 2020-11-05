import isSmallScreen from '../../utils/isSmallScreen'

export default function livechat() {

  // $zopim(function() {
  //     $zopim.livechat.hideAll();
  // });

  let $livechat = $('.J-live-chat'),
    height = $('footer').height(),
    addHeight = $('.J-add-box').height();
    
  if (isSmallScreen()) {
    $('footer').css('marginBottom', `${addHeight}px`)
    $livechat.css({
      bottom: `${addHeight + 30}px`
    })
  } else {
    $('footer').css('marginBottom', 0)
    $livechat.css({
      bottom: `30px`
    })
  }


  // Display live chat position according to scrollbar position
  $(window).on('scroll', function () {
        
    let scrollTop = $(this).scrollTop(),
      scrollHeight = $(document).height(),
      windowHeight = $(window).outerHeight(true),
      margin = scrollHeight - windowHeight - scrollTop;

    if (isSmallScreen()) {
      if (addHeight) {
        let bottom = addHeight + 30,
          margin = scrollHeight - windowHeight - scrollTop;
        if (margin < (height + addHeight )) {
          bottom = height - margin + bottom;
          $livechat.css({
            bottom: `${bottom}px`
          })
        } else {
          $livechat.css({
            bottom: `${bottom}px`
          })
        }
      } else {
        if (margin < height) {
          let bottom = height - margin + 30;
          $livechat.css({
            bottom: `${bottom}px`
          })
        } else {
          $livechat.css({
            bottom: '30px'
          })
        }
      }
    } else {
      if (margin < height) {
        let bottom = height - margin + 30;
        $livechat.css({
          bottom: `${bottom}px`
        })
      } else {
        $livechat.css({
          bottom: '30px'
        })
      }
    }
  })
}