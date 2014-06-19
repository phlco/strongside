
//In your app.js file, create a new Backbone view, called AppView.
var AppView = Backbone.View.extend({
  //AppView's el property should be #todoapp
  el: "#todoapp",
  //Add an events property within AppView,
  //to listen for a keypress on the #new-todo element,
  //and call the function createNewTodo
  events: {
    "keypress #new-todo": "createNewTodo" //should it be 'keypress #new-todo' ?
  },
  createNewTodo: function(e){
    console.log(e.which);
    //Use a conditional statement to check if it is the enter key that was pressed
    if (e.which == '13') {
      // if #new-todo is not blank:
      if ($('#new-todo').val() != null)  {
      //Grab the value of the #new-todo input
        var newTodo = $('#new-todo').val();
      //create a new <li> tag, set its text value to the text from #new-todo, and append it to #todo-list.
        var newLi = $('<li>');
        newLi.html( newTodo );
        this.$el.append(newLi);
      }
    }

  }
});


  var appView = new AppView();
