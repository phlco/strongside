var app = app || {};

$(document).ready(function(){
  $('#form').on('submit', app.createUser);
  navigator.geolocation.getCurrentPosition(function(position){
    app.lat = position.coords.latitude;
    app.lng = position.coords.longitude;
    app.makeMap();
  });
});

app.createUser = function(e) {
  e.preventDefault();
  var url = "/users.json";
  var $name = $('input[name="name"]').val();
  var $email = $('input[name="email"]').val();
  $.ajax({
    type: "POST",
    url: url,
    data: { user: {
      name: $name,
      email: $email,
      lat: app.lat,
      lng: app.lng
    }}
  }).done(displayUser);
};

function displayUser(user) {
  var $div = $('#notice');
  var $message = $('<p>').text(user.name + ' CREATED!');
  $div.append($message);
  $div.fadeOut(2400);
  dropPin();
  clearForm();
  navigator.geolocation.watchPosition(function(position){
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
  });
}


function clearForm(){
  $name = $('input[name="name"]').val("");
  $email = $('input[name="email"]').val("");
}

app.makeMap = function() {
  var mapOptions = {
    center: new google.maps.LatLng(app.lat, app.lng),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

  dropPin = function() {
    var myLatlng = new google.maps.LatLng(app.lat,app.lng);

    var marker = new google.maps.Marker({
      position: myLatlng,
      title:"Hello World!"
    });

    marker.setMap(map);
  };
};


