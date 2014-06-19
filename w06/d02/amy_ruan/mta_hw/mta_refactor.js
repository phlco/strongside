function makeGetRequest(url) {
  return {
    "n": ['grand central', '34th', '28th', '23rd', 'union square', '8th'],
    "l": ['8th', '6th', 'union square', '3rd','1st'],
    "s": ["astor place", "union square", "28th", "33th","grand central"];
  }
}


function Line(name, stops) {
  this.name = name;
  this.stops = stops;
}

Line.prototype.countStops = function(startStop, endStop) {
  var start = this.indexOf(start_stop)
  var end = this.indexOf(endStop)
  var delta = Math.abs(end - start)
  return delta;
}

function SubwaySystem(lines) {
  for (lineString in lines) {
    if (lines.hasOwnProperty(lineString)) {
      var line = new Line(lineString, lines[lineString]);
      this[lineString] = line;
    }
  }
}


function SubwayApp() {
  var linesData = makeGetRequest("http://nyc.go/mta.json");
  this.subwaySystem = new SubwaySystem(linesData);
}

SubwayApp.prototype.run = function() {
  this.promptUser();
  this.subwaySystem.calculateDistance(this.startStop, this...)
}

SubwayApp.prototype.promptUser = function() {
  this.start_stop = this.prompt("What is your starting stop?");
  this.end_stop = this.prompt("What is your ending stop?");

  this.line_start = this.prompt("What is your starting line?");
  this.line_end = this.prompt("What is your ending line?");
}

SubwayApp.prototype.prompt = function(message) {
  return prompt(message).toLowerCase();
}

SubwaySystem.prototype.countStops = function(start, end) {

//variables for the stops arrays
    var start_line_stops = this[new_line_start].stops;
    var end_line_stops = this[new_line_end].stops;
// not the same line need diff equation and need to calculate intersection

    if (new_line_end != new_line_start) {
      //figures out intersecting points with filter
      var total_intersection = start_line_stops.filter(
      function(value) {
        return end_line_stops.indexOf(value) > -1;
      })
      //need to figure out which intersection point is closest
// var a = [1, 2, 3];
// a.forEach(function(n) { console.log(n); })

      //measures start until intersection
      var intersection_start = start_line_stops.indexOf(total_intersection[0]);
      var start_delta = Math.abs(intersection_start - start);
      //measures intersection until end
      var intersection_end = end_line_stops.indexOf(total_intersection[0]);
      var end_delta = Math.abs(end - intersection);
      //measues deltas
      var total_delta = end_delta + start_delta;
      console.log(total_delta);
      return total_delta
  }
    else {
      var delta = Math.abs(end - start)
      console.log(delta);
      return delta
  }
}


var mta = new SubwayApp();
mta.run();

  // mta.l.calculateDistance("Union Square", "Times Square");

  // var ans = mta.countStops('Times Square','8th');

  // console.log("Your travel will take " + ans + " stops")


