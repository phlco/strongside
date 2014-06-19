var Router = Backbone.Router.extend({
  routes: {
    ""                : "index",
    "exercises/new"   : "new",
    "exercises/workout" : "workout",
    "exercises/:id"   : "show"
  },

  index: function(){
    console.log("index");
    this.cleanUp();
    var exercises = new Exercises();
    this.view = new ExercisesView({collection: exercises});
  },

  new: function(){
    console.log('new');
    this.cleanUp();
    this.view = new ExerciseForm();
  },

  show: function(id){
    console.log(id);
    this.cleanUp();
    var exercise = new Exercise( {id:id} );
    this.view = new ExerciseView({model: exercise});
  },

  workout: function(){
    console.log('workout');
    this.cleanUp();
    var exercises = new Exercises();
    this.view = new WorkoutView({collection: exercises});
  },

  cleanUp: function(){
    if(this.view){
      this.view.$el.empty();
      this.view.undelegateEvents();
      this.view.stopListening();
      this.view = null;
    }
  }
});
