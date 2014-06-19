var AppView = Backbone.View.extend({
  el: "#todoapp",

  initialize: function(){
    console.log("created app view");
  },

  events: {
    "keypress": "createNewTodo"
  },

  createNewTodo: function(e){
    var input = $('#new-todo').val();
    var todo = this.$el.find("input[id=new-todo]").val();
    if ((e.which === 13) && (input.length > 0)) {
      $('#todo-list').append("<li>" + todo + "</li>");
      $('#new-todo').val('');
    }
  }
});


$(document).ready(function(){
  window.appView = new AppView();
});