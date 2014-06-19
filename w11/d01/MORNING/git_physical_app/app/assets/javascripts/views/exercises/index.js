App.Views.Exercises = Backbone.View.extend({

  el: "#exercises",

  events: {
    "click li"      : "show",
    "click #new"    : "new",
    "click span"    : "destroy",
    "click #random" : "getRandom"
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

  show: function(e){
    var id = $(e.currentTarget).data('id');
    App.router.navigate("/exercises/" + id, {trigger: true});
  },

  new: function(e){
    App.router.navigate("/exercises/new", {trigger: true});
  },

  destroy: function(e){
    e.stopPropagation();
    var id = $(e.currentTarget).closest('li').data('id');
    console.log(id);
    var exercise = this.collection.get(id);
    exercise.destroy();
  },

  getRandom: function(e){
    $.ajax({
      url: "api/exercises/random",
      type: "get",
      dataType: "json"
    }).done(function(workouts){
      console.log(workouts);
    });
  },

  showRandom: function(workouts){
    new App.Views.Workouts({collection: workouts})
  }
});
