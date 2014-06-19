var Router = Backbone.Router.extend({
  routes: {
    ""             : "index",
    "help"         : "help",
    "new"          : "new",
    "exercises/new": "new",
    "exercises/workout" : "workout"
  },


  index: function(){
    console.log("index");
    exercises = new Exercises();
    exercisesView = new ExercisesView({collection: exercises});
  },

  new: function(){
    console.log('new');
    newForm = new ExerciseForm();
  },

  help: function(){
    console.log("help");
  },

  navigate: function() {
    console.log("should go back to the /");
  },
});
