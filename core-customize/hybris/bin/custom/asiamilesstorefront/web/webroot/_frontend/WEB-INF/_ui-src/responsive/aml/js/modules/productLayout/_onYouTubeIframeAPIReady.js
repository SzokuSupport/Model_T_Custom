/**
 * optimized @30 July, linda.zhu
* level 2
* @description:youtube api ready, ETR-9810
* usage:
* /view/responsive/cms/rotatingimagescomponent
* selector:
* $(".imageWithVideo")
* $that.parents(".section-container")
* */
export default function onYouTubeIframeAPIReady() {
  let player;
  // for(var i=0; i<players.length;i++){
  $('.imageWithVideo').click(function () {
    let $that = $(this);// picture element
    let $video = $that.next();
    let maxH = $that.parents('.section-container').height();
    $video.show();
  
    let imgHeight = $that.height();
    $that.hide();
  
    let videoPlayedID = $that.attr('data-videoPlayedID');
    let videoUrlId = $video.attr('data-videoUrlId');
    player = new YT.Player(videoPlayedID, {
      width: '100%',
      height: '100%',
      videoId: videoUrlId,
      events: {
        'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange
      }
    });
    
    // 4. The API will call this function when the video player is ready.
    function onPlayerReady(event) {
      if (imgHeight > maxH) {
        $that.next('iframe').height(maxH);
      } else {
        $that.next().height(imgHeight);
      }
  
      // event.target.playVideo();
    }
  
  
    function onPlayerStateChange(event) {
  
      if (event.data === YT.PlayerState.ENDED) {
        let currentId = event.target.a.getAttribute('id');
        let htmlFormat = '<div id="' + videoPlayedID + '" data-videourlid="' + videoUrlId + '"></div>';
        $(htmlFormat).appendTo($that.parent('.picture'));
        event.target.destroy();
        $that.show();
        $('#' + currentId).hide();
  
      }
    }
  
  })
}