var AppView = Backbone.View.extend({
  el: "#todoapp",
  events: {
    "keypress #new-todo": "createNewTodo"
  },

  createNewTodo: function(e){
    if(e.which === 13){
      if($('#new-todo').val()){
        $("#todo-list").append($('<li>').html($('#new-todo').val()));
      }else{
        alert("nothing to add");
      }
    }
  }

});

$(document).ready(function(){
  var appView = new AppView();
})