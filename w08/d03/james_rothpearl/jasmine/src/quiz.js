var QUIZ_TOPICS = ["javascript", "jasmine", "testing", "arrays"];

function sleepIn(options){
  // set options to an empty object if user didn't pass any arguments
  var options = options || {};
  var date = new Date();
  var dayNumber = date.getDay();

  //return true if sat or sun or if it's a vacation
  if (dayNumber === 6 || dayNumber === 0 || options.vacation){
    return true;
  } else {
    return false;
  }
}

function objectBuilder(keys, values){
  var keys = keys || []
  var values = values || []

  var newObj = {};
  for (var i = 0; i < keys.length; i++) {
    debugger;
    newObj[keys[i]] = values [i];
  }
  return newObj;
}


function addItUp()

