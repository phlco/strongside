var app = app || {}


$(document).ready(function() {
  app.eventListeners()
  navigator.geolocation.getCurrentPosition(function(position){
    app.lat = position.coords.latitude;
    app.lng = position.coords.longitude;
    app.makeMap();
  });
});


app.eventListeners = function() {
  $("#submit").on("click", app.createUser);
};

app.createUser = function() {
  var name = $('#name')[0].value;
  var email = $('#email')[0].value;
  newUser = {user: {name: name, email: email, lat: app.lat, lng: app.lng}};
    $.ajax({
      type:"POST",
      url: "/users.json",
      data: newUser
    }).done(app.displayNotice); //new user posts but there's an internal server error 500
  }

app.displayNotice = function() {
  $("#notice").text("Created User")
  app.addMarker()
}

app.makeMap = function() {

  var mapOptions = {
    center: new google.maps.LatLng(app.lat, app.lng),
    zoom: 16,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    styles: [{stylers:[{hue:'#E4F3FF'},{saturation:300}]},{featureType:'road',elementType:'geometry',stylers:[{lightness:80},{visibility:'simplified'}]},{featureType:'road',elementType:'labels',stylers:[{visibility:'off'}]}]
  };
  app.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  app.addMarker()
}

app.addMarker = function () {
    var myLatlng = new google.maps.LatLng(app.lat, app.lng);

    var marker = new google.maps.Marker({
      position: myLatlng,
      title:"Hello World!"
    });
    marker.setMap(app.map);
  }



