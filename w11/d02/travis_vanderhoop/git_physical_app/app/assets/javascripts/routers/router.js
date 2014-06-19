var Router = Backbone.Router.extend({
  routes: {
    // when someone goes to "localhost:3000/" the index function(seen below) is called
    // and the console logs "index"
    ""             : "index",
    // when someone goes to "localhost:3000/#new", the new function
    // fires, creating a new ExerciseForm
    "new"          : "new",
    "exercises/workout" : "workout"
  },

  index: function(){
    console.log("index");
    // when you go to the index page, a new collection is created
    // and a new view that takes that collection
    exercises = new Exercises();
    exercisesView = new ExercisesView({collection: exercises});
  },

  help: function(){
    console.log("help");
  },

  new: function(){
    console.log('new');
    newForm = new ExerciseForm();
  },

  workout: function(){
    console.log("the router is registering the route change and firing the function that will create the workoutView");
    var workoutView = new WorkoutView();
  }

}); // Router.extend
