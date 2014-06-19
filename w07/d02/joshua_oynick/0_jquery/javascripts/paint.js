var Paint = Paint || {};

Paint.generateTiles = function(numTiles, width, height) {
  for (var i=0; i<numTiles; i++) {
    var tile = $("<div/>")
      .addClass("tile")
      .css("width", width)
      .css("height", height);

    $("body").append(tile);
  }
}
