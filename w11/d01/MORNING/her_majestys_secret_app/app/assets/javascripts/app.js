var app = {};
app.views = {};
app.models = {};
app.collections = {};

$(document).ready(function(){
  var filmCollection = new Films(bonds.films);
  var filmsView = new FilmsView({collection: filmCollection});
})
