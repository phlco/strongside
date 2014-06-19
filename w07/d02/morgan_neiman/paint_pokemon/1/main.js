$( document ).ready(function() {

  var canvas = document.getElementById("canvas");
  var context = canvas.getContext('2d');
  canvas.addEventListener("mousedown", draw);

  function draw(e) {
    var x = e.x;
    var y = e.y;
    context.fillStyle = 'rgba(0, 255, 0, 1';
    context.fillRect(x, y, 50, 50);
  }


});