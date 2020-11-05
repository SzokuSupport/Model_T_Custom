<!-- <script async="" src="https://www.youtube.com/iframe_api"></script> -->
<% for (var chunk in htmlWebpackPlugin.files.chunks) { %>
    <script src="/_ui/responsive/aml{{htmlWebpackPlugin.files.chunks[chunk].entry}}"></script>
  <% } %>
  <script type="text/javascript" src="https://origin2-am-t2.ncs1.ct1.asiamiles.com/etc.clientlibs/common/clientlibs/cookie-consent.js"></script>
  <!-- <script src="//assets.adobedtm.com/launch-ENc8411a417b5a47018e1fc52879edd3a6.min.js" async></script> -->



