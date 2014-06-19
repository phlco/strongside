var ExercisesView = Backbone.View.extend({

  el: "#exercises",

  events: {
    "click li" : "detail"
  },

  initialize: function(){
    this.listenTo(this.collection, "sync add", this.render);
    this.listenTo(this.collection, "party", this.party);
  },

  party: function() {
    alert("wooooo");
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
    var view = template( exercise.toJSON() );
    this.$el.html( view );
  },
});
