CandyMachine = Backbone.Model.extend({

  defaults: ({
    name: "Candy Machine",
    money: 20,
    candies: 200,
    location: "CandyLand",
    candyPrice: 0.25
  }),

  initialize: function(){
    alert("I am alive!");
  },

  sell: function(){
    this.set({candies: this.get("candies")-1});
    this.set({money: this.get("money") + this.get("candyPrice")});
    console.log(this.get("candies"));
    console.log(this.get("money"));
  }

});

var candyMachine = new CandyMachine({
  name: "Sweetie",
  money: 20,
  candies: 200,
  location: "902 broadway",
  candyPrice: 0.25
});

candyMachine.sell()
