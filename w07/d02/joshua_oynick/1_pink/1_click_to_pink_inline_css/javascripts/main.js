// Use JQuery so that when you click on "Click Me", it will make the page have a pink background. Use JQuery's .css method to do this first which changes it's inline style.

$( document ).ready(function() {
  $('h1').on("click", function() {
    $("body").css("background-color", "pink"); // NOTE: These are inline styles
  });
});
