// Create a javascript file called app.js

// In app.js create a javascript object literal called app

// When a user inputs their name and email into the form and clicks submit, have a method called app.createUser that uses $.ajax() to create a new user in your database. Send back the new user as json.

// In #notice display "Created USERNAME" then fade out.

var app = app || {};

$(document).ready(function() {
  $("#add-user").on("click", app.createUser);
  app.makeMap();
  $("#drop-pin").on("click", app.showLocation);
});

app.createUser = function(e) {
  // console.log("works");
  // Stop the from from submitting
  e.preventDefault();
  // Create a new form object from the text inputs
  var name = $('input[name=name').val();
  var email = $('input[name=email').val();
  // console.log(name);
  // console.log(email);
  var newUser = {
    user: {
      name: name,
      email: email
    }
  };
  // console.log(newUser);
  // POST request to create new message with ajax

  $.ajax ({
    type: "post",
    url: "/users.json",
    data: newUser
  }).done(app.displayUser);
}

// Send back the new user as json.

// app.displayUser = function(data) {
//   console.log("work!")
//   var userUrl= "users/" + newUser.id + ".json";

//     $.ajax ({
//     type: "get",
//     url: userUrl,
//     data: newUser
//   }).done(console.log("wo"));
// }



// In #notice display "Created USERNAME" then fade out.


// Add some more JS
// Create a method on app called makeMap that runs the following code:

app.makeMap = function(e){

  var mapOptions = {
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
}

app.showLocation = function() {
  var myLatlng = new google.maps.LatLng(-25.363882,131.044922);

  var marker = new google.maps.Marker({
    position: myLatlng,
    title:"Hello World!"
  });
  marker.setMap(map);
}

