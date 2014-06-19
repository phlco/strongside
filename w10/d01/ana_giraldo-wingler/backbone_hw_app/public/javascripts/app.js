var AppView = Backbone.View.extend({
  el: "#todoapp",
  events: {
    "keypress": "createNewToDo"
  },
  createNewToDo: function(e){
    // use a conditional to check it the 'enter' key was pressed
    if (e.which == 13 && $('#new-todo').val() !== "") {
      $newItem = $('<li>').append($('#new-todo').val());
      $('#todo-list').append($newItem);
      $('#new-todo').val("");
    }
  }
});

$(document).ready(function(){
  window.appView = new AppView();
})