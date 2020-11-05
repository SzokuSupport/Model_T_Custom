export default function onYouTubeIframeAPIReady() {
  let player;
  let $youTuBeID = $('#J-youTuBe');

  if (!$youTuBeID.length) return

  $youTuBeID.click(function () {
    let $that = $(this);

    let videoPlayedID = $that.attr('data-videoPlayedID');
    let videoUrlId = $that.attr('data-videoUrlId');
    player = new YT.Player(videoPlayedID, {
      width: '100%',
      height: '100%',
      videoId: videoUrlId
    });
  })


}