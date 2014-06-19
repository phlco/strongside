var Router = Backbone.Router.extend({
  routes: {
    ""                    : "index",
    "new"                 : "new",
    "help/:person"        : "help",
    "exercises/workouts"  : "workouts"
  },

  index: function(){
    console.log("index");
    exercises = new Exercises();
    exercisesView = new ExercisesView({collection: exercises});
  },

  new: function(){
    console.log("new");
    var newForm = new ExerciseForm();
  },

  help: function(person){
    console.log("help", person);
  },

  workouts: function(){
    var workoutsView = new WorkoutsView();
  }
});
