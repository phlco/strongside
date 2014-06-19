var app = app || {};

app.Films = Backbone.Collection.extend({
  model: app.Film,
  getActors: function(){
    return _.uniq(this.pluck('actor'));
  },
  totalGross: function(movies){
    var movies = movies || this.models;
    var grosses = _.map(movies, function(movie){
      return movie.gross();
    });
    return _.reduce(grosses, function(first, second){
      return first + second;
    });
  },
  titles: function(query){
    var numWords = query.words;
    var matches = [];
    this.find(function(movie){
      var words = movie.get('title').split(' ');
      if (words.length === numWords) {
        matches.push(movie.get('title'));
      }
    });
    return matches;
  },
  starCount: function(){
    var actors = this.getActors();
    var results = {};
    for (var i = 0; i < actors.length; i++) {
      var numFilms = this.where({actor: actors[i]}).length;
      results[actors[i]] = numFilms;
    }
    return results;
  },
  loneliestBond: function(){
    _.findByValue = function(object, value){
      var matchedKeys = [];
      _.each(_.keys(object), function(key){
        var currentValue = object[key];
        if (currentValue === value){
          matchedKeys.push(key);
        }
      });
      return matchedKeys.length === 1 ? matchedKeys[0] : matchedKeys;
    };
    var starCount = this.starCount();
    var lowestMovies = _.min(starCount);
    return _.findByValue(starCount, lowestMovies);
  },
  oddBonds: function(){
    var movieYears = this.map(function(movie){ return movie.get('year'); });
    var matchedYears = _.reject(movieYears, function(year){ return year % 2 === 0; });
    var matchedMovies =
    _.flatten(
      _.map(matchedYears, function(matchedYear){
        return this.where({year: matchedYear});
      }, this));

    return _.map(matchedMovies, function(movie){
      return movie.get('title');
    });
  },
  bestBond: function(){
    var organizedBonds = this.organizeBonds();
    return _.max(organizedBonds, function(film){
      return film.gross;
    });
  },
  worstBond: function(){
    var organizedBonds = this.organizeBonds();
    return _.min(organizedBonds, function(film){
      return film.gross;
    });
  },
  organizeBonds: function(){
    var movies = this.models;
    var groups = _.groupBy(movies, function(film){
      return film.get('actor');
    });
    return _.map(groups, function(starsMovies){
      var avgGross = this.totalGross(starsMovies) / starsMovies.length;
      var actorName = starsMovies[0].get('actor');
      return {actor: actorName, gross: avgGross};
    }, this);
  }
});
