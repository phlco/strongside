var Paint = Paint || {} ;

  var colors = ["facade","FFEABB","D3CEAA","B3F5D6","BBDAFF"]
  var currentColor = 'c'+ "NoColor"
  var selectedColor = 'c'+"NoColor"
  colorNum = colors.length


Paint.generateTiles = function(numRows, numCols, width, height){

  for(var row=0; row<numRows; row++){
    $row = $('<div/>').addClass('row')
    $('body').append($row)
    for(var col=0; col<numCols; col++){
      var $tile = $('<div/>')
      .addClass("tile")
      .attr('priorColor',currentColor)
      .css("width", width)
      .css("height", width);
      Paint.addEventListeners($tile);
      $row.append($tile);
    }
  }
}


Paint.generateSwatches = function(){
  $swatches = $('<div/>').addClass('swatches')
  $('body').append($swatches)
  for(var i=0; i<colorNum; i++){
      var element = colors[i];
      var index = i
      var $color = $('<div/>').addClass('color');
      $color.addClass('c'+element);
      $color.attr('id',index)
      Paint.addColorEventListeners($color);
      $swatches.append($color);
    }
}

Paint.addColorEventListeners=function($color){
  $color.on("click",function(){
      selectedColor = 'c'+colors[$color.attr("id")]
    });
}

Paint.addEventListeners = function($tile){
  $tile.on("mouseout", function(){
    $tile.removeClass('h'+selectedColor);
  });

  $tile.on("click", function(){
    $tile.addClass(selectedColor);
  });

  $tile.on("mousemove", function(e){
    var priorColor = $tile.attr('priorColor')
    $tile.addClass('h'+selectedColor);
    $tile.attr('priorColor','h'+selectedColor);
    var left_mouse_button = 1;
    if(e.which == left_mouse_button){
      $tile.addClass(selectedColor);
    };
  })
}