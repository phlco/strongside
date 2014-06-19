var app = {};

$(document).ready(function(){
  $("#submit-button").on("click", app.createUser);
})


app.createUser = function(e) {
  e.preventDefault();
  var $name = $("#input-name").val();
  var $email = $("#input-email").val();

  var newUserParams = {
    user: {
      name: $name,
      email: $email
    }
  }

  $.ajax({
    type: "POST",
    url: "/users.json",
    data: newUserParams
  }).done(app.postUser)
}

app.postUser = function(data) {
  console.log(data);
  $("form")[0].reset();
  $("#notice").append($("<p>").text("Created " + data.name).delay(2000).fadeOut(400));
}

app.makeMap = function() {
  var mapOptions = {
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  app.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
}
$(document).ready(app.makeMap);



$(document).ready(function(){
  $("#drop-pin").on("click", function() {
  var myLatlng = new google.maps.LatLng(-25.363882,131.044922);

  var marker = new google.maps.Marker({
    position: myLatlng,
    title:"Hello World!"
});

marker.setMap(app.map);
});
})

// app.dropPin = function() {
//   var myLatlng = new google.maps.LatLng(-25.363882,131.044922);

//   var marker = new google.maps.Marker({
//     position: myLatlng,
//     title:"Hello World!"
// });

// marker.setMap(map);
// }



