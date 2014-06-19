var ExerciseForm = Backbone.View.extend({
  el: "#exercises",
  events: {
    "click button" : "newExercise"
  },
  initialize: function(){
    this.render();
  },
  render: function(){
    this.$el.html( 'Exercise Name: <input type="text" id="exercise-name"><br>Calories: <input type="text" id="calories"><br>Difficulty: <select id="difficulty"><option value="1">1</option><br><option value="2">2</option><br><option value="3">3</option></select><br><button>Submit</button>' );
  },
  newExercise: function(){
    console.log('new exercise');
    var name = $('#exercise-name').val();
    var calories = $('#calories').val();
    var difficulty = $('#difficulty').val();

    var exercise = new Exercise({name: name, calories: calories, difficulty: difficulty});
    exercise.save();
    router.navigate("/", {trigger: true});
  }
});