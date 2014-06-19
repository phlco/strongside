var Router = Backbone.Router.extend({
  routes: {
    ""              :   "index",
    "new"           :   "new"
    // "exercises/new" :   "newExercise",
    // "show"          :   "show",
    // "help"          :   "help"
  },

  index: function(){
    console.log("index");
    exercises = new Exercises();
    var exercisesView = new ExercisesView({collection: exercises});
  },

    new: function(){
    console.log('new');
    newForm = new ExerciseForm();
  }


  // newExercise: function(){
  //   console.log("new")
  //   newView = new newExerciseView({});
  // },

  // show: function(){
  //   console.log("show");
  //   exercise = new Exercise;
  // },

  // help: function(){
  //   console.log("help");
  // }
  
});
