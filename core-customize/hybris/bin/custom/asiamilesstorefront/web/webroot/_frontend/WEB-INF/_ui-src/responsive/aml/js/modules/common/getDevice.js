export default function getDevice() {
  window.dataLayer = window.dataLayer || {}
  let agent = navigator.userAgent.toLowerCase();
  let result = {
    device: function () {
      if (/windows/.test(agent)) {
        return 'web';
      } else if (/iphone|ipod/.test(agent) && /mobile/.test(agent)) {
        return 'ios';
      } else if (/ipad/.test(agent) && /mobile/.test(agent)) {
        return 'ios';
      } else if (/android/.test(agent) && /mobile/.test(agent)) {
        return 'android';
      } else if (/linux/.test(agent)) {
        return 'web';
      } else if (/mac/.test(agent)) {
        return 'web';
      } else {
        return 'other';
      }
    }(),
  };
  window.dataLayer.page_environment = result.device;
}
  