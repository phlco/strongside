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

//Add it so that when you hover over a block, it changes it to green and when you hover away, it changes back.

// NEW, this is where I add the event listeners
Paint.addEventListeners = function() {
  $(".tile").on("mouseover", function(e){
    var tile = $(e.target);
    $(this).addClass("green") // note again, that I am adding a class to change it's display
  });

  $(".tile").on("mouseout", function(e){
    var tile = $(e.target);
    $(this).removeClass("green") // note again, that I am removing the class now to change it's visual display
  });

  //Be able to click a tile so that it persistently stays green.

  $(".tile").on("click", function(e) {
    var tile = $(e.target);
    $(this).addClass("painted");
  });

  $(".tile").on("mousedown", function(e){
    var tile = $(e.target);
    $(this).addClass("painted");
  });
}


