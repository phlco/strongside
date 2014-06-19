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

bonds.gross = function(film) {
  // console.log("the gross of my film");
  // bonds.films[0].gross
  // bonds.films[0].gross.slice(1)
  var theGross = parseInt(film.gross.slice(1).split(',').join(''));
  return theGross;
};

// bonds.getActors = function(){
//   // console.log("connery and crew of my film");
//   // bonds.films[0].actor
//   // var films = _.map(bonds.films, function(list){console.log(list)});
//   var actors = _.map(bonds.films, function(film){return film.actor});
//   var alist = _.uniq(actors);
//   return alist;
// };

// bonds.totalGross = function(){
//   var change = _.map(bonds.films, function(film){return bonds.gross(film)});
//   var sum = _.reduce(change, function(memo, num){ return memo + num; });
//   return sum;
// };

// bonds.titles = function(object) {
//   var titles = _.map(bonds.films, function(film){ return film.title });
//   // split the titles
//   var splitTitles = _.map(titles, function(titles){return titles.split(' ')});
//   // find the titles where there are two elements
//   var splits = _.filter(splitTitles, function(titles){return titles.length === 2 });
//   // titles = _find(titles, function, [{}])
//   var answers = _.map(splits, function(splits){return splits.join(' ')});
//   return answers;
//   // return the two titles where there are two words
// };

// bonds.starCount = function(){
//   // var stars = _.map( bonds.films, function(film){ return film.actor });
//   // console.log(stars);
//   var stars = _.countBy( bonds.films, function(film){ return film.actor});
//   // console.log(stars);
//   return stars;
// };


// bonds.loneliestBond = function() {
//   // gets actors and movies
//   var stars = _.countBy( bonds.films, function(film){ return film.actor});
//   // var lonliest = _.last(stars);
//   // return lonliest;
//   var peared = _.pairs(stars);
//   var mini = _.min(peared, function(a){ return a[1]});
//   return mini[0];
// };

// bonds.oddBonds = function(){
// // get all the films
//   var oddYears = _.filter(bonds.films, function(film){ return (film.year % 2 !== 0) });
//   // console.log(oddYears);
//   var titles = _.map(oddYears, function(film){ return film.title });
//   return titles;
//   // var odds =
// // filter out the odd years
// };

// bonds.bestBond = function() {
//   // study this thing
//   return _.max(
//     _.map(_.groupBy(bonds.films, "actor"), function(films, actor){
//       var numberOfFilms = films.length;
//       var grosses = _.map(films, function(film){
//         return bonds.gross(film);
//       });
//       var totalGross = _.reduce(grosses, function(memo, num){
//         return memo + num;
//       });
//       var average = totalGross/numberOfFilms;
//       return { actor: actor, gross: average };
//     }), function(actor){
//       return actor.gross;
//     }
//   );
// };

// bonds.worstBond = function() {
//   // study this thing
//   return _.min(
//     _.map(_.groupBy(bonds.films, "actor"), function(films, actor){
//       var numberOfFilms = films.length;
//       var grosses = _.map(films, function(film){
//         return bonds.gross(film);
//       });
//       var totalGross = _.reduce(grosses, function(memo, num){
//         return memo + num;
//       });
//       var average = totalGross/numberOfFilms;
//       return { actor: actor, gross: average };
//     }), function(actor){
//       return actor.gross;
//     }
//   );
// };





