var ExercisesView = Backbone.View.extend({

  el: "#exercises",

  events: {
    "click li"    : "detail",
    'click #new'  : "newExercise",
    'click #x'    : "deleteExercise"
  },

  initialize: function(){
    this.listenTo(this.collection, "sync add", this.render);
    this.listenTo(this.collection, "champaignPop", this.party);
  },
  party: function(){
    alert("whoooo");
  },
  render: function(){
    var source = $("#exercises-template").html();
    var template = Handlebars.compile( source );
    var exercisesJSON = this.collection.toJSON();
    var view = template( {exercises: exercisesJSON });
    this.$el.html( view );
  },
  detail: function(e){
    var id = $(e.currentTarget).data('id');
    router.navigate("/exercises/" + id, {trigger: true});

    //hacking it by removing and appending things
    //var id = $(e.currentTarget).data('id');
    // var exercise = this.collection.get(id);
    // var source = $("#detail-template").html();
    // var template = Handlebars.compile( source );
    // var view = template( exercise.toJSON() );
    // this.$el.html( view );
  },
  newExercise: function(){
    router.navigate("/exercises/new", {trigger: true});
  },
  deleteExercise: function(e){
    //stop propagation so it doesn't redirect to the li
    e.stopPropagation();
    //get the button's parent that is li
    var $modelEl = $(e.currentTarget).parents('li');
    //get the parent's id
    var currentId = $modelEl.data().id;
    //get the correct model from the collection
    var currentModel = this.collection.get(currentId);
    //destroy the model
    currentModel.destroy();
    //remove the li from the page
    $modelEl.remove();
  }
});









