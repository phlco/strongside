var app = {};

app.createUser = function(e) {
  e.preventDefault();

  var userData = {
    name: $('input[name=name]').val(),
    email: $('input[name=email]').val()
  }

  $.ajax({
    url: "/users",
    type: "post",
    dataType: "json",
    data: { user: userData }
  }).done(function(user){
    app.user = user;
    app.addMarker(user.lat, user.lng);
    app.flash();
    app.track();
  });

}

app.addMarker = function(lat, lng) {
  app.marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lng),
    animation: google.maps.Animation.DROP,
  });
  app.marker.setMap(app.map);
}

app.updateMarker = function(lat, lng) {
  var newLatLng = new google.maps.LatLng(lat, lng);
  app.marker.setPosition(newLatLng);
}

app.makeMap = function() {
  var mapOptions = {
    zoom: 15,
    center: new google.maps.LatLng(app.lat, app.lng),
    mapTypeId: google.maps.MapTypeId.SATELLITE
  };

  app.map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);
}

app.flash = function() {
  $('#notice').text("created " + app.user.email);
  $('#notice').fadeIn().delay(2000).fadeOut();
}

app.track = function() {
  navigator.geolocation.watchPosition(function(position) {
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
    app.updateMarker(lat, lng);
    app.updateUser(lat, lng);
  });
}

app.updateUser = function(lat, lng) {
  $.ajax({
    url: '/users/' + app.user.id,
    type: 'put',
    dataType: "json",
    data: { user: {lat: lat, lng: lng} }
  }).done(function(data){
    console.log('update');
  });
}

app.init = function() {
  navigator.geolocation.getCurrentPosition(function(position){
    app.lat = position.coords.latitude;
    app.lng = position.coords.longitude;
    app.makeMap();
    $('button').on('click', function(){ app.addMarker(app.lat, app.lng) });
  });
  $('form').on("submit", app.createUser);
}

app.followUsers = function() {
  $.ajax({
    type: "get",
    url: "/users",
    dataType: "JSON"
  }).done(function(users){
    $.each(users, function(index, user) {
      app.addMarker(user.lat, user.lng);
    });
  })
}

app.noGood = function(){
  setInterval(app.followUsers, 2000);
}

$(document).ready(app.init);
