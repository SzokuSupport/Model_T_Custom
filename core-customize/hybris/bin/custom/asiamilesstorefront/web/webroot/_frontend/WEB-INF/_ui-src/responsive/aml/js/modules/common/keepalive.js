export default function keepalive() {
  let url = $('#keepaliveUrl').length === 1 ? $('#keepaliveUrl').val() : null;
  if (url) {
    $.ajax({
      async: true,
      type: 'GET',
      url: url,
      xhrFields: {
        withCredentials: true
      },
      crossDomain: true,
      contentType: 'application/json',
      success: function () { }
    });
  }
  document.querySelector('body').addEventListener('touchend', function (e) {
    if (e.target.tagName !== 'input') {
      document.querySelector('input').blur();
    }
  });
}