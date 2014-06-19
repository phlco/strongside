var Router = Backbone.Router.extend({
  routes: {
    ""             : "index",
    "new"          : "new",
    "exercises/new" : "new",
    "exercises/workout": "random"
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
  random: function(){
    console.log("random");
    exercises = new Exercises();
    randomView = new RandomView({collection: exercises});
  }
});
