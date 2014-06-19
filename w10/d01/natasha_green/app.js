$(document).ready(function(){

var AppView = Backbone.View.extend({
  el: "#todoapp", //jquery syntax for the id of the todoapp

  events: {
    "keypress #new-todo" : "createNewTodo"
  }, //this is a property on the object and everything after it
//keypress the action and the id selector comes right after


  createNewTodo: function (event) {
    if (event.which === 13) {
      if (this.$('#new-todo').val() !== ""){
        var newTodo = this.$('#new-todo').val();
        $("#todo-list").append('<li>' + newTodo + '</li>');
      }// '<li>' + newTodo + '</li>' combining javascript and html...through concatanation
       //this is talking about the view...
    }//logic goes into the block.
  }
});//an object will have this ending

  var appView = new AppView(); // new is telling the class to give a new object of itself

});
