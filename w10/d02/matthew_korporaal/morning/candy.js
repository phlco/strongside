Machine = Backbone.Model.extend({
  defaults: {
    candy: 0,
    money: 0,
    location: "nyc",
    price: 0.01
  },

  initialize: function(){
    alert("Welcome to candyland!");
  },

  sell: function () {
    var numCandy = this.get("candy") - 1;
    this.set({ candy: numCandy });
    var total = this.get("money") + this.get("price");
    this.set({ money: total });
  }
});

var machine1 = new Machine({
  location: "broadway",
  money: 3.0,
  price: 0.01,
  candy: 30
});

var machine2 = new Machine({
  location: "fulton",
  money: 1.0,
  price: 0.01,
  candy: 30
});

var machine3 = new Machine({
  location: "canal",
  money: 2.0,
  price: 0.01,
  candy: 30
});

var machine4 = new Machine({
  location: "worth",
  money: 3.0,
  price: 0.01,
  candy: 30
});

var candyMachines = new Machine([
  machine1,
  machine2,
  machine3,
  machine4
]);

console.log( candyMachines.models );