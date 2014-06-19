var AppView = Backbone.View.extend({
  el: '#todoapp',

  events: {
    "keydown": "createNewTodo"
  },

  createNewTodo: function (e){
    var input = this.$el.find('#new-todo');
    var textInput = input.val();

    if (e.which == '13' && textInput != "") {
      $('#todo-list').append('<li>' + textInput + '</li>');
      input.val("")
    }
  }

});

$(document).ready(function(){
  window.appView = new AppView();
});
