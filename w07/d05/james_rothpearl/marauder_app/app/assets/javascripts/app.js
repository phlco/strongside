/* making 'app' an object literal helps us tie the functions within that object only */

var app = {};



app.createUser = function() {
  var nameInput = $('input')[0].value;
  var emailInput = $('input')[1].value;

  var newUser = {user: {name: nameInput, email: emailInput}};

  $.ajax({
    type: "POST",
    data: newUser,
    url: '/users.json'
  }).done(function(response) {
    console.log(response);

    /* add 'created USERNAME' notice here */


  });
};



app.eventListeners = function() {
  $("form").on('submit', function(e) {
    e.preventDefault();
    app.createUser();
  });
};


app.eventListeners();


app.makeMap = function() {
    var mapOptions = {
      zoom: 12,
      center: new google.maps.LatLng(app.lat, app.lng),
      mapTypeId: google.maps.MapTypeId.TERRAIN
    };

    app.map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
};


navigator.geolocation.getCurrentPosition(function(position){
    app.lat = position.coords.latitude;
    app.lng = position.coords.longitude;
    app.makeMap();
  });
