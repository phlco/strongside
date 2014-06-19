//01_dynamically_generating_blocks
//Figure out a way to dynamically generate all the tiles using jQuery. How could you do this?
$(document).ready(function() {
  createCubes();
  addEventListeners();
  addColorPalette();
});

function createCubes(){
  // var windowHeight = $( window ).height();
  // var windowWidth = $( window ).width();
  // var windowArea = windowHeight * windowWidth;
  // var cube = $('.cubes')[0];
  // var cubeArea = $(cube).width() * $(cube).height();
  // var cubesPerPage = windowArea / cubeArea;
  var $body = $("body");
                      //#of rows
  for (var row = 0; row < 30; row++) {
    var $row = $("<div>").addClass("row");
    $body.append($row);
                      //#of columns
    for (var col = 0; col < 50; col++) {
      var $cube = $("<div/>")
                    //how big the squares are
        .css("width", 20)
        .css("height", 20)
        .addClass("cubes");

      $row.append($cube);
    }
  }
  //my first version
  // for (var i = 1; i < 265; i++) {
  //   $('#body').append('<div id="cube' + i + '" class="cubes"></div>');
  // }
}

//TODO move into hover and painting functions
function addEventListeners(){
  //hovers
  $(".cubes").mouseover(function() {
    $(this).addClass('hoveredGreen');
  });
  $(".cubes").mouseout(function() {
    $(this).removeClass('hoveredGreen');
  });
  //paints
  function paintCLicked() {
    $(this).addClass('clickedGreen');
  };
  $(".cubes").mousedown(function() {
    $(this).addClass('clickedGreen');
      $(".cubes").on("mouseover", paintCLicked);
  $(".cubes").mouseup(function() {
    $(".cubes").off("mouseover", paintCLicked);
  });
  });
}

function addColorPalette() {
  //var $row = $("<div>").addClass("row");

  // for (var i = 1; i < 265; i++) {
  //   $('#body').append('<div id="cube' + i + '" class="cubes"></div>');
  // }
  //<div class="colors">Choose it</div>

  // for (var col = 0; col < 50; col++) {
  // var $cube = $("<div/>")
  //               //how big the squares are
  //   .css("width", 20)
  //   .css("height", 20)
  //   .addClass("cubes");

  // $row.append($cube);

  var colorArray = ["#ECF0F1", "#2ECC71", "#3498DB", "#F1C40F", "#E74C3C", "#2C3E50"];
  var $colors = $("<div>").addClass("colors");
  for (var i = 0; i < colorArray.length; i++) {
    $colors.append('<div style="background-color:' +colorArray[i]+'" id="palette-' + i + '" class="colorPalette"></div>')
  }
  $('#body').append($colors);

}



