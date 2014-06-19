var WorkoutView = Backbone.View.extend({
  el: "#workout",

  initialize: function(){
    this.listenTo(this.collection, "sync add", this.render);
  },

  render: function(){
    var totalCalories = 0;

    // get random three exercises
    this.collection.reset(this.collection.shuffle(), {silent:true});
    var randomExercises = this.collection.first(3);

    // find total calories of the three
    _.each(randomExercises, function(ex){
      totalCalories += ex.attributes.calories;
    });

    // make new collection of subset and make template
    var workout = new Exercises(randomExercises)
    var workoutJSON = workout.toJSON();
    // this can't be the best way tto do this...
    // TODO
    workoutJSON[0].totalCalories = totalCalories;
    var source = $("#workout-template").html();
    var template = Handlebars.compile( source );
    var view = template({ exercises: workoutJSON });
    this.$el.html( view );
  }
})