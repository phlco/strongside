var Paint = Paint || {};

Paint.generateTiles = function(numTiles, width, height) {
  for (var i=0; i<numTiles; i++) {
    var $tile = $("<div/>") // making the tile
      .css("width", width)
      .css("height", height)
      .addClass("tile");

      Paint.addEventListeners($tile) // add event listeners here, passing in $tile

      $("body").append($tile);
  }
}




Paint.addEventListeners = function($tile) {
  $tile.on("mouseover", function(e) {
    $tile.addClass("highlighted");
  });

  $tile.on("mouseout", function(e) {
    $tile.removeClass("highlighted");
  })
}
