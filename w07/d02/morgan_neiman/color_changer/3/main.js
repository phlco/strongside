$( document ).ready(function() {
  var clickMe = document.getElementById("click-me");
  var body = document.body;
  $( clickMe ).click(function() {
    $( body ).toggleClass("pink");
  });

});