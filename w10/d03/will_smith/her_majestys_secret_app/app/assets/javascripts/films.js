var Films = Backbone.Collection.extend({

  model: Film,

  grosses: function() {
    return this.map(function(film){ return film.gross(); });
  },

  totalGross: function(){
    var grossArray = _.map(bonds.films, function(film){ return bonds.gross(film); } );
    var gross = _.reduce(grossArray, function(memo, num){ return memo + num; }, 0);
    return gross;
  },

  getActors: function(){
    var actors = this.map(function(film){
      return film.get('actor');
    });
    return _.uniq(actors);
  },

  titles: function( options ){
    var titles = _.map(bonds.films, function(film){
      return film.title;
    });
    var titleWordCount = [];
    for (var i = 0; i<titles.length;i++){
      if (options.words === titles[i].split(' ').length) {
        titleWordCount.push(titles[i]);
      }
    }
    return titleWordCount;
  },

  starCount: function(){
    var actors = _.countBy(bonds.films, function(film){
      return film.actor;
    });
    return actors;
  },

  loneliestBond: function(){
    var actors = _.groupBy(bonds.films, function(film){
      return film.actor;
    });
    var filmCount = [];
    for(var key in actors){
      var value = actors[key];
      filmCount.push(value);
    }
    var filmSize = [];
    for (var i = 0; i<filmCount.length; i++){
      var size = _.size(filmCount[i]);
      filmSize.push(size);
    }
    var minFilmSize = _.min(filmSize);
    for (var p = 0; p<filmCount.length; p++){
      if (minFilmSize == _.size(filmCount[p])){
        return (filmCount[p][0].actor);
      }
    }
  },

  oddBonds: function(){
    var years = _.map(bonds.films, function(film){
      return film.year;
    });
    var odds = _.filter(years, function(num){
      return num % 2 !== 0;
    });
    var oddYears = [];
    for (var i = 0; i<odds.length; i++){
      var filmByYear = _.findWhere(bonds.films, { year: odds[i] });
      oddYears.push(filmByYear.title);
    }
    return oddYears;
  },

  bestBond: function(){
    return _.max(
      _.map(_.groupBy(bonds.films, "actor"), function(films, actor){
        var numberOfFilms = films.length;
        var grosses = _.map(films, function(film){
          return bonds.gross(film);
        });
        var totalGross = _.reduce(grosses, function(memo, num){
          return memo + num;
        });
        var average = totalGross/numberOfFilms;
        return { actor: actor, gross: average };
      }), function(actor){
        return actor.gross;
      }
    );
  },

  worstBond: function(){
    return _.min(
      _.map(_.groupBy(bonds.films, "actor"), function(films, actor){
        var numberOfFilms = films.length;
        var grosses = _.map(films, function(film){
          return bonds.gross(film);
        });
        var totalGross = _.reduce(grosses, function(memo, num){
          return memo + num;
        });
        var average = totalGross/numberOfFilms;
        return { actor: actor, gross: average };
      }), function(actor){
        return actor.gross;
      }
    );
  }
});
