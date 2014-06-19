$( document ).ready(function() {
  var clickMe = document.getElementById("click-me");
  var body = document.body;
  var colors = ["pink", "white", "green", "blue", "purple"];
  var counter = 5;
  var lastClass;
  $( clickMe ).click(function() {
    $( body ).addClass(colors[counter % 5]);
    $( body ).removeClass(lastClass);
    lastClass = colors[counter % 5];
    counter += 1;
  });

});