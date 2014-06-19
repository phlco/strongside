var WorkoutsView = Backbone.View.extend({

  el: "#workouts",

  events: {
    "click button" : "randomWorkouts"
  },

  initialize: function() {
    this.render();
  },

  render: function() {
    this.$el.html( "<button>Random Workouts</button>" );
  },

  randomWorkouts: function(e) {
    console.log("workouts", e);
    var source = $("#exercises-template").html();
    var template = Handlebars.compile( source );
    var exercisesJSON = this.collection.toJSON();
    var view = template( {exercises: exercisesJSON });
    var exercise = this.$el.html( view );
    for(var i = 0, i < 3, i++) {
      exercise[i].shuffle();
    }
  }

})
