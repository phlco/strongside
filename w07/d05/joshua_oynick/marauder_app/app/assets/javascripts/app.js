var app = {}

app.createUser = function(e) {
  e.preventDefault();

  var userData = {
    name: $("input[name=name]").val(),
    email: $("input[name=email]").val(),
    lat: app.lat,
    lng: app.lng
    } // user_info
  }

  $.ajax({
    url: "/users",
    type: "post",
    dataType: "json"
    data: { user: userData }
  }).done(function(user){
    //  debugger;
    console.log(user);
    $( "body" ).prepend( "<div id='notice'>Created " + user.name + "<div>");
    $( "#notice" ).fadeOut( "slow" );
  }) //ajax post
} // app.createUser

app.makeMap = function(e) {
  var mapOptions = {
    center: new google.maps.LatLng(app.lat, app.lng),
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  app.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
}

app.flash = function(user) {
  $('#notice').text("created " + user.email);
  $('#notice').fadeIn().delay(2000).fadeout();
}

app.addMarker = function(e) {
  var myLatlng = new google.maps.LatLng(app.lat, app.lng);

  var marker = new google.maps.Marker({
    position: myLatlng,
    title:"Hello World!"
  });

  marker.setMap(app.map);
}


$( document ).ready(function() {
  navigator.geolocation.getCurrentPosition(function(position){
      app.lat = position.coords.latitude;
      app.lng = position.coords.longitude;
      app.makeMap();
    });
  $("form").on("submit", app.createUser);
  $("#drop-pin").on("click", app.addMarker);
}); // ready


// When a user inputs their name and email into the form and clicks submit, have a method called app.createUser that uses $.ajax() to create a new user in your database. Send back the new user as json.

// In #notice display "Created USERNAME" then fade out.
