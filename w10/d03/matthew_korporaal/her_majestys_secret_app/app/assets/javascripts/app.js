var app = app || {};

$(function () {
  app.filmListView = new FilmListView();

  app.router = new Router();
  app.router.on('route:home', function (){
    app.filmListView.render();
  });
  app.router.on('route:edit', function (id){
    app.filmEditView.render({id: id});
  });

  Backbone.history.start();

  app.films = new Films( bonds.films );

  printInfo('all', 'getActors');
  printInfo('tot', 'totalGross');
  printInfo('str', 'starCount');
  printInfo('lon', 'loneliestBond');
  printInfo('odd', 'oddBonds');
  printInfo('bst', 'bestBond');
  printInfo('wst', 'worstBond');

});

printInfo = function(buttonID, func){
    $('#' + buttonID).on('click', function(){
    $('#info-area p').remove();
    var answer = eval('app.films.' + func + '();');
    $('#info-area').append('<p>' + JSON.stringify(answer) + '</p>');
  });
}
