var Router = Backbone.Router.extend({
  routes: {
    ""              : "index",
    "exercises/new" : "new",
    "exercises/:id" : "show"
  },
  index: function(){
    this.cleanUp();
    console.log("index");
    //create collection to pass into the view
    var exercises = new Exercises();
    this.view = new ExercisesView({ collection: exercises });
  },
  new: function(){
    this.cleanUp();
    console.log('new');
    this.view = new ExerciseForm();
  },
  show: function(id){
    //^^grab the id from the params^^
    this.cleanUp();
    console.log('show');
    //create model to pass into the view
    var exercise = new Exercise({ id: id });
    this.view = new ExerciseView({ model: exercise });
  },
  cleanUp: function(){
    //if the view exists, clean it up
    if(this.view) {
      this.view.$el.empty();
      this.view.undelegateEvents();
      this.view.stopListening();
      this.view = null;
    }
  }
});
