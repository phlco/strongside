var Paint = Paint || {};

Paint.generateTiles = function(numTiles, width, height) {
  for (var i=0; i<numTiles; i++) {
    var tile = $("<div/>")
      .css("width", width)
      .css("height", height)
      .addClass("tile");

    $("body").append(tile);
  }
}

// Event listeners added below:

Paint.addEventListeners = function() {
  $(".tile").on("mouseover", function(e) {
    var tile = $(e.target);
    tile.addClass("highlighted");
  });

    $(".tile").on("mouseout", function(e) {
    var tile = $(e.target);
    tile.removeClass("highlighted");
  });
}
