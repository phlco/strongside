var bonds = {};
bonds.films = [
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

// var Film = Backbone.Model.extend({
//   gross: function() {
//     reutrn (parseInt(this.get("gross").slice(1).replace(/,/g,""),10);
//   }
// })

// f = new Film(bonds.films[0])
// f.gross();

bonds.gross = function (query) {
  return parseInt(query.gross.slice(1).replace(/,/g,""),10);
};

bonds.getActors = function () {
  var actors = _.pluck(bonds.films,"actor");
  return _.uniq(actors);
}

bonds.totalGross = function () {
  var gross = _.map(bonds.films, function(film){ return bonds.gross(film)});
  return _.reduce(gross, function(memo, num){ return memo + num; }, 0);
}

bonds.titles = function (num_words_obj) {
  var titles = _.pluck(bonds.films, "title");
  var longTitles = _.map(titles, function (el) {
      if(el.split(' ').length === num_words_obj.words) { return el }
    });
  return _.filter(longTitles, function(title){return title});
}

bonds.starCount = function () {
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
};

bonds.loneliestBond = function () {
  var actorsFilms = this.starCount(),
        loneliest;

  var fewestMovies = _.min(actorsFilms);
  _.each(actorsFilms, function(movies, actor) {
    if (movies == fewestMovies){
      loneliest = actor;
    }
  });
  return loneliest;

}

bonds.oddBonds = function () {
  var oddFilms = [];
  _.each(bonds.films, function(film, index) {
    if (film.year % 2 == 1) {
      oddFilms.push(film.title);
    }
  });
  return oddFilms;
}

bonds.bestBond = function() {
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
}

bonds.worstBond = function() {
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
