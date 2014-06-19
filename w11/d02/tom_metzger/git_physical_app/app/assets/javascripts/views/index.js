var ExercisesView = Backbone.View.extend({

  el: "#exercises",

  events: {
    "click li" : "detail",
    "click span" : "remove"
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
    var id = $(e.currentTarget).data('id');
    var exercise = this.collection.get(id);
    var source = $("#detail-template").html();
    var template = Handlebars.compile( source );
    var view = template( exercise.toJSON() );
    this.$el.html( view );
  },

  remove: function(e){
    e.stopImmediatePropagation();
    var id = $(e.currentTarget.parentElement).data();
    var exercise = this.collection.where(id);
    // no method destroy... still working on this part
    exercise.destroy({
          success: function(removed_exercise, data) {
              self.collection.remove(removed_exercise);
          },
          error: function(aborted_exercise, response) {
              // Error handling as needed.
              console.log(response);
          }
      });
  }
});
