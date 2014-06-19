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
  var newObj = {};
  for(var i=0;i < keys.length;i++){
    newObj[keys[i]] = values[i];
  }
  return newObj;
}

function addItUp(){
  var sum = 0;
  debugger;
  for(var i = 0; i < arguments[0].length; i++){
    for(var j = 0; j < arguments[i][0].length; j++){
      sum += arguments[i][j];
    }
  }
  return sum;
}

function arrayCount(array){
  var arrSum = 0;
  for(var i = 0; i < array.length; i++){
    if (typeof array[i] === "Array"){
      arrSum++;
    }
  }
}