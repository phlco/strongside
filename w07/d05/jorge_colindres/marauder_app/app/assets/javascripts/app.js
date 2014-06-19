var app = {};

app.xhrPost = function(url, type, data){
  return $.ajax(url, {
    type: type,
    data: data
  });
};

app.createUser = function (){
  var $form = $(this);
  var name = $($form.children()[0]).val();
  var email = $($form.children()[1]).val();
  userData = {
    user: {
      name: name,
      email: email,
      lat: app.lat,
      lon: app.lon
    }
  };
  app.xhrPost('/users.json', 'post', userData).done(function(response){
    console.log(response);
    $('#notice').html(response.name + ' created.').fadeIn('slow').delay(1000).fadeOut('slow');
    $form[0].reset();
    navigator.geolocation.watchPosition(function(position){
      app.lat = position.coords.latitude;
      app.lon = position.coords.longitude;
    });
    userData = {
      user: {
        name: name,
        email: email,
        lat: app.lat,
        lon: app.lon
      }
    };
    app.xhrPost('/users/' + response.id + '.json', 'put', userData).done(function(response){
      console.log(response);
    });
  });
};

app.makeMap = function(){
  var hopperMap = [{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#165c64"},{"saturation":34},{"lightness":-69},{"visibility":"on"}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"hue":"#b7caaa"},{"saturation":-14},{"lightness":-18},{"visibility":"on"}]},{"featureType":"landscape.man_made","elementType":"all","stylers":[{"hue":"#cbdac1"},{"saturation":-6},{"lightness":-9},{"visibility":"on"}]},{"featureType":"road","elementType":"geometry","stylers":[{"hue":"#8d9b83"},{"saturation":-89},{"lightness":-12},{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"hue":"#d4dad0"},{"saturation":-88},{"lightness":54},{"visibility":"simplified"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"hue":"#bdc5b6"},{"saturation":-89},{"lightness":-3},{"visibility":"simplified"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"hue":"#bdc5b6"},{"saturation":-89},{"lightness":-26},{"visibility":"on"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"hue":"#c17118"},{"saturation":61},{"lightness":-45},{"visibility":"on"}]},{"featureType":"poi.park","elementType":"all","stylers":[{"hue":"#8ba975"},{"saturation":-46},{"lightness":-28},{"visibility":"on"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"hue":"#a43218"},{"saturation":74},{"lightness":-51},{"visibility":"simplified"}]},{"featureType":"administrative.province","elementType":"all","stylers":[{"hue":"#ffffff"},{"saturation":0},{"lightness":100},{"visibility":"simplified"}]},{"featureType":"administrative.neighborhood","elementType":"all","stylers":[{"hue":"#ffffff"},{"saturation":0},{"lightness":100},{"visibility":"off"}]},{"featureType":"administrative.locality","elementType":"labels","stylers":[{"hue":"#ffffff"},{"saturation":0},{"lightness":100},{"visibility":"off"}]},{"featureType":"administrative.land_parcel","elementType":"all","stylers":[{"hue":"#ffffff"},{"saturation":0},{"lightness":100},{"visibility":"off"}]},{"featureType":"administrative","elementType":"all","stylers":[{"hue":"#3a3935"},{"saturation":5},{"lightness":-57},{"visibility":"off"}]},{"featureType":"poi.medical","elementType":"geometry","stylers":[{"hue":"#cba923"},{"saturation":50},{"lightness":-46},{"visibility":"on"}]}];
  var mapOptions = {
    center: new google.maps.LatLng(app.lat, app.lon),
    zoom: 14,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    styles: hopperMap
  };
  this.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
};

$(function(){
  $('#createUser').on('submit', function(e){
    e.preventDefault();
    app.createUser.call(this);
  });
  $('#drop-pin').on('click', function(){
    var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
    var marker = new google.maps.Marker({
      position: myLatlng,
      title:"Hello World!"
    });
    marker.setMap(app.map);
  });
  navigator.geolocation.getCurrentPosition(function(position){
     app.lat = position.coords.latitude;
     app.lon = position.coords.longitude;
     app.makeMap();
   });
});
