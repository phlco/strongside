$(document).ready(function() {

  var map;
  app.makeMap();
  app.bindPin();

  $('form').on('submit', function(e) {
    app.CreateUser();
    e.preventDefault();
  })
})


var app = {}
app.CreateUser = function() {

  $.ajax({
    type: 'POST',
    url: '/users',
    dataType: 'json',
    data: $('form').serialize()
  }).done(function(data) {
    $('#notice').hide();
    $('#notice').text(data.user + ' has been created.');
    $('#notice').fadeIn('slow');
  })
};

app.makeMap = function() {
  var mapOptions = {
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
};

app.bindPin = function() {
  $('#drop-pin').on('click', function() {
    var myLatlng = new google.maps.LatLng(-25.363882,131.044922);

    var marker = new google.maps.Marker({
      position: myLatlng,
        title:"Hello World!"
    });

    marker.setMap(map); 
  })
};

