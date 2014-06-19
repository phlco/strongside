var app = {};

app.createUser = function() {
  var data = {
        user: {
        name: $('#userName').val(),
        email: $('#userEmail').val(),
        latitude: app.latitude,
        longitude: app.longitude
        } //user
      }; // data

  $.ajax({
    type: "post",
    url: "/users.json",
    data: data
  }) //ajax
  .done(function(msg) {
    var userId = $(msg).attr("id");

    console.log(userId);
  }); //done

}; //createUser

app.makeMap = function() {
  var mapOptions = {
    center: new google.maps.LatLng(app.latitude, app.longitude),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }; // mapOptions

  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  app.map = map;
}; // makeMap


app.trackUser = function() {
  navigator.geolocation.getCurrentPosition(function(position){
    app.myPosition = position;
    app.latitude = app.myPosition.coords.latitude;
    app.longitude = app.myPosition.coords.longitude;
    return app;
  });
};

/**
when the document loads, I want my coordinates established
and the map created with those coordinates at its center so I
have a solid visual framework from which to track my subject.

after the map has been set, everytime the drop pin
*/
$(document).ready(function(){
  // all this section does is find coordinates and set the map with the user centered
  navigator.geolocation.getCurrentPosition(function(position){
    app.myPosition = position;
    app.latitude = app.myPosition.coords.latitude;
    app.longitude = app.myPosition.coords.longitude;
    app.makeMap();
  }); //geolocation.getCurrentPosition

  $('#user-button').on("click", app.createUser);
  $('#drop-pin').on("click", function(){
    function dropPins() {
      // I want to abstract as much of the code below as possible, so that I can easily call setInterval(dropPins, 3000)
      navigator.geolocation.watchPosition(function(position){
        app.myPosition = position;
        app.latitude = app.myPosition.coords.latitude;
        app.longitude = app.myPosition.coords.longitude;
      }); //geolocation.watchPosition

      var myLatlng = new google.maps.LatLng(app.latitude,app.longitude);
      var marker = new google.maps.Marker({
        position: myLatlng,
        title:"Your location!"
      });

      marker.setMap(app.map);
      console.log("Travis, you did it, despite your many frustrations on Friday. You are progessing nicely.");
    }

    setInterval(dropPins, 3000);
  }); //on
}); // ready





