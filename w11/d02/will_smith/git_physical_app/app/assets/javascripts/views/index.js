var ExercisesView = Backbone.View.extend({

  el: "#exercises",

  events: {
    "click #exercise-detail"  : "detail",
    "click #new-exercise"     : "addWorkout",
    "click #delete-exercise"  : "removeWorkout"
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
    var exercise = this.collection.get(id);
    var source = $("#detail-template").html();
    var template = Handlebars.compile( source );
    var view = template( exercise.toJSON() );
    this.$el.html( view );
  },
  addWorkout: function(e){
    router.navigate("/exercises/new", {trigger: true});
    $(e.currentTarget).remove();
  },
  removeWorkout: function(e){
    var id = $(e.currentTarget).data('id');
    var exercise = this.collection.get(id);
    exercise.destroy({
        success: function () {
            alert('Destroyed');
        }
    });
    router.navigate("", {trigger: true});
  }
});
