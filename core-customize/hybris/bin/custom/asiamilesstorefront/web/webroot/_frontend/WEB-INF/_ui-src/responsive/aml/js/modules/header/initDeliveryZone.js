export default function initDeliveryZone() {
  let currentLanguage = $('#curentLanguage').val(),
    radioTabs = $('.J-deliverLanguage').find('.J-radioBox'),
    radioLang,
    selsectTab;

  if (currentLanguage) {
    for (let i = 0; i < radioTabs.length; i++) {
      selsectTab = $(radioTabs[i]);
      radioLang = selsectTab.data('language');
      if (radioLang === currentLanguage) {
        selsectTab.siblings().removeClass('select');
        selsectTab.addClass('select');
        selsectTab.siblings().find('.ui-radio').prop('checked', false);
        selsectTab.find('.ui-radio').prop('checked', true);
      }
    }
  }
}