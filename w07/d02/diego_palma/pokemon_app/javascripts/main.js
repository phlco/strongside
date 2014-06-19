var Paint = Paint || {};

$( document ).ready(function() {
  Paint.generateTiles(104, 64, 64);
  Paint.addEventListeners(); // NEW, now I am adding event listeners
});
