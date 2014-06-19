var AppView = Backbone.View.extend({
  el: '#todoapp',
  events: {
    'keypress': 'createNewTodo'
  },
  createNewTodo: function(e){
    var $input = this.$el.find('input');
    if (e.which === 13 && $input.val()) {
      var newTodoItem = $input.val();

      $('<li>').text(newTodoItem)
               .appendTo($('#todo-list'));

      $input.val('');
    }
  }
});

$(function(){
  var appView = new AppView();
});
