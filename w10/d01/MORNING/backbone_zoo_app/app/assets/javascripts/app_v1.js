var ZooView = Backbone.View.extend({
  // corresponding DOM element
  el: "#zoo",

  // gets called with new ZooView()
  initialize: function(){
    console.log("making a zoo view");
  },

  // events hash
  events: {
    // type of event : function to call
    "click": "welcome",
    // delegate events to other DOM elements in the view
    "mouseover section" : "highlight"
  },

  highlight: function(e) {
    // the event
    console.log(e);
    // the view object
    console.log(this);
    // only highlight the section
    this.$el.find('section').css({backgroundColor: "yellow"});
  },

  // function called on click
  welcome: function(e){
    alert("Welcome to the Zoo");
  }
});

var JungleView = Backbone.View.extend({
  // sets an id on the element NOT on the DOM
  id: "jungle",

  // gets called at new JungleView()
  initialize: function(){
    console.log("making a jungle view");
    // calls render, sets text
    this.render();
    // applies element to DOM
    $('body').append(this.el);
  },
  // events hash
  events: {
    "click": "watchOut"
  },
  // updates DOM element
  render: function() {
    this.$el.text("Welcome to the Jungle");
    // best practice to
    // return the view Object for chaining
    return this;
  },

  watchOut: function(){
    this.$el.text("Watch out for the tree");
    return this;
  }
});



$(document).ready(function(){
  window.zooView = new ZooView();
  window.jungleView = new JungleView();
});
