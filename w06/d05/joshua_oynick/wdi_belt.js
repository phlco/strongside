var WDIBelt = WDIBelt || {};

WDIBelt.version = 0.2;

WDIBelt.each = function(array, func) {
  for (var index = 0; index < array.length; index++) {
    var element = array[index];
<<<<<<< HEAD
=======
    // call the function in the context of this referring to the element
>>>>>>> 32e2974e3d0fb3562ac7f2f89c4d7e0171a7f96d
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

<<<<<<< HEAD
var s1 = {name: "Bail Organa", allegiance: "Rebel Alliance"};
var s2 = {name: "Mon Mothma", allegiance: "Rebel Alliance"};
var s3 = {name: "Admiral Ackbar", allegiance: "Rebel Alliance"};

var rebelAlliance = [s1, s2, s3];

=======
WDIBelt.select = function(array, func) {
  var results = [];
  this.each(array, function(value, index) {
    debugger;
    if (func(value)) {
      results.push(this);
    }
  });
  return results;
}
>>>>>>> 32e2974e3d0fb3562ac7f2f89c4d7e0171a7f96d
