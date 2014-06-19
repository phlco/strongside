var Router = Backbone.Router.extend({
  routes: {
    "": "index",
    "exercises/new": "new",
    "exercises/:id": "show"
  },
  initialize: function(){
    this.view = null;
  },
  index: function(){
    this.cleanUp();
    exercises = new Exercises();
    this.view = new ExercisesView({collection: exercises});
  },
  new: function(){
    this.cleanUp();
    this.view = new ExerciseForm();
  },
  show: function(id){
    this.cleanUp();
    var model = new Exercise({id: id});
    this.view = new ExerciseView({model: model});
  },
  cleanUp: function() {
    if(this.view) {
      this.view.$el.empty();
      this.view.undelegateEvents();
      this.view.stopListening();
      this.view = null;
    }
  }
});
