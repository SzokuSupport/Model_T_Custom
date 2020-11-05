import isSmallScreen from '../../utils/isSmallScreen'
export default function showMore(selector) {
  let boxWidth = selector ? $(selector).find('.more-padding').width() : $('.more-padding').width(),
    $delivery = selector ? $(selector).find('.J-delivery') : $('.J-delivery'),
    $line = selector ? $(selector).find('.J-status-line') : $('.J-status-line'),
    $item = selector ? $(selector).find('.J-status-item') : $('.J-status-item'),
    lineWidth = $line.width() + parseInt($line.css('marginLeft')) + parseInt($line.css('marginRight')),
    itemWidth = $item.width(),
    statusWidth = $line.length * lineWidth + $item.length * itemWidth + parseInt($delivery.css('paddingLeft')) * 2,
    speed = lineWidth + itemWidth,
    maxLeft = statusWidth - boxWidth;

 
  if (isSmallScreen()) {
    if (statusWidth > boxWidth) {
      $delivery.css({width: `${statusWidth}px`});
      $('.J-right-more').show()
    }
  } else {
    $delivery.css({
      width: '100%',
      display: 'flex',
      justifyContent: 'space-between'
    });
    $line.css({
      flex: 1,
    })
  }

  // click load more data
  $('.J-right-more').unbind('click').on('click', function () {
    let that = this,
      $delivery = $(that).parent().find('.J-delivery'),
      $leftArrow = $(that).parent().find('.J-left-more'),
      beforeLeft = parseInt($delivery.css('left')),
      beforeRight = parseInt($delivery.css('right'));
    if (beforeRight < 0) {
      if (beforeRight > -speed) {
        $delivery.animate({
          left: `-${maxLeft}px`,
        }, function () {
          $(that).hide();
          $leftArrow.show()
        })
      } else {
        $delivery.animate({
          left: `${beforeLeft - speed}px`
        }, function () {
          let curLeft = parseInt($delivery.css('left'));
          if (curLeft < 0) {
            $leftArrow.show()
          }
        })
      }

    } else {
      return false
    }
  })

  // click load more data
  $('.J-left-more').unbind('click').on('click', function () {
    let that = this,
      $delivery = $(that).parent().find('.J-delivery'),
      $rightArrow = $(that).parent().find('.J-right-more'),
      beforeLeft = parseInt($delivery.css('left'));

    if (beforeLeft < 0) {
      if (beforeLeft > -speed) {
        $delivery.animate({
          left: '0',
        }, function () {
          $delivery.css('right', '');
          $(that).hide();
          $rightArrow.show()
        })
      } else {
        $delivery.animate({
          left: `${beforeLeft + speed}px`
        }, function () {
          $delivery.css('right', '');
          let curRight = parseInt($delivery.css('right'));
          if (curRight < 0) {
            $rightArrow.show()
          }
        })
      }
    } else {
      return false
    }
  })
}