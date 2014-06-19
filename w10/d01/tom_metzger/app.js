var AppView = Backbone.View.extend({

  el: "#todoapp",

  events: {
    "keypress" : "createNewTodo"
  },

  createNewTodo: function(e) {
    var toDo;
    if (e.which === 13 && $("#new-todo").val() !== ""){
      toDo = $("#new-todo").val();
      $("#todo-list").append($("<li>").text(toDo))
      $("#new-todo").val("");
    }
  }

})


$(document).ready(function(){

  var appView = new AppView();
})
