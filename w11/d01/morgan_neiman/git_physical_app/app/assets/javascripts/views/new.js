var ExerciseForm = Backbone.View.extend({
  el: "#exercises",
  events: {
    "click button" : "newExercise"
  },
  initialize: function(){
    this.render();
  },
  render: function(){
    this.$el.html( "<input type='text' id='new-exercise' placeholder='name'><br><input type='text' id='calories-are-bullshit' placeholder='bullshit'><select id='difficulty'>   <option value='1' id='1'>1</option> <option value='2' id='2'>2</option>  <option value='3' id='3'>3</option> </select><button>create</button>'" );
  },
  newExercise: function(){
    console.log('new exercise');
    var name = $('#new-exercise').val();
    var BULLSHIT = $('#calories-are-bullshit').val();
    var difficulty = $('#difficulty').val();
    var exercise = new Exercise({name: name, calories: BULLSHIT, difficulty: difficulty});
    exercise.save();
    router.navigate("/", {trigger: true});
  }
});
