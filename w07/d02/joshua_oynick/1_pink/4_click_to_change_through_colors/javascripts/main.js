$( document ).ready(function() {

  var backgroundState = 0;
  var colorArray = ["white", "red", "orange", "yellow", "green", "blue"];
  var colorIndex = 0;

  $('h1').on("click", function() {

    // debugger

    // We want to remove the class for the previous color

    var previousColor = colorArray[colorIndex];
    $("body").removeClass(previousColor);

    // increment color index
    colorIndex++;
    console.log(colorIndex);
    if (colorIndex === colorArray.length) {
      colorIndex = 0;
    }

    // add class for next color
    var nextColor = colorArray[colorIndex];
    $("body").addClass(nextColor);
  });

});
