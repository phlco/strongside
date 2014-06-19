var ExercisesView = Backbone.View.extend({

  el: "#exercises",

  events: {
    "click li" : "detail",
<<<<<<< HEAD:w11/d02/jaclyn_jimenez/git_physical_app/app/assets/javascripts/views/index.js
    "click h3" : "showForm"
=======
    "click .new": "makeNew",
    "click .delete-button": "deleteExercise",
    "click .random": "randomWorkouts"
>>>>>>> 7c75350b83675236c763e0440af959fb5f26e84d:w11/d01/MORNING/git_physical_app/app/assets/javascripts/views/index.js
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
<<<<<<< HEAD:w11/d02/jaclyn_jimenez/git_physical_app/app/assets/javascripts/views/index.js
    this.$el.html( view + "</br><h3>add new</h3>");
  },
  detail: function(e){
    console.log("detail info")
    var id = $(e.currentTarget).data('id');
    var exercise = this.collection.get(id);
    var source = $("#detail-template").html();
    var template = Handlebars.compile( source );
    var view = template( exercise.toJSON() );
    this.$el.html( view );
  },
  showForm: function(e){
    // e.preventDefault();
    console.log("im in show form");
    // this.trigger("buttonClicked");
    router.navigate("#new", {trigger: true});
=======
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
>>>>>>> 7c75350b83675236c763e0440af959fb5f26e84d:w11/d01/MORNING/git_physical_app/app/assets/javascripts/views/index.js
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
