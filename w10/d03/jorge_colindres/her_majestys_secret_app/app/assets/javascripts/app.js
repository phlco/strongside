$(function() {
  var filmsListView = new app.FilmsListView();
  app.router = new app.Router();

  app.router.on('route:index', function(){
    filmsListView.render();
  });

  Backbone.history.start();
});
