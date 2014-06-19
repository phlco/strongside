// You will first need to define the Line() constructor function to create new Lines

var N = new Line('N', ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th']);
var L = new Line('L', ['8th', '6th', 'Union Square', '3rd','1st']);
var S = new Line('S', ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th']);

// Constructor Functions
// Define a Line Constructor Function
// You will use this function to create new Line() objects for each train line
// A line's name and stops (an array) should be passed to the constructor function and stored within the object.
// example of storing name with constructor function: this.name = name
// Define a SubwaySystem Constructor Function
// Every line should be stored within this object
// All of the user prompts should also take place here


function Line (name, stations) {
  this.name = name;
  this.stations = stations;
}

Line.prototype.calculateStations = function(start,finish) {
  var starting_point = this.station.indexOf(start);
  var ending_point = this.station.indexOf(finish);
  var answer = ending_point - starting_point;
  console.log(answer)
}


function subwaySystem () {

}