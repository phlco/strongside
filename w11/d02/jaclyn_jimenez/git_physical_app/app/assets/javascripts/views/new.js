var ExerciseForm = Backbone.View.extend({
  el: "#exercises",
  events: {
    "click button" : "newExercise"
  },
  initialize: function(){
    this.render();
  },
  render: function(){
    this.$el.html( "<input type='text' placeholder='name' id='new-exercise-name'></input><input type='text' placeholder='calories'id='new-exercise-calories'></input><label>difficulty</label><select id='difficulty'><option>1</option><option>2</option><option>3</option></select><button>create new exercise</button>" )
  },
  newExercise: function(){
    console.log('new exercise');
    var name = $('#new-exercise').val();
    var exercise = new Exercise({name: $('#new-exercise-name').val(), calories: $('#new-exercise-calories').val(), difficulty: $('#difficulty').val()})
    exercise.save();
    router.navigate("/", {trigger: true});
  }
})
