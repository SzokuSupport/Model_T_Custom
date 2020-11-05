import mileSlider from '../utils/mileSlider';

$(function () {
  mileSlider();
  $(window).on('resize', function () {
    mileSlider();
  })
})