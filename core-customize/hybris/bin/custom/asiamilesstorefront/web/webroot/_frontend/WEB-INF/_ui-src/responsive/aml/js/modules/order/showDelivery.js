import isSmallScreen from '../../utils/isSmallScreen';
import isIESvg from '../../utils/isIESvg'
import showMore from './showMore'
import isTabEnter from '../../utils/isTabEnter'

export default function showDelivery() {
  let $rrsRemark = $('.removal-recycling-service-remark');
  
  if ($rrsRemark.length > 0) {
    $rrsRemark.each(function () {
      let that = $(this);
      that.find('a.go-to-contact-details').click(function () {
        let $currentCart = $(that.closest('.order-detail-cart'));
        
        if (!isSmallScreen()) {
          $currentCart.find('.J-selectTab').each(function () {
            if (!$(this).hasClass('selected')) {
              $(this).click();
            }
          });
        } else {
          $currentCart.find('.J-selectTab:first').click();
        }
        
        
        if (!isSmallScreen()) {
          // the slide animation is configured to be 300ms in the lower section of this file
          window.setTimeout(function () {
            // .animate does not work, caused by unknown css issues from unknown element, changed to use window.scrollTo()
            // $('html, body').animate({
            //   scrollTop: $($(that.closest('.order-detail-cart')).find('.deliver-contact-info:first')[0]).offset().top - $('.header').height()
            // }, 500);
            if (!$currentCart.find('.J-information:first').is(':hidden')) {
              window.scrollTo(0, $($currentCart.find('.deliver-contact-info:first')[0]).offset().top - $('.header').height());
            }
          }, 400);
        }
      });
    });
  }

  if (!isSmallScreen()) {
    // init
    $('.J-selectTab').removeClass('selected');
    $('.J-information').slideUp();

    /*  when desktop and tablet, click the arrow icon,
     * tab scroll down and show order delivery info
     */
    $('.J-selectTab').unbind('click').on('click', function (e) {
      e.preventDefault();
      let $this = $(this);
      if ($this.hasClass('selected')) {
        if ($rrsRemark.length > 0) {
          $this.removeClass('selected');
          $this.parent().find('.J-information').slideUp()
        } else {
          $this.removeClass('selected');
          $this.siblings('.J-information').slideUp()
        }

      } else {
        if ($rrsRemark.length > 0) {
          $this.addClass('selected');
          $this.parent().find('.J-information').slideDown();
          showMore()
        } else {
          $('.J-selectTab').removeClass('selected');
          $('.J-information').slideUp();
          $this.addClass('selected');
          $this.siblings('.J-information').slideDown();
          showMore()
        }
      }

    })
  } else {
    // init
    let $overLayout = $('.J-overlayout');
    $('html,body').removeClass('ovfHiden');
    $overLayout.slideUp(300, function () {
      $overLayout.html('')
    });

    /*  when mobile, tab the arrow icon,
     * a popup display with order delivery info
     */
    // function showPopup(){
    //   showMore(".J-overlayout")
    // }
    // popup('.J-selectTab', '.J-close-tooltip',showPopup);
    $('.J-selectTab').on('click', function () {
      let popupHtml = $(this).siblings('.J-information').prop('outerHTML');

      $overLayout.html(popupHtml)
      $overLayout.append("<svg class='icon-close J-close-tooltip'><use xlink:href='/_ui/responsive/aml/img/sprite.svg#icon-close'/></svg>")
      $('html,body').addClass('ovfHiden');
      $overLayout.slideDown(300, function () {
        showMore('.J-overlayout')
      });
      isIESvg()
    });
    $(document).on('click', '.J-close-tooltip', function () {
      $('html,body').removeClass('ovfHiden');
      $overLayout.slideUp(300, function () {
        $overLayout.html('')
      })
    })
  }

  isTabEnter('.J-expandStatus', function () {
    $(this).closest('.J-selectTab').trigger('click')
  })

}
