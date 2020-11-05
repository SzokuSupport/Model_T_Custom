/**
 * campaign page terms & conditions and redeem
 */

export default function campaignDropList(){

    $('.J-campaign-drop').on('click', function (e) {
        e.preventDefault();
        let $this = $(this)
        if ($this.hasClass("selected")) {
          $this.removeClass("selected")
          $this.siblings(".J-drop-detail").slideUp()
        } else {
          $('.J-campaign-drop').removeClass("selected")
          $(".J-drop-detail").slideUp()
          $this.addClass("selected")
          $this.siblings(".J-drop-detail").slideDown()
        }  
    });
}

/**
 * end campaign page terms & conditions and redeem
 */