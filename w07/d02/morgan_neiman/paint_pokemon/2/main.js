    var drawColor;

    var layer = new Kinetic.Layer();

    var tileY = 200;
    var tileX = 0;
    var maxX = 1200;
    var maxY = 700;
    var down = false;
    var images;
    var pikachuIMG;
    var pikachu;
    var layer2 = new Kinetic.Layer();

    $( document ).mousedown(function() {
      down = true;
    }).mouseup(function() {
      down = false;
    });

    $( document ).keydown(function(e) {
      switch(e.keyCode) {
        case 37: // left
        console.log("left");
        // console.log("left")
        pikachu.move(-5, 0);
        layer2.draw();
        // layer2.add(pikachu);
        break;

        case 38: // up
        console.log("up");
        pikachu.move(0, -5);
        layer2.draw();
        break;

        case 39: // right
        console.log("right");
        pikachu.move(5, 0);
        layer2.draw();
        break;

        case 40: // down
        console.log("down");
        pikachu.move(0, 5);
        layer2.draw();
        break;

        default: return; // exit this handler for other keys
      }
      e.preventDefault();
    });

    var swatchArray = ['fence_1', 'fence_2', 'fence_3', 'fence_4', 'fence_5', 'fence_6', 'fence_7', 'fence_8', 'fence_9', 'mountain_1', 'mountain_2', 'mountain_3', 'mountain_4', 'mountain_5', 'mountain_6', 'mountain_7', 'mountain_8', 'mountain_9'];

    $( document ).ready(function() {


      var stage = new Kinetic.Stage({
        container: 'container',
        width: 1200,
        height: 900
      });

      loadImages(sources, function() {

      });
      drawColor = images.terrain;
      generateTiles();

      var colorXCounter = 20;
      for(var i = 0; i < swatchArray.length; i++) {
        var newColor = new Kinetic.Rect({
          x: colorXCounter,
          y: 20,
          fillPatternImage: images[swatchArray[i]],
          fillPatternScale: [2, 2],
          fillPatternRepeat: 'no-repeat',
          width: 30,
          height: 30,
          stroke: 'none',
          strokeWidth: 0
        });
        // var setColor = swatchArray[i];
        newColor.on('click', function(){
          iGetFill.apply(this);
        });
        layer.add(newColor);
        colorXCounter += 35;

      }



      stage.add(layer);


      pikachuIMG = new Image();
      pikachuIMG.onload = function() {
        pikachu = new Kinetic.Image({
          x: 200,
          y: 200,
          image: pikachuIMG,
          width: 100,
          height: 100,
          draggable: true
        });
        // pikachu.keypress(function(e){
        //   if(e.keyCode === 40) {
        //     this.move(10, 0);
        //   }
        // });
    layer2.add(pikachu);
    pikachu.draw();
  };

  pikachuIMG.src = 'images/sprites/pikachu_down.png';


  stage.add(layer2);
  stage.draw();
});




    function generateTiles() {
      for(var yCoord = tileY; yCoord < maxY; yCoord += 30){
        for(var xCoord = tileX; xCoord < maxX; xCoord += 30){
          var tile = new Kinetic.Rect({
            x: xCoord,
            y: yCoord,
            width: 30,
            height: 30,
            fillPatternImage: images.terrain,
            fillPatternScale: [2, 2],
            fillPatternRepeat: 'no-repeat',
            stroke: 'none',
            strokeWidth: 0
          });
          tile.on('mouseover touchstart', function() {
            if(down){
              this.setFillPatternImage(drawColor);
              layer.draw();
              this.off('mouseout touchend');
              this.off('mouseover touchstart');
            }
          });
          // tile.on('mouseout touchend', function() {
          //   // debugger;
          //   this.setFillPatternImage(images.terrain);
          //   layer.draw();
          // });
    tile.on('mousedown', function() {
      this.setFillPatternImage(drawColor);
      layer.draw();
      this.off('mouseout touchend');
    })
    layer.add(tile);
  }
}
}

function iGetFill() {
  drawColor = this.getFillPatternImage();
}


function loadImages(sources, callback) {
  images = {};
  var loadedImages = 0;
  var numImages = 0;
        // get num of sources
        for(var src in sources) {
          numImages++;
        }
        for(var src in sources) {
          images[src] = new Image();
          images[src].onload = function() {
            if(++loadedImages >= numImages) {
              callback(images);
            }
          };
          images[src].src = sources[src];
        }
      }
      var sources = {
        terrain: 'images/terrain/grass.png',
        fence_1: 'images/obstructions/fence_1.png',
        fence_2: 'images/obstructions/fence_2.png',
        fence_3: 'images/obstructions/fence_3.png',
        fence_4: 'images/obstructions/fence_4.png',
        fence_5: 'images/obstructions/fence_5.png',
        fence_6: 'images/obstructions/fence_6.png',
        fence_7: 'images/obstructions/fence_7.png',
        fence_8: 'images/obstructions/fence_8.png',
        fence_9: 'images/obstructions/fence_9.png',
        mountain_1: 'images/obstructions/mountain_1.png',
        mountain_2: 'images/obstructions/mountain_2.png',
        mountain_3: 'images/obstructions/mountain_3.png',
        mountain_4: 'images/obstructions/mountain_4.png',
        mountain_5: 'images/obstructions/mountain_5.png',
        mountain_6: 'images/obstructions/mountain_6.png',
        mountain_7: 'images/obstructions/mountain_7.png',
        mountain_8: 'images/obstructions/mountain_8.png',
        mountain_9: 'images/obstructions/mountain_9.png',
        rock_1: 'images/obstructions/rock_1.png',
        rock_2: 'images/obstructions/rock_2.png'
      };











  // var green = new Kinetic.Rect({
  //   x: 20,
  //   y: 20,
  //   width: 100,
  //   height: 100,
  //   fill: 'green',
  //   stroke: 'none',
  //   strokeWidth: 1
  // });
  // green.on('click', function(){
  //   drawColor = 'green';
  // });
  // layer.add(green);

  // var pink = new Kinetic.Rect({
  //   x: 130,
  //   y: 20,
  //   width: 100,
  //   height: 100,
  //   fill: 'pink',
  //   stroke: 'none',
  //   strokeWidth: 1
  // });

  // pink.on('click', function() {
  //   drawColor = 'pink';
  // });
  // layer.add(pink);

  // var yellow = new Kinetic.Rect({
  //   x: 240,
  //   y: 20,
  //   width: 100,
  //   height: 100,
  //   fill: 'yellow',
  //   stroke: 'none',
  //   strokeWidth: 1
  // });

  // yellow.on('click', function() {
  //   drawColor = 'yellow';
  // });
  // layer.add(yellow);




      // PAINTING WITHOUT TILES
  //   var rectX = 20;
  //   var rectY = 20;
  // // debugger;
  // var box = new Kinetic.Rect({
  //   x: rectX,
  //   y: rectY,
  //   width: 100,
  //   height: 100,
  //   fill: '#00D2FF',
  //   stroke: 'none',
  //   strokeWidth: 4,
  //   draggable: true
  // });

  // box.on('mouseover touchstart', function() {
  //   this.setFill('blue');
  //   layer.draw();
  // });

  // box.on('mouseout touchend', function() {
  //   this.setFill('#00D2FF');
  //   layer.draw();
  // });

  // function newBox(){
  //   var rect = new Kinetic.Rect({
  //     x: rectX,
  //     y: rectY,
  //     width: 100,
  //     height: 100,
  //     fill: '#00D2FF',
  //     stroke: 'none',
  //     strokeWidth: 4,
  //     draggable: true
  //   });

  //   rect.on('mouseover touchstart', function() {
  //     this.setFill('blue');
  //     layer.draw();
  //   });

  //   rect.on('mouseout touchend', function() {
  //     this.setFill('#00D2FF');
  //     layer.draw();
  //   });

  //   layer.add(rect);
  //   rect.on('dragstart', newBox);
  // }

  // box.on('dragstart', newBox);

  // var circle = new Kinetic.Circle({
  //   x: 300,
  //   y: 100,
  //   radius: 10,
  //   fill: 'pink',
  //   stroke: 'none',
  //   strokeWidth: 4,
  //   draggable: true
  // });

  // function newCircle(e) {
  //   var mousePos = stage.getPointerPosition();
  //   var circ = new Kinetic.Circle({
  //     x: mousePos.x,
  //     y: mousePos.y,
  //     radius: 10,
  //     fill: 'pink',
  //     stroke: 'none',
  //     strokeWidth: 4,
  //     draggable: true
  //   });
  //   circ.on('mousedown', drawing);
  //   circ.on('mouseup', endDrawing);
  //   layer.add(circ);
  // }

  // var timer;

  // function drawing() {
  //   timer = setInterval(newCircle, 10);
  // }

  // function endDrawing() {
  //   clearInterval(timer);
  // }

  // circle.on('mousedown', drawing);
  // circle.on('mouseup', endDrawing);

  // layer.add(circle);
  // layer.add(box);

