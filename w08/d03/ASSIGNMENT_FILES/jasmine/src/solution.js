var QUIZ_TOPICS = ["javascript", "jasmine", "testing", "arrays"];


function addItUp(collection) {
  var result = 0;
  function add(collection) {
    for (var i = 0; i < collection.length; i++) {
    var element = collection[i];
    if (typeof element === "number") {
      result += element;
    } else {
      if (Array.isArray(element)) {
        add(element);
      }
    }
  }
  return result;
  }
  return add(collection);
}

function sleepIn(opt) {
  opt = opt || {};
  if (opt['vacation']) { return true; }
  var date = new Date();
  if ( date === 5 || date === 6) {
    return true;
  } else {
    return false;
  }
}

function arrayCount(collection) {
  var result = 0;

  function count(array) {
    if ( Array.isArray(array) ) {
      result += 1;
      for (var i = 0; i < array.length; i++) {
        count(array[i])
      }
    };
    return result;
  }

  return count(collection);
}

function objectBuilder(keys, values) {
  var obj = {};
  for (var i = 0; i < keys.length; i++) {
    obj[keys[i]] = values[i];
  }
  return obj;
}
