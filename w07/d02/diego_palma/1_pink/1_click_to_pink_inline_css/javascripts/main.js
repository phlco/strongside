$( document ).ready(function() {

  var colorArray = ["turquioise", "emerald", "peter", "amethyst"];
  var colorIndex = 0;

  $('h1').on("click", function() {

    // Remove the class for the previous color
    var previousColor = colorArray[colorIndex];
    $("body").removeClass();

    // Increment the color index.
    colorIndex++;
    console.log(colorIndex)
    if (colorIndex === colorArray.length) {
      colorIndex = 0;
    }

    // Add the class for the next color
    var nextColor = colorArray[colorIndex];
    $("body").addClass(nextColor);
  });
});


// $( document ).ready(function() {
//   $('h1').on("click", function() {
//     var isPink = $("body").hasClass("pink");
//     if (isPink) {
//        $("body").removeClass('pink');
//     } else {
//       $("body").addClass("pink");
//     }
//   });
// });



