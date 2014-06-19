var app = {};

$(document).ready(function(){

  navigator.geolocation.getCurrentPosition(function(position){
    app.lat = position.coords.latitude;
    app.lng = position.coords.longitude;
    app.makeMap();
  })

  $("button").on("click", createUser)

  $("#drop-pin").on("click", function(){
    var myLatlng = new google.maps.LatLng(app.lat, app.lng);

    var marker = new google.maps.Marker({
      position: myLatlng,
      title:"Hello World!"
    });

    marker.setMap(app.map);
  })


});

var user = {}
function formGrabber(){
  var $form = $("form");
  var $name = $($form.children()[1]).val();
  var $email =$($form.children()[1]).val();
  return {user: {name: $name, email: $email}};
}

function createUser(e){
  e.preventDefault();
  var userData = formGrabber();
  $.ajax({
    type: "POST",
    url: "/users.json",
    data: userData
  }).done(function(response){
    var $coords =   navigator.geolocation.watchPosition(function(position){
      user.lat = position.coords.latitude;
      user.lng = position.coords.longitude;
      var userCoords = {user: {lat: user.lat, lng: user.lng}}
      $.ajax({
        type: "PUT",
        url: "/users.json",
        data: userCoords
      })
    });
    console.log(response);
    $('form')[0].reset();
    $("#notice").append($("<p>").html("Created "+ response.name).delay(3000).fadeOut(400) )
  })
}

app.makeMap = function(){
  var mapOptions = {
    center: new google.maps.LatLng(app.lat, app.lng),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  app.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
}










