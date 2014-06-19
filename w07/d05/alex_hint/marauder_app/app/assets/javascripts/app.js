var app = {};

app.createUser = function() {
  var nameInput = $("#name-input")[0].value;
  var emailInput = $("#email-input")[0].value;

  var newUser = {user: {name: nameInput, email: emailInput}};

  $.ajax({
    type: "POST",
    data: newUser,
    url: '/users.json'
  }).done(function(response) {
    $("#notice").text("created: " + response.name).fadeOut(1000);
  });
};


app.eventListeners = function() {
  $("#submit").on("click", function(e) {
    e.preventDefault();
    app.createUser();
  });
};

app.makeMap = function() {
  var mapOptions = {
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

  $("#drop-pin").on("click", function(e){
    e.preventDefault();
    var myLatlng = new google.maps.LatLng(-25.363882,131.044922);

    var marker = new google.maps.Marker({
      position: myLatlng,
      title:"Hello World!"
    });

    marker.setMap(map);
  });

};


app.eventListeners();
app.makeMap();



