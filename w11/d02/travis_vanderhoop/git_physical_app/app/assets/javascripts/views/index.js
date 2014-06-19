var ExercisesView = Backbone.View.extend({

  el: "#exercises",

  events: {
    "click li" : "detail",
    // if you click the X, it's going to fire the 'destroy' method.
    "click span" : "destroy",
    // to get this event to register, I had to generate the button IN THIS VIEW (the last list of the render function).
    // These events must not work on elements already on the page.
    "click #generate-random" : "genWorkout"
  },

  initialize: function(){
    this.listenTo(this.collection, "sync add", this.render);
    this.listenTo(this.collection, "champaignPop", this.party);
  },

  genWorkout: function(){
    console.log('about to generate a random workout');
    // sends the user to the router specified. now need to go to the router
    // and give this URL an event handler
    router.navigate("/exercises/workout", {trigger: true});
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
    this.$el.append('<button id="generate-random">Generate Random Workout</button>');
  },

  detail: function(e){
    var id = $(e.currentTarget).data('id');
    var exercise = this.collection.get(id);
    var source = $("#detail-template").html();
    var template = Handlebars.compile( source );
    var view = template( exercise.toJSON() );
    this.$el.html( view );
  },

  destroy: function(e) {
    console.log('destroy');
    var id = e.currentTarget.id;
    var exercise = new Exercise({ id: id });
    // removes entire <li> from the view
    e.currentTarget.parentElement.parentElement.parentElement.remove();
    exercise.destroy();
    e.stopPropagation();
  }

});
