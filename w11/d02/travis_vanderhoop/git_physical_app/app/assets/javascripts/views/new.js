var ExerciseForm = Backbone.View.extend({
  el: "#exercises",
  events: {
    "click button" : "newExercise"
  },
  initialize: function(){
    this.render();
  },
  render: function(){
    this.$el.html( "<input type='text' placeholder=\"name of exercise\"id='new-exercise'><input type='text' placeholder=\"calories per hour\" id='new-calories'><select id=\"new-difficulty\"><option value=\"1\">1</option><option value=\"2\">2</option><option value=\"3\">3</option></select><button>Create New Exercise</button>" );
  },
  newExercise: function(){
    console.log('new exercise');
    var name = $('#new-exercise').val();
    var calories = $('#new-calories').val();
    var difficulty = $('#new-difficulty').val();
    var exercise = new Exercise({name: name, calories: calories, difficulty: difficulty });
    exercise.save();
    // Travis, the functions handle navigation with router.navigate(routeString, optionsHash) !!!!!
    router.navigate("/", {trigger: true});
  }
});
