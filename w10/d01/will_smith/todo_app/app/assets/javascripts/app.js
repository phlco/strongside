$(document).ready(function(){
  window.appView = new AppView();
});

var AppView = Backbone.View.extend({
  // corresponding DOM element
  el: "#todoapp",

  // events hash
  events: {
    // type of event : function to call
    "keypress #new-todo":  "createNewTodo"
  },

  createNewTodo: function(e) {
    // the event
    if (e.keyCode != 13) return;
    var toDo = this.$el.find('input').val();
    var $li = $('<li>').text(toDo);
    $('#todo-list').append($li);
    $('input').val('');
  }
});
