var Paint = Paint || {};

$( document ).ready(function() {
  Paint.generateTiles(1000, 64, 64);
  // NEW, the add event listeners was removed because they should be added when the paint app is generated.
});

