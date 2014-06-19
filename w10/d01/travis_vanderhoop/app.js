var AppView = Backbone.View.extend({
  // sets the view's 'el' (element) to the section tag with id "todoapp"
  el: "#todoapp",

  events: {
    "keypress #new-todo" : "createNewTodo"
  },

  createNewTodo: function(e){
    var todo,
        userInput = $('#new-todo').val(),
        todoList = $('#todo-list');
    // standard English letters
    var pressedChar = String.fromCharCode(e.which);
    if (e.which == 13 && userInput != "") {
      todo = $('<li>').text(userInput);
      console.log(todo);
      todoList.append(todo);
    }
  } // createNewTodo()

}); // AppView


$( document ).ready(function() {
  console.log("What up girl?");
  appView = new AppView();
});


var CandyMachine = Backbone.Model.extend({
  initialize: function(){
    console.log("Yo check it. It worked")
  }
});
