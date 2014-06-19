var ExerciseForm = Backbone.View.extend({

  el: "#exercises",
  events: {
    "click button" : "newExercise"
  },
  initialize: function() {
    this.render();
  },

  render: function(){
    this.$el.append( '<form id="new-exercise"><br>Exercise: <input type="text" id="name"><br>Calories: <input type="text" id="calories"><br>');
    this.$el.append( 'Dificulty: <select id="difficulty"><option value="1">1</option><br><option value="2">2</option><br><option value="3">3</option></select>' );
    this.$el.append('</form><br><button>Create</button>');
  },

  newExercise: function(){
    console.log('new exercise');
    // var name = $('#new-exercise').val();
    var name = $('#name').val();
    var calories = $('#calories').val();
    var difficulty = $('#difficulty').val();
    var exercise = new Exercise({name: name, calories: calories, difficulty: difficulty});
    exercise.save();
    router.navigate("/", {trigger: true});
  }

});