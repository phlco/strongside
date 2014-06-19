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


var Film = Backbone.Model.extend({
  initialize: function(query) {
    this.query = query || {};
  },
  gross: function() {
    var filmGross = this.query.gross.substring(1, this.query.gross.length);
  // debugger;
  var grossNum = "";
  for( var i = 0; i < filmGross.length; i++) {
    if(filmGross[i] !== ","){
      grossNum += filmGross[i];
    }
  }
  // debugger;
  return parseInt(grossNum, 10);
}

});

var Films = Backbone.Collection.extend({
  initialize: function( films ) {
    this.films = [];
    var that = this;
    _.each(films, function(film) {
      var newFilm = new Film( film );
      that.films.push(newFilm);
    });
  },
  getActors: function() {

    var allActors = _.map(this.films, function(film){
      return film.query.actor;
    });
    return _.uniq(allActors);

  },
  totalGross: function() {
    var totalGross = 0;
    _.each(this.films, function(film){
      var thisGross = film.gross( );
      totalGross += thisGross;
    });
    return totalGross;
  },
  titles: function( wordshash ) {
    var wordNum = wordshash.words;
    var allTitles = [];
    _.each(this.films, function(film){
      allTitles.push(film.query.title);
    });
  // debugger;
  var correctTitles = [];
  _.each(allTitles, function( title ) {
    var titleArray = title.split(' ');
    if( titleArray.length == wordNum ){
      correctTitles.push(title);
    }
  });
  return correctTitles;

},
starCount: function() {
  var actors = this.getActors();
  // debugger;
  var that = this;
  var starCount = {};
  _.each(actors, function(actorName ){

    theirMovies = _.filter(that.films, function( film ){
      return film.query.actor == actorName;
    });
    // debugger;
    starCount[actorName] = theirMovies.length;
  });
  return starCount;
},
loneliestBond: function() {
  var actorHash = this.starCount();
  var lonliestBond;
  var lastAmt = 100000000;
  _.each(actorHash, function(value, key){
    // debugger;
    if( value < lastAmt ) {
      lonliestBond = key;
      lastAmt = value;
    }
  });
  return lonliestBond;
},
oddBonds: function() {
  var oddBonds = _.reject(this.films, function(film) {
    return film.query.year % 2 === 0;
  });

  var titleArray = _.map(oddBonds, function( film ) {
    return film.query.title;
  });
  return titleArray;
},
bestBond: function() {
  var actors = this.getActors();
  // debugger;
  var that = this;
  var starCount = [];
  _.each(actors, function(actorName ){
    // debugger;
    theirMovies = _.filter(that.films, function( film ){
      return film.query.actor == actorName;
    });
    // debugger;
    var theirGross = 0;
    console.log(theirGross);
    _.each(theirMovies, function(movie){
      // debugger;
      theirGross += movie.gross();
    });
    starCount.push( {actor: actorName, gross: theirGross / theirMovies.length} );
// debugger;
});

  var bond = _.max(starCount, function(bond){ return bond.gross;});

  return bond;
},
worstBond: function(){

  var actors = this.getActors();
  var that = this;
//   // debugger;
var starCount = [];
_.each(actors, function(actorName ){
//     // debugger;
theirMovies = _.filter(that.films, function(film){
  return film.query.actor == actorName;
});
var theirGross = 0;
//     console.log(theirGross);
_.each(theirMovies, function(movie){
      // debugger;
      theirGross += movie.gross();
    });
starCount.push( {actor: actorName, gross: theirGross / theirMovies.length} );
// // debugger;
});

var bond = _.min(starCount, function(bond){ return bond.gross;});

return bond;
}
});


$(document).ready(function(){


  var FilmsView = Backbone.View.extend({

    el: "#films",

    events: {
      "click #viewAll"      : "renderTable",
      "click #bestBond"     : "bestBond",
      "click #worstBond"    : "worstBond",
      "click #loneliestBond": "loneliestBond",
      "click #oddBonds"     : "oddBonds",
      "click #starCount"    : "starCount",
      "click #totalGross"   : "totalGross",
      "click #getActors"    : "getActors",
    },

    sortBy: function(e) {
      var attr = $(e.currentTarget).text();
      this.collection.comparator = function(model) {
        return model.get( attr );
      };
      this.collection.sort();
    },

    renderTable: function(){
      var template = Handlebars.compile( $("#films-table-template").html() );
      $('#display').html( template( {films: this.collection.toJSON()} ));
    },

    oddBonds: function(e){
      var bonds = this.collection.oddBonds();
      this.renderTitles({titles: bonds});
    },

    loneliestBond: function(e){
      var bond = this.collection.loneliestBond();
      this.renderActor({actor: bond});
    },

    bestBond: function(e){
      var bond = this.collection.bestBond();
      this.renderActor(bond);
    },

    worstBond: function(e){
      var bond = this.collection.worstBond();
      this.renderActor(bond);
    },

    starCount: function(e){
      var stars = this.collection.starCount();
      var template = Handlebars.compile( $('#obj-template').html() );
      $('#display').html( template({star: stars}) );
    },

    renderActor: function(actor) {
      var template = Handlebars.compile( $('#actor-template').html() );
      $('#display').html( template(actor) );
    },

    renderTitles: function(titles) {
      var template = Handlebars.compile( $('#title-template').html() );
      $('#display').html( template(titles) );
    },

    totalGross: function(e){
      var gross = this.collection.totalGross();
      $('#display').html( gross );
    },

    getActors: function(e){
      var actors = this.collection.getActors();
      this.renderTitles({titles: actors});
    }

  });
var app = {};
app.views = {};
app.models = {};
app.collections = {};

var filmCollection = new Films(bonds.films);
var filmsView = new FilmsView({collection: filmCollection});
});












