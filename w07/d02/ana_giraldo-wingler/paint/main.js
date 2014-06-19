$(document).ready(function(){

  function createPalette(){
    var colors = ['red', 'orange', 'yellow', 'green', 'blue', 'purple'];
    $palette = $("div")
      .addClass("palette");
    for (var i = 0; i < colors.length; i++){
      $swatch = $("div")
        .addClass("swatch")
        .addClass(colors[i]);
      $palette.append($swatch);
    }
    $("body").append($palette);
  };

  function generateTiles(numTiles) {
    var $tileWrapper = $("<div>")
      .addClass("tile-wrapper");
    for (var i=0; i<numTiles; i++) {
      var tile = $("<div>")
      .addClass("tile");
      addEventListeners(tile);
      $tileWrapper.append(tile);
    }
    $("body").append($tileWrapper);
  }

  function addEventListeners(tile){
    tile.on("mousemove", function(e){
      tile.addClass("green");
      if (e.which == 1){
        tile.addClass("paint-green");
      }
    })
    tile.on("mouseout", function(e){
      tile.removeClass("green");
    })
    tile.on("click", function(e){
      tile.addClass("paint-green");
    })
  };

  generateTiles(200);

});