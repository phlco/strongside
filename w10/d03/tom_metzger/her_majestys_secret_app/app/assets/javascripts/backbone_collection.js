
var Films = Backbone.Collection.extend({

	model: Film,

  // this.gross = function() {
  //   // the issue with the gross data is that the string can't be directly converted
  //   // This trims off the $ from the gross value
  //   var withCommas = this.get("gross").slice(1);
  //   // splits the string to remove the commas
  //   var number_array = withCommas.split(",");
  //   // rejoins the numbers to create a string of just numbers, since the numebrs are a string the + acts as a concatenate
  //   // var number_string = _.reduce(number_array,function(memo, next){return memo + next})
  //   // better option for the line above is .join("")
  //   var number_string = number_array.join("");
  //   return parseInt(number_string);
  // }

  // returns an array bond actor names without duplicates
  this.getActors = function() {
    // selects the value from the actor attribute of each film in the collection (if this was backbone) of films objects and creates an array
    //_.uniq creates an array containing only the unique names from the array produced by _.pluck
    return _(this.pluck( "actor" )).unique();
  }

 //  // returns the titles of movies that have a specified number of words
	// bonds.titles = function(object) {
	//   var object = object || {};
	//   // removes all undefined entries from the array and returns an array of the remaining values
	//   return _.compact(
	//     // iterates through the bond films and outputs an array of titles equal to the specified word count
	//     _.map(bonds.films, function(film) {
	//       // creates an array of words from the film's title
	//       var film_array = film.title.split(' ');
	//       // compares the length of the array (i.e. the number of words in the title) to the word count specified when the .title function was called
	//       if (film_array.length === object.words) {
	//         // if word count equals desired count this title is added to the array, otherwise no title is included and the slot in the array is left as "undefined"
	//         return film.title;
	//       } else {
	//       }
	//     })
	//   )
	// }

	// // counts the number of bond films each bond actor has appeared in
	// bonds.starCount = function() {
	//   // defines an empty object to be returned later
	//   starcount = {};
	//   // iterates through an array containing the name of each actor (function defined above) and returns an object of that actors name and the count of films into the object defined at the beginning of the function
	//   _.each(bonds.getActors(), function(actor) {
	//     return starcount[actor] = _.where(_.pluck(bonds.films, "actor"), actor).length;
	//   });
	//   // returns the object containing all actor: filmCount objects
	//   return starcount;
	// }

	// bonds.loneliestBond = function() {
	//   var index = _.indexOf(_.values(bonds.starCount()),_.min(bonds.starCount()))
	//   return _.keys(bonds.starCount())[index]
	// }

	// bonds.oddBonds = function() {
	//   return _.compact(
	//     _.map(bonds.films, function(film) {
	//       if (film.year % 2 !== 0) {
	//         return film.title;
	//       } else {
	//       }
	//     })
	//   )
	// }

	// bonds.bestBond = function() {
	//   // creates an array of objects that aggregates an actors films into an array
	//   var groupFilms = _.groupBy(bonds.films, function(film){return film.actor})
	//   // the map iterates through the array of actor:filmList objects with the goal of calculating the average box-office gross for the actor
	//   var grossArray = _.map(groupFilms, function(obj, actor){
	//     // the reduce sums the box-office gross for each movie per actor, and then divides it by the number of movies (array length) to compute the average
	//     var average = _.reduce(obj, function(memo, movie){ return memo + bonds.gross(movie) }, 0) / obj.length;
	//     // this returns and object for each actor that has the actors name as key and the average box-office gross for the value
	//     // this required a common key to (actor: OR gross:) to be specified to caputure the value (actor OR average) produced by the _.map function
	//     return {actor: actor, gross: average};
	//   })
	//   // _.max is called and if it is passed anythign other than a simple array, then must specify a function to identify the value in each object to be evaluated by _.max
	//   return _.max(grossArray, function(actorGross){return actorGross.gross});
	// }

	// // worstBond has _.min substituted for _.max and otherwise is EXACTLY the same as bestBond
	// bonds.worstBond = function() {
	//   var groupFilms = _.groupBy(bonds.films, function(film){return film.actor})
	//   var grossArray = _.map(groupFilms, function(obj, actor){
	//     var average = _.reduce(obj, function(memo, movie){ return memo + bonds.gross(movie) }, 0) / obj.length;
	//     return {actor: actor, gross: average};
	//   })
	//   return _.min(grossArray, function(actorGross){return actorGross.gross});
	// }



})
