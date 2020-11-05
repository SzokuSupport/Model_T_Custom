import '../../plugins/jQuery.nstSlider'
import formatPrice from '../../utils/formatPrice'

export default function mileSlider() {
  $('.leftGrip').attr('tabindex', '0'),
  $('.rightGrip').attr('tabindex', '0'),
  $('.nstSlider').nstSlider({
    'left_grip_selector': '.leftGrip',
    'right_grip_selector': '.rightGrip',
    'value_bar_selector': '.bar',
    'crossable_handles': false,
    'user_mouseup_callback': function (vmin, vmax) {
      let leftValue = Math.round(vmin / 1000) * 1000,
        rightValue = Math.round(vmax / 1000) * 1000,
        minValue = formatPrice(leftValue, 'none'),
        maxValue = formatPrice(rightValue, 'none');
      $(this).attr('event_value', `${minValue}-${maxValue}`)
    },
    'value_changed_callback': function (cause, leftValue, rightValue) {
      leftValue = Math.round(leftValue / 1000) * 1000;
      rightValue = Math.round(rightValue / 1000) * 1000;
      

      // Rewrite the aria value
      var $leftGrip = $(this).find('.leftGrip');
      var $rightGrip = $(this).find('.rightGrip');
      $leftGrip.attr('aria-valuenow', `${leftValue}`);
      $rightGrip.attr('aria-valuenow', `${rightValue}`);


      let minValue = formatPrice(leftValue, 'none'),
        maxValue = formatPrice(rightValue, 'none');
      $(this).parents().find('.J-curMin')[0].innerHTML = minValue;
      $(this).parents().find('.J-curMax')[0].innerHTML = maxValue;
    }
  })

  let min = $('.nstSlider').attr('data-range_min'),
    max = $('.nstSlider').attr('data-range_max');

  if (min === max) {
    $('.nstSlider > .bar').css('width', '100%');
    $('.nstSlider > .rightGrip').css('left', '100%')
  }
}