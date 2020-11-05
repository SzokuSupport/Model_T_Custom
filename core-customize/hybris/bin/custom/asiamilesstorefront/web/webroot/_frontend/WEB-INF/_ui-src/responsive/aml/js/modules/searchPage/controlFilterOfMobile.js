import mileSlider from '../../utils/mileSlider';

export default function controlFilterOfMobile() {
  $(document).on('click', '.J-open-product-filter', function () {
    $('.mobile-filter').slideDown(300);
    mileSlider();
  });

  $(document).on('click', '.J-close-product-filter', function () {
    $('.mobile-filter').slideUp(300);
  })
}