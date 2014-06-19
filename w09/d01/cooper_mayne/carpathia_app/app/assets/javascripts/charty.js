$(document).ready(function() {

  $.ajax({
    url: "/data",
    type: "GET",
    dataType: "json"
  }).done(function(data) {
    drawCanvas(data)
  })

});

Object.values = function (obj) {
  var vals = [];
  for( var key in obj ) {
    if ( obj.hasOwnProperty(key) ) {
      vals.push(obj[key]);
    }
  }
  return vals;
}

var drawCanvas = function(data) {
  var ctx = $("#canvas").get(0).getContext("2d");
  var theValues = Object.values(data)
    var theKeys = Object.keys(data)
    var data = {
      labels :["0","","","","","","","","","","10","","","","","","","","","","20","","","","","","","","","","30","","","","","","","","","","40","","","","","","","","","","50","","","","","","","","","","60","","","","","","","","","","60","","","","","","","","","","70","","","","","","","","","","80","","","","","","","","",""],
      datasets : [
      {
        fillColor : "rgba(220,220,220,0.5)",
        strokeColor : "rgba(220,220,220,1)",
        data : theValues
      }
      ]
    }

  var options = {
    scaleOverride : true,

    //** Required if scaleOverride is true **
    //Number - The number of steps in a hard coded scale
    scaleSteps : 7,
    //Number - The value jump in the hard coded scale
    scaleStepWidth : 10,
    //Number - The scale starting value
    scaleStartValue : 0,
  };

  new Chart(ctx).Bar(data,options);
};
