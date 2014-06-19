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