var AppView = Backbone.View.extend({
  el: '#todoapp',
  events: {
    "keypress #new-todo": "createNewTodo"
  },
  createNewTodo: function(e){
    if( e.keyCode == '13') {
      // alert("getting here");
      var userInput = $('#new-todo').val();
      if(userInput.length > 1) {
      var toDoItem = new ToDoItem({input: userInput});
      $('#todo-list').append(toDoItem.el);
      }
    }
  }
});

var ToDoItem = Backbone.View.extend({
  tagName: "li",
  className: "to-do-item",
  initialize: function(data) {
    this.data = data;
    this.$el.text(this.data.input);
  },
  events: {
    "click": "crossOut"
  },
  crossOut: function() {
    this.$el.css("text-decoration", "line-through");
  }
});


var appView = new AppView();