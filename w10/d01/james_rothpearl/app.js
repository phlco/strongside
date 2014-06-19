var AppView = Backbone.View.extend({

  el: "#todoapp",


  initialize: function(){
    console.log("making the todo app view");
  },

  events: {
    "keypress #new-todo": "createNewTodo"
  },

  createNewTodo: function(event) {
    console.log(event);


    // if press enter AND there is text
    if (event.which == '13' && $(event.target).val()){

      var task = $('#new-todo').val();
      console.log(task);

      // $('<li>').text(task).appendTo('#todo-list');

      var source = $('#li-checkbox').html()
      var template = Handlebars.compile(source);

      var context = {task: task}
      $('#todo-list').append(template(context));

    }
  }


});

$(document).ready(function() {
  var appView = new AppView();
});



