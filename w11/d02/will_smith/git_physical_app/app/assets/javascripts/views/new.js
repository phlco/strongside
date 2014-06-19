var ExerciseForm = Backbone.View.extend({
  el: "#exercises",
  events: {
    "click button" : "newExercise"
  },
  initialize: function(){
    this.render();
  },
  render: function(){
    this.$el.html( "<input type='text' id='new-exercise'><button>create</button>" );
  },
  newExercise: function(){
    var name = $('#new-exercise').val();
    var exercise = new Exercise({name: name});
    exercise.save();
    router.navigate("/", {trigger: true});
  }
});

var WorkoutForm = Backbone.View.extend({
  el: "#workouts",
  events: {
    "click button" : "newWorkout"
  },
  initialize: function(){
    this.render();
  },
  render: function(){
    this.$el.html("<form>" +
      "<input type='text' id='exercise-name' placeholder='name'>" +
      "<input type='text' id='exercise-calories' placeholder='calories'>" +
      "<select id='exercise-difficulty'>" +
      "<option value>Difficulty</option>" +
      "<option value='1'>1</option>" +
      "<option value='2'>2</option>" +
      "<option value='3'>3</option>" +
      "</select>" +
      "<button>Create New Exercise</button>" +
      "</form>");
  },
  newWorkout: function(){
    var name = $('#exercise-name').val();
    var calories = $('#exercise-calories').val();
    var difficulty = $('#exercise-difficulty').val();
    var exercise = new Exercise({
      name: name,
      calories: calories,
      difficulty: difficulty
    });
    exercise.save();
    router.navigate("/", {trigger: true});
  }
});
