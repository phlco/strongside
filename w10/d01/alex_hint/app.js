var AppView = Backbone.View.extend({
  el: "#todoapp",

  events: {
    "keypress #new-todo": "createNewTodo"
  },

  createNewTodo: function(e) {
    //shows you the event
    console.log(e);
    //show you which key was pressed
    console.log(e.which);
    //make sure it's not blank and enter was pressed
    //enter -- e.which = 13
    //get the text input
    var textInput = $("#new-todo").val();
    if (e.which === 13 && textInput === "") {
      //checking if the if is working
      //alert('empty string');
      alert('please enter a thing to do!');
    } else if (e.which === 13) {
      //checking if the if is working
      //alert('entered stuff string: ' + textInput);
      $('#todo-list').append('<p>' + textInput + '</p>');
      $("#new-todo").val('');
    }
  }

});

$(document).ready(function(){
  var appView = new AppView();
});
