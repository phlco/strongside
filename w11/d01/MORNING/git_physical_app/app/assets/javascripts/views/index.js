var ExercisesView = Backbone.View.extend({

  el: "#exercises",

  events: {
    "click li" : "detail",
    "click .new": "makeNew",
    "click .delete-button": "deleteExercise",
    "click .random": "randomWorkouts"
  },

  initialize: function(){
    this.listenTo(this.collection, "sync add", this.render);
    this.listenTo(this.collection, "champaignPop", this.party);
  },
  party: function(){
    alert("whoooo");
  },
  render: function(){
    // this.cleanUp();
    var source = $("#exercises-template").html();
    var template = Handlebars.compile( source );
    var exercisesJSON = this.collection.toJSON();
    var view = template( {exercises: exercisesJSON });
    this.$el.html( view );
    this.$el.append( $('<button>').text("new").attr("class", "new") );
    this.$el.append( $('<button>').text("random").attr("class", "random") )
  },
  makeNew: function() {
    // alert("getting here");
    router.navigate('/exercises', {trigger:true});
  },
  deleteExercise: function(e) {
   var model = this.collection._byId[e.currentTarget.dataset.id];
   console.log(model);
   var that = this;
   // debugger;
   model.destroy({
    success: function() {
      console.log("destroyed");
      that.render();
    }
   });
  },
  randomWorkouts: function(){
    router.navigate('/random', {trigger: true});
  }
  // detail: function(e){
  //   var id = $(e.currentTarget).data('id');
  //   var exercise = this.collection.get(id);
  //   var source = $("#detail-template").html();
  //   var template = Handlebars.compile( source );
  //   var view = template( exercise.toJSON() );
  //   this.$el.html( view );
  // }
});

$(document).ready(function(){


});