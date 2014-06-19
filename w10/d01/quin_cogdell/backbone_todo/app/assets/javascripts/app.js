var AppView = Backbone.View.extend({
  el: "#todoapp",

  events: {
    "keypress #new-todo" : "createNewToDo"
  },

  createNewToDo: function(e){
    console.log(e.which);
    // var $input = $("#new-todo").val();
    var $input = this.$el.find("#new-todo");

    if ((e.which === 13) && ($input.val().length > 0)) {
      // debugger
      $list = this.$el.find("#todo-list");
      $list.append("<li>" + $input.val() + "</li>");
      // var $newToDo = "<li>" + $("#todo").text($input) + "</li>";
      // $("#todo-list").append($newToDo);
      $input.val("");
    }
  }
});


$(document).ready(function(){
  var appView = new AppView();
});
