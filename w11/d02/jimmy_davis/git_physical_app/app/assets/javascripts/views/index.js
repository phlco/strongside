var ExercisesView = Backbone.View.extend({

  el: "#exercises",

  events: {
    "click li" : "detail",
    "click span" : "deleteExercise"
    // make an event here called click span : deleteExercise
    // make function called delete that deletes the exercise from the database
  },

  initialize: function(){
    this.listenTo(this.collection, "sync add remove", this.render);
  },

  render: function(){
    var source = $("#exercises-template").html();
    var template = Handlebars.compile( source );
    var exercisesJSON = this.collection.toJSON();
    var view = template( {exercises: exercisesJSON });
    this.$el.html( view );
  },

  detail: function(e) {
    var id = $(e.currentTarget).data('id');
    var exercise = this.collection.get(id);
    var source = $("#detail-template").html();
    var template = Handlebars.compile( source );
    var view = template(exercise.toJSON());
    this.$el.html( view );
  },

  deleteExercise: function(e) {
    // this is so the click event on the X doesn't effect the li
    e.stopImmediatePropagation();
    console.log("clicked X")
    var id = $(e.currentTarget).parent().data("id");
    var exercise = this.collection.get(id);
    this.collection.remove(exercise);
    exercise.destroy();
  }
});
