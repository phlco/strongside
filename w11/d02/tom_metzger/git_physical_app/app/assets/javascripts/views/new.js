var ExerciseForm = Backbone.View.extend({
  el: "#new",
  events: {
    "click button" : "newExercise"
  },
  initialize: function(){
    this.render();
  },
  render: function(){
  	var source = $("#new-exercise").html();
    this.$el.html( source );
  },
  newExercise: function(){
    console.log('new exercise');
    // var data = $('form').serializeArray();
    var data = {name: $("#name").val(), calories: $("#calories").val(), difficulty: $("#difficulty").val()}
    var exercise = new Exercise(data)
    exercise.save();
    router.navigate("/", {trigger: true});
  }
})
