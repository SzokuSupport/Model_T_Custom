function accordion(accordionPanel, accordingContent, addClass) {
  $('.J-information').removeClass('overHidden')
  $(accordionPanel).on('click', function (e) {
    e.preventDefault();
    let $this = $(this)
    if ($this.hasClass(addClass)) {
      $this.removeClass(addClass)
      $this.siblings(accordingContent).slideUp()
    } else {
      $(accordionPanel).removeClass(addClass)
      $(accordingContent).slideUp()
      $this.addClass(addClass)
      $this.siblings(accordingContent).slideDown()
    }  
  })
}

export default accordion