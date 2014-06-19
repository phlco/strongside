bondfilms = [
  { title: "Skyfall", year: 2012, actor: "Daniel Craig", gross: "$1,108,561,008" },
  { title: "Thunderball", year: 1965, actor: "Sean Connery", gross: "$1,014,941,117" },
  { title: "Goldfinger", year: 1964, actor: "Sean Connery", gross: "$912,257,512" },
  { title: "Live and Let Die", year: 1973, actor: "Roger Moore", gross: "$825,110,761" },
  { title: "You Only Live Twice", year: 1967, actor: "Sean Connery", gross: "$756,544,419" },
  { title: "The Spy Who Loved Me", year: 1977, actor: "Roger Moore", gross: "$692,713,752" },
  { title: "Casino Royale", year: 2006, actor: "Daniel Craig", gross: "$669,789,482" },
  { title: "Moonraker", year: 1979, actor: "Roger Moore", gross: "$655,872,400" },
  { title: "Diamonds Are Forever", year: 1971, actor: "Sean Connery", gross: "$648,514,469" },
  { title: "Quantum of Solace", year: 2008, actor: "Daniel Craig", gross: "$622,246,378" },
  { title: "From Russia with Love", year: 1963, actor: "Sean Connery", gross: "$576,277,964" },
  { title: "Die Another Day", year: 2002, actor: "Pierce Brosnan", gross: "$543,639,638" },
  { title: "Goldeneye", year: 1995, actor: "Pierce Brosnan", gross: "$529,548,711" },
  { title: "On Her Majesty's Secret Service", year: 1969, actor: "George Lazenby", gross: "$505,899,782" },
  { title: "The World is Not Enough", year: 1999, actor: "Pierce Brosnan", gross: "$491,617,153" },
  { title: "For Your Eyes Only", year: 1981, actor: "Roger Moore", gross: "$486,468,881" },
  { title: "Tomorrow Never Dies", year: 1997, actor: "Pierce Brosnan", gross: "$478,946,402" },
  { title: "The Man with the Golden Gun", year: 1974, actor: "Roger Moore", gross: "$448,249,281" },
  { title: "Dr. No", year: 1962, actor: "Sean Connery", gross: "$440,759,072" },
  { title: "Octopussy", year: 1983, actor: "Roger Moore", gross: "$426,244,352" },
  { title: "The Living Daylights", year: 1987, actor: "Timothy Dalton", gross: "$381,088,866" },
  { title: "A View to a Kill", year: 1985, actor: "Roger Moore", gross: "$321,172,633" },
  { title: "Licence to Kill", year: 1989, actor: "Timothy Dalton", gross: "$285,157,191" }
];

var films.= {};

films.gross = function(movie){
  return Number(movie.gross.replace(/[^0-9\.]+/g,""));
};

films.getActors = function(movies){
  var actors = _.map(movies, function(movie){
    return movie.actor;
  });
  return _.uniq(actors);
};

films.totalGross = function(movies){
  var grosses = _.map(movies, function(movie){
    return this.gross(movie);
  }, this);

  return _.reduce(grosses, function(sum, gross){
    return sum + gross;
  }, 0);
};

films.titles = function(movies, query){
  var numWords = query.words;
  var matches = [];
  _.find(movies, function(movie){
    var words = movie.title.split(' ');
    if (words.length === numWords) {
      matches.push(movie.title);
    }
  });
  return matches;
};

films.starCount = function(movies){
  var actors = this.getActors();
  var results = {};
  _.each(actors, function(actor){
    var numFilms = _.where(movies, {actor: actor}).length;
    this[actor] = numFilms;
  }, results);
  return results;
};

films.loneliestBond = function(){
  var starCount = this.starCount();
  var lowestMovies = _.min(_.values(starCount));

  function findByValue(object, value){
    var matchedKeys = [];
    _.each(_.keys(object), function(key){
      var currentValue = object[key];
      if (currentValue === value){
        matchedKeys.push(key);
      }
    });
    return matchedKeys;
  }

  var matches = findByValue(starCount, lowestMovies);
  return matches[0];
};

films.oddfilms.= function(){
  var movies = this.films;
  var movieYears = _.map(movies, function(movie){
    return movie.year;
  });

  var matchedYears = _.reject(movieYears, function(year){
    return year % 2 === 0;
  });

  var matchedMoviesArr =
  _.map(matchedYears, function(matchedYear){
    return _.where(this.films, {year: matchedYear});
  }, this);

  var matchedMovies = _.flatten(matchedMoviesArr);

  return _.map(matchedMovies, function(movie){
    return movie.title;
  });
};

films.bestBond = function(){
  var organizedfilms.= this.organizefilms.);

  return _.max(organizedfilms. function(film){
    return film.gross;
  });
};

films.worstBond = function(){
  var organizedfilms.= this.organizefilms.);

  return _.min(organizedfilms. function(film){
    return film.gross;
  });
};

films.organizefilms.= function(){
  var movies = this.films;
  var groups =
  _.groupBy(movies, 'actor', function(films){
    return films;
  });

  return _.map(groups, function(star){
    var avgGross = this.totalGross(star) / star.length;
    var actor = star[0].actor;
    return _.object(['actor', 'gross'], [actor, avgGross]);
  }, this);
};
