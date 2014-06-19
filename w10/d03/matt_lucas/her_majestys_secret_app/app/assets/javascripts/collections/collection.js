var Films = Backbone.Collection.extend({

  model: Film,

  getActors: function() {
   var actors = this.map(function(film){return film.get('actor') });
   var alist = _.uniq(actors);
   return alist;
 },

  // totalGross: function() {
  // //   // taken from the other js, this parses all to get the numbers readable.
  //   var theGross = parseInt(Film.get('gross').slice(1).split(',').join(''));
  //   console.log(theGross);
    // var gross = this.map(function(Films){return Films.get('gross') });
    // console.log(gross);
  //   // left off here, this is returning a $amount
  //   var sum = gross.reduce(function(memo, num){ return memo + num; });
  //   return sum;
  // },

  totalGross: function(){
    var change = this.map(function(film){return film.get('gross') });
    console.log(change);
    // var sum = _.reduce(change, function(memo, num){ return memo + num; });
    // return sum;
  },



  // titles: function() {
  // // get an array of the titles
  // var titles = this.map(function(film){ return film.get('title') });
  // console.log(titles);
  // // var splitTitles = this.map(function(film){return get('title').split(' ')  });
  // // console.log(splitTitles);
  // // find the titles where there are two elements
  // // var splits = this.filter(function(this.splitTitles){return this.titles.length === 2 });
  // // // titles = _find(titles, function, [{}])
  // // var answers = _.map(splits, function(splits){return splits.join(' ')});
  // // return answers;
  // // return the two titles where there are two words


  // },

  titles: function (num_words_obj){
   var titles = _.pluck(bonds.films, "title");
   // console.log(titles);
   var longTitles = _.map(titles, function (el) {
     if(el.split(' ').length === num_words_obj.words) { return el }
   });
   // console.log(longTitles);
   return _.filter(longTitles, function(title){return title});
 },

 starCount: function() {
   var actors = this.map(function(film){return film.get('actor') });
   var stars = _.countBy( bonds.films, function(film){ return film.actor});
   // console.log(stars);
   return stars;
 },

 loneliestBond: function(){
  // gets actors and movies
  var stars = _.countBy( bonds.films, function(film){ return film.actor});
  // var lonliest = _.last(stars);
  // return lonliest;
  var peared = _.pairs(stars);
  var mini = _.min(peared, function(a){ return a[1]});
  return mini[0];
},

oddBonds: function(){

  // get all the films
  var oddYears = _.filter( bonds.films, function(film){ return (film.year % 2 !== 0) });
  // console.log(oddYears);
  var titles = _.map(oddYears, function(film){ return film.title });
  return titles;

},

bestBond: function() {
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



});