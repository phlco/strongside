var AppView = Backbone.View.extend({
  el: "#todoapp",

  events: {
    "keypress #new-todo": "createNewTodo"
  },

  createNewTodo: function(e) {
    console.log(e.which);
    var input = $("#new-todo").val();
    if (e.which === 13 && input !== "") {
      console.log(input);
      $("#todo-list").append('<li>' + input + '</li>');
    }
  }
});

$(document).ready(function() {
  var appView = new AppView();
});
