var app = app || {};

var Film = Backbone.Model.extend({
  urlRoot: "/",
  initialize: function(query){
    this.set("film", query);
  },
  gross: function(){
    var film = this.get("film");
    return parseInt(film.gross.slice(1).replace(/,/g,""),10);
  }});

var Films = Backbone.Collection.extend({
  url: "/",
  model: Film,
  getActors: function(){
    return _.uniq(this.pluck("actor"));
  },
  totalGross: function (){
    var gross = _.map(bonds.films, function(film){ return bonds.gross(film)});
    return _.reduce(gross, function(memo, num){ return memo + num; }, 0);
  },
  titles: function (num_words_obj){
    var titles = _.pluck(bonds.films, "title");
    var longTitles = _.map(titles, function (el) {
      if(el.split(' ').length === num_words_obj.words) { return el }
    });
    return _.filter(longTitles, function(title){return title});
  },
  starCount: function (){
    // find unique actors
    var actors = bonds.getActors();
    // tally their films
    // {"Daniel Craig":3, "Sean Connery":6...}
    var starFilmCountMap = {};
    _.each(actors, function(actor) {
      var actorsFilms = _.where(bonds.films, { actor: actor });
      var numFilms = _.pluck(actorsFilms ,"title").length
      starFilmCountMap[actor] = numFilms;
    });
    return starFilmCountMap;
  },
  loneliestBond: function () {
    var actorsFilms = this.starCount(),
    loneliest;

    var fewestMovies = _.min(actorsFilms);
    _.each(actorsFilms, function(movies, actor) {
      if (movies == fewestMovies){
        loneliest = actor;
      }
    });
    return loneliest;
  },
  oddBonds: function () {
    var oddFilms = [];
    _.each(bonds.films, function(film, index) {
      if (film.year % 2 == 1) {
        oddFilms.push(film.title);
      }
    });
    return oddFilms;
  },
  bestBond: function (){
    return _.max(
      _.map(_.groupBy(bonds.films, "actor"), function(films, actor){
        var numberOfFilms = films.length;

        var grosses = _.map(films, function(film){
          return bonds.gross(film)
        });

        var totalGross = _.reduce(grosses, function(memo, num){
          return memo + num;
        });

        var average = totalGross/numberOfFilms;
        return { actor: actor, gross: average };
      }),
      function(actor){
        return actor.gross;
      }
    );
  },
  worstBond: function (){
    var groupedByActor = _.groupBy(bonds.films, "actor");

    return _.min(
      _.map(groupedByActor, function(films, actor){
        var numberOfFilms = films.length;

        var grosses = _.map(films, function(film){
          return bonds.gross(film);
        });

        var totalGross = _.reduce(grosses, function(memo, num){
          return memo + num;
        });

        var average = totalGross/numberOfFilms;
        return { actor: actor, gross: average };
      }),
      function(actor){
        return actor.gross;
      }
    );
  }
});
