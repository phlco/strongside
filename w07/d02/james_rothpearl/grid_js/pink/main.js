$(function() {

var body = $('body');

var colors = ['pink', 'red', 'orange', 'green'];

var colorCounter = 0;

  $("button").click(function(){
    body.removeClass();

    if (colorCounter < colors.length) {
      body.addClass(colors[colorCounter])
      colorCounter++;
    } else {
      colorCounter = 0;
    }
  });
















});


