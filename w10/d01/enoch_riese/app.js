console.log("in working order")
var AppView = Backbone.View.extend({
  el: "#todoapp",

  events: {
    "keypress #new-todo": "createNewTodo"
  },

  createNewTodo: function(e) {
    key = e.which;
    if (key == 13 && $("#new-todo").val()) {
      var task = $("<li>").text($("#new-todo").val())
      $("#todo-list").append(task)
      $("#new-todo").val("")
    }
  }
});
var appView = new AppView();
