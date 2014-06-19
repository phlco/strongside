var Router = Backbone.Router.extend({
  routes: {
    ""             : "index",
    "exercises"          : "new",
    "random" : "random"
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
  random: function() {
    randomView = new RandomView();
  }
});
