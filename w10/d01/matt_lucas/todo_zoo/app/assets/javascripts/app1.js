var ZooView = Backbone.View.extend({
  // coresponding DOM element
  el: "#zoo",

  // gets called with new ZooView()
  initialize: function(){
    console.log("making a zoo view");
  },

  // events hash
  events: {
  // type of event : functio to call
    "click": "welcome",
    "mouseover section" : "highlight",
  },

  highlight: function(e){
    // the event
    console.log(e);
    // the view object
    console.log(this);
    this.$el.find('section').css({backgroundColor: "yellow"});
  },

  // function called on click
  welcome: function(e){
    alert("welcome to the zoo");
  },

});

var JungleView = Backbone.View.extend({
  // set id on a floating element
  id: "jungle",

  // gets called on new jungle view ()
  initialize: function(){
    console.log("making a jungle view");
    // calls render and sets text and applies element to DOM
    $('body').append(this.render().el);
  },

  events: {
    "click": "watchOut"
  },

  // updates DOM element
  render: function(){
    this.$el.text("Welcome to the jungle");
    return this;
  },

  watchOut: function(){
    this.$el.text("watch out for the tree");
  },

});


$(document).ready(function(){
  window.zooView = new ZooView();
  window.jungleView = new JungleView();
});