var AnimalView = Backbone.View.extend({
  // overriding defaults
  tagName: "li",
  className: "animal",

  initialize: function(animal){
    this.$el.text(animal.name);
  },

  events: {
    "click": "makeRed"
  },

  makeRed: function(){
    this.$el.css({background: "red"});
  }
});
