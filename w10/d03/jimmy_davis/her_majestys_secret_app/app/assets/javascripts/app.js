var app = app || {};

$(function() {
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

  showInfo('get_actors', 'getActors');
  showInfo('total_gross', 'totalGross');
  showInfo('star_count', 'starCount');
  showInfo('loneliest_bond', 'loneliestBond');
  showInfo('odd_bonds', 'oddBonds');
  showInfo('best_bond', 'bestBond');
  showInfo('worst_bond', 'worstBond');

});

showInfo = function(buttonToClick, info){
  $('#' + buttonToClick).on('click', function(){
    $('#show-info p').remove();
    var answer = eval('app.films.' + info + '();');
    $('#show-info').append('<p>' + JSON.stringify(answer) + '</p>');
  });
}
