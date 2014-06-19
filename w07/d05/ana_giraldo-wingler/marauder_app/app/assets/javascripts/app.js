var App = {};

$("document").ready(function() {

  // watch position function updates position of
  // existing user. run watchuser after a user is created
  // pass id of created user into watch user position
  // take id and update user by that id

  App.addEventListeners();
  App.makeMap();

  navigator.geolocation.getCurrentPosition(function(position){
    App.lat = position.coords.latitude;
    App.lng = position.coords.longitude;
    App.makeMap();
  });

});

App.watchUser = function(user_id){
  navigator.geolocation.watchPosition(function(position){
    var crd = position.coords;
    var userUpdate = {
      lat: crd.latitude,
      lng: crd.longitude
    };
    $.ajax({
      type: 'PUT',
      url: '/users/' + user_id,
      data: { user: userUpdate },
      dataType: 'json'
    }).done(function(user){
      console.log(user);
      App.dropPin(user.lat, user.lng);
    });
  });
};

App.createUser = function(e){
  e.preventDefault();
  var newUser = {
    name: $("#user_name").val(),
    email: $("#user_email").val(),
    lat: App.lat,
    lng: App.lng
  }
  $.ajax({
    type: 'POST',
    url: '/users',
    dataType: 'json',
    data: { user: newUser }
  }).done(function(user){
    var notice = "Created " + user.name.toUpperCase();
    $("#notice").text(notice);
    $("#notice").fadeOut("slow");
    App.dropPin(user.lat, user.lng);
    App.watchUser(user.id);
  })
  $("#notice").css("display", "inline");
  $("form").trigger("reset");
};

App.makeMap = function() {
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(App.lat, App.lng),
    mapTypeId: google.maps.MapTypeId.TERRAIN,
    styles: [{"featureType":"water","elementType":"geometry","stylers":[{"color":"#193341"}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#2c5a71"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#29768a"},{"lightness":-37}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#406d80"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#406d80"}]},{"elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#3e606f"},{"weight":2},{"gamma":0.84}]},{"elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"administrative","elementType":"geometry","stylers":[{"weight":0.6},{"color":"#1a3541"}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#2c5a71"}]}]
  };
  App.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
};

App.dropPin = function(lat, lng) {
  var myLatlng = new google.maps.LatLng(lat,lng);
  var marker = new google.maps.Marker({
    position: myLatlng,
    title:"Hello World!"
  });
  marker.setMap(App.map);
};

App.addEventListeners = function(){
  $("form").on("submit", App.createUser);
  $("#drop-pin").on("click", App.dropPin);
};