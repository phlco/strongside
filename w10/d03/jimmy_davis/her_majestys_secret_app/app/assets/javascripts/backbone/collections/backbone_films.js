var app = app || {};

var Film = Backbone.Model.extend({
  urlRoot: "/",
  initialize: function(query){
    this.set("film", query);
  },
  gross: function(){
    var film = this.get("film");
    return parseInt(film.gross.slice(1).split(',').join(''));
  }});



var Films = Backbone.Collection.extend({
  url: "/",
  model: Film,
  getActors: function(){
    return _.uniq(_.pluck(bonds.films, "actor"));  },
  totalGross: function (){
    var grossArray = _.map(bonds.films, function(film){ return bonds.gross(film) });
    return _.reduce(grossArray, function(memo, num) {return memo + num } );
  },
  titles: function (object){
    object = object || {};
    return _.compact(
      _.map(bonds.films, function(film) {
        var film_array = film.title.split(' ');
        if (film_array.length === object.words) {
          return film.title;
        } else {
        }
      })
    )
  },
  starCount: function (){
    count = {}
    _.each(bonds.getActors(), function(actor) {
      return count[actor] = _.where(_.pluck(bonds.films, "actor"), actor).length;
    });
    return count;
  },
  loneliestBond: function () {
    var index = _.indexOf(_.values(bonds.starCount()),_.min(bonds.starCount()));
    return _.keys(bonds.starCount())[index]
  },
  oddBonds: function () {
    return _.compact(
      _.map(bonds.films, function(film) {
        if ( film.year % 2 !== 0 ) {
          return film.title;
        } else {
        }
      })
    )
  },
  bestBond: function (){
    var groupFilms = _.groupBy(bonds.films, function(film){return film.actor})
    var grossArray = _.map(groupFilms, function(obj, actor){
      var average = _.reduce(obj, function(memo, movie){ return memo + bonds.gross(movie) }, 0) / obj.length;
      return {actor: actor, gross: average};
    })
    return _.max(grossArray, function(actorGross){return actorGross.gross});
  },
  worstBond: function (){
    var groupFilms = _.groupBy(bonds.films, function(film){return film.actor})
    var grossArray = _.map(groupFilms, function(obj, actor){
      var average = _.reduce(obj, function(memo, movie){ return memo + bonds.gross(movie) }, 0) / obj.length;
      return {actor: actor, gross: average};
    })
    return _.min(grossArray, function(actorGross){return actorGross.gross});
  }
});
