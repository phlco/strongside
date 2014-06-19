CandyMachine = Backbone.Model.extend({

  defaults: {
    candy: 0, //do I set a max value here?
    money: 0.00,
    location: "to be set",
    candyPrice: 0.25
  },

  initialize: function(){
    alert("new machine created");
    this.on("change:money", function(e){
      var money = e.get("money");
      alert("You now have $" + money);
    })
  },

  sell: function(insertMoney){
    var currentMoney = this.get("money");
    var price = this.get("candyPrice");
    var currentCandy = this.get("candy")
    if (insertMoney === price && currentCandy > 0){
      this.set({candy: currentCandy - 1});
      this.set({money: currentMoney + price});
    } else {
      alert("no candy for you");
    }
  }

  // fill: function(){
  //   // dispense one candy
  //   // take add candyPrice to money
  // }

});


var candyMachine = new CandyMachine();





