var WDIBelt = WDIBelt || {};

WDIBelt.version = 0.2;

WDIBelt.each = function(array, func) {
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

var s1 = {name: "Bail Organa", allegiance: "Rebel Alliance"};
var s2 = {name: "Mon Mothma", allegiance: "Rebel Alliance"};
var s3 = {name: "Admiral Ackbar", allegiance: "Rebel Alliance"};

var rebelAlliance = [s1, s2, s3];

