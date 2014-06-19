var AppView = Backbone.View.extend({
  el: "#todoapp",
  events: {
    "keypress": "createNewToDo"
  },
  createNewToDo: function(e){
    console.log(e.which);
  };
});

$(document).ready(function(){
  window.appView = new Appview();
})