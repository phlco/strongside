var Router = Backbone.Router.extend({
  routes: {
    ""             : "index",
    "new"          : "new",
    "exercises/new": "newWorkout"
  },

  index: function(){
    exercises = new Exercises();
    exercisesView = new ExercisesView({collection: exercises});
  },
  new: function(){
    newForm = new ExerciseForm();
  },
  newWorkout: function(){
    newWorkout = new WorkoutForm();
  },
});
