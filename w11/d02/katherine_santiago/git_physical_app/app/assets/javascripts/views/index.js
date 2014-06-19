var ExercisesView = Backbone.View.extend({

  el: "#exercises",

  events: {
    "click li" : "detail",
    "click button.destroy" : "destroy",
    "click button#random" : "random"
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

    router.navigate("/exercises/" + id, {trigger: true});
    // var source = $("#detail-template").html();
    // var template = Handlebars.compile( source );
    // var view = template( exercise.toJSON() );
    // this.$el.html( view );
  },
  destroy: function(e){
    // prevents other listenTo event from happening during initialize
    e.stopPropagation();
    // e.currentTarget - the event's current target is the button
    var button = e.currentTarget;
    // finds the parent element that you want to remove
    var li = $(button).parent().parent();
    // knows the id because we passed id in exercise.html.haml
    var dataId = li.data("id");
    // gets particular id from the collection
    var model = this.collection.get(dataId);
    // removes it on server side, client side
    model.destroy();
    // removes the dom representation
    li.remove();
  },
  random: function(){
    router.navigate("/exercises/workout", {trigger: true});
  }
});
