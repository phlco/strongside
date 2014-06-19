var ZooView = Backbone.View.extend({
  el: "#zoo",

  events: {
    "click button": "makeAnimal"
  },

  initialize: function(data) {
    // sets data from new ZooView as an attribute
    this.data = data;
    this.$el.find("h1").text("Welcome to the " + this.data.name);
  },

  makeAnimal: function(e){
    console.log("Making Animal");
    var name = this.$el.find('input').val();
    var animalView = new AnimalView({name: name});
    // appending new Animal liTag.
    $("#animals").append(animalView.el);
  }
});

var AnimalView = Backbone.View.extend({
  // overriding defaults
  tagName: "li",
  className: "animal",

  initialize: function(animal){
    this.template =  Handlebars.compile( $('#entry-template').html() );
    this.$el.html(this.template(animal));
  },
  events: {
    "click": "makeRed"
  },
  makeRed: function(){
    this.$el.css({background: "red"});
  }
});

$(document).ready(function(){
  window.zooView = new ZooView({name: "Zooniverse"});
});