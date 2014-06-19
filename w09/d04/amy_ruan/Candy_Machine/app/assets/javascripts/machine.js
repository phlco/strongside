Owner = Backbone.Model.extend({
  defaults: {
    money: 1000,
    candy: 7000
  },
  initialize: function(){
    alert("Hi Owner");
  }
});

var owner = new Owner({});
var money = owner.get("money");
var candy = owner.get("candy");


Machine = Backbone.Model.extend({
  defaults:{
    candy: 0,
    money: 0.00,
    candy_price: 0.25
  },
  initialize: function(){
    this.on("change:money"),
    this.on("change:money", function(model){
    var money = model.get("money");
    alert("Money: " + money);
    });
  },
  sell_candy: function(num){
    var myCandy = this.get("candy");
    var maxNum;
    if(num < myCandy){
      maxNum = num;
    }
    else{
      maxNum = myCandy;
    }
    var moneyGained = this.get("candy_price")*maxNum;
    var currentMoney = this.get("money");
    var totalMoney = moneyGained + currentMoney;
    this.set({ money: totalMoney});
    var totalCandy = myCandy-maxNum;
    this.set({ candy: totalCandy});
  }
});
