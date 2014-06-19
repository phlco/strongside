var Router = Backbone.Router.extend({
  routes: {
    ""             : "index",
<<<<<<< HEAD:w11/d02/jaclyn_jimenez/git_physical_app/app/assets/javascripts/routers/router.js
    "new"          : "new",
    "show/:id"      : "show"
=======
    "exercises"          : "new",
    "random" : "random"
>>>>>>> 7c75350b83675236c763e0440af959fb5f26e84d:w11/d01/MORNING/git_physical_app/app/assets/javascripts/routers/router.js
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
<<<<<<< HEAD:w11/d02/jaclyn_jimenez/git_physical_app/app/assets/javascripts/routers/router.js
  show: function(id){
    console.log('show'+id);
    var exercise = new ExerciseView({id: id});
        exercise.get()
=======
  random: function() {
    randomView = new RandomView();
  }
>>>>>>> 7c75350b83675236c763e0440af959fb5f26e84d:w11/d01/MORNING/git_physical_app/app/assets/javascripts/routers/router.js
});
