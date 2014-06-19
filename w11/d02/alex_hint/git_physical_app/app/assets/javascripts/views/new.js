var ExerciseForm = Backbone.View.extend({

  el: "#newForm",

  events: {
    "submit form" : "newExercise"
  },

  initialize: function(){
    this.render();
  },
  render: function(){
    var source = $('#new-exercise-template').html();
    var template = Handlebars.compile( source );
    var view = template();
    this.$el.html( view );
  },
  newExercise: function(e){
    e.preventDefault();
    console.log('new exercise');
    var name = $('#exercise_name').val();
    var calories = $('#exercise_calories').val();
    var difficulty = $('#exercise_difficulty').val();
    var exercise = new Exercise({ name: name, calories: calories, difficulty: difficulty });
    exercise.save();
    router.navigate("/", {trigger: true});
  }
});
