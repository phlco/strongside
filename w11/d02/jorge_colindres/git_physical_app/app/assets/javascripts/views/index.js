var ExercisesView = Backbone.View.extend({
  el: "#exercises",

  events: {
    "click li" : "detail",
    "click button#new-exercise": "newExercise",
    "click button.delete": "destroy"
  },

  initialize: function(){
    this.listenTo(this.collection, "sync add", this.render);
  },

  render: function(){
    var source = $("#exercises-template").html();
    var template = Handlebars.compile( source );
    var exercisesJSON = this.collection.toJSON();
    var view = template( {exercises: exercisesJSON });
    this.$el.html( view );
  },

  detail: function(e){
    var clicked = e.currentTarget;
    var modelId = $(clicked).data('id');
    router.navigate('/exercises/' + modelId, {trigger: true});
  },

  newExercise: function(e){
    router.navigate('/exercises/new', {trigger: true});
  },

  destroy: function(e){
    e.stopPropagation();
    var clicked = e.currentTarget;
    var $parentLi = $(clicked).parents('li');
    var model = this.collection.get($parentLi.data('id'));
    model.destroy();
    $parentLi.remove();
  }
});
