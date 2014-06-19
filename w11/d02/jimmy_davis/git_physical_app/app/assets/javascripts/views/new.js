var ExerciseForm = Backbone.View.extend({
  el: "#exercises",
  events: {
    "click button" : "newExercise"
  },
  initialize: function() {
    this.render();
  },
  render: function() {
    this.$el.html( "<input type='text' placeholder='Exercise' id='new-exercise'><input type='text' placeholder='Calories' id='new-cals'><input type='text' placeholder='Difficulty (1, 2, or 3)' id='new-diff'><button>create</button>" );
  },
  newExercise: function() {
    console.log("new exercise");
    var name = $('#new-exercise').val();
    var calories = $('#new-cals').val();
    var difficulty = $('#new-diff').val();
    var exercise = new Exercise({name: name, calories: calories, difficulty: difficulty})
    exercise.save();
    router.navigate("/", {trigger: true});
  }
})
