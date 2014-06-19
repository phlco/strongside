var Router = Backbone.Router.extend({
  routes: {
    ""                  : "index",
    "exercises/new"     : "new",
    "exercises/workout" : "workout",
    "exercises/:id"     : "show"
  },

  index: function(){
    var exercises = new Exercises();
    this.view = new ExercisesView({collection: exercises});
  },

  new: function(){
    this.view = new ExerciseForm();
  },

  show: function(id){
    var exercise = new Exercise({ id: id });
    this.view = new ExerciseView({ model: exercise });
  },

  workout: function(){
    var exercises = new Exercises();
    this.view = new WorkoutView({collection: exercises});
  }
});

