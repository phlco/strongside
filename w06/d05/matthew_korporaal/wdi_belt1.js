var WDIBelt = WDIBelt || {};

WDIBelt.version = 0.2;

WDIBelt.each = function(array, func) {
  for (var index = 0; index < array.length; index++) {
    var element = array[index];
    func.call(element);
  }
}
// ([1,2,3], funtion(element, index){ console.log(element,index)})

// WDIBelt.eachWithIndex(droids,function(e, i){console.log(this.name, i)})
WDIBelt.eachWithIndex = function(array, func) {
  for (var index = 0; index < array.length; index++) {
    var element = array[index];
    func.call(element, element, index);
  }
}
WDIBelt.map = function(array, func) {
  var results = [];
  for (var index = 0; index < array.length; index++) {
    var element = array[index];
    results.push(func(element));
  }
  return results;
}
