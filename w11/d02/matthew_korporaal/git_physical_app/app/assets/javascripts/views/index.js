var ExercisesView = Backbone.View.extend({

  el: "#exercises",

  events: {
    "click li"            : "detail",
    "click #new-exercise" : "newExercise",
    "click #remove-ex"    : "removeExercise",
    "click #new-workout"  : "newWorkout"
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
    var view = template({ exercises: exercisesJSON });
    this.$el.html( view );
  },

  detail: function(e){
    this.$el.remove();
    var id = $(e.currentTarget).data('id');
    router.navigate("/exercises/" + id, { trigger: true });
  },

  newExercise: function(){
    this.$el.remove();
    router.navigate("/exercises/new", { trigger: true });
  },

  removeExercise: function(e){
    e.stopPropagation();
    // get the parent id
    var $exEl = $(e.currentTarget).parents('li');
    var exId = $exEl.data().id;
    // find the model
    var exModel = this.collection.get(exId);
    // delete exercise from db
    exModel.destroy();
    // remove from view
    $exEl.remove()
  },

  newWorkout: function(){
    this.$el.remove();
    router.navigate("/exercises/workout", { trigger: true })
  }

});
