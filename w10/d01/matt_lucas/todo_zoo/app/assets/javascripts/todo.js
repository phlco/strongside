var ToDoView = Backbone.View.extend({
  el: "#todoapp",

  initialize: function (){
    this.$input = $('#new-todo');
    console.log("todo list: make a todo app");
  },

  events: {
    "keypress": "createNewTodo",
    "click .todo-list-item": "upDateToDo"
  },

createNewTodo: function(e){
    console.log(e.which);
    var input = $('#new-todo').val();
    if ((e.which === 13) && (input.length > 0)) {
      var source = $('#header-item').html();
      var template =  Handlebars.compile( source );
      var context = {item: input };
      $('#todo-list-item').append(template(context));

    }
  },

  upDateToDo: function(e) {
    $(e.target).css({'text-decoration':'line-through'});
  }
});






$(document).ready(function(){
  window.toDoView = new ToDoView();
});


// $('#todoapp')