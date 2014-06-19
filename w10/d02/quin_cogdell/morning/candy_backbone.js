// js bin http://jsbin.com/uYujiBu/3/edit

Machine = Backbone.Model.extend({
  initialize: function(){
    alert("Welcome to candyland");
  }
});

var m = new Machine();

// Candy (integer | 0 min, 500 max)
// Money (float | 0.00)
// Location (string | is mandatory)
// Owner Id
// Candy Price

var m2 = new Machine({candy: 0, money: 0, location: "NYC", owner: '1', candyPrice: 0.25});


// shorcut for document.ready
// had to use for jsbin
$(function(){

  var m2 = new Machine({candy: 0, money: 0, location: "NYC", owner: 1, candyPrice: 0.25});

  var candy = m2.get("candy");
  var money = m2.get("money");
  var location = m2.get("location");
  console.log(candy + money + location);

});







