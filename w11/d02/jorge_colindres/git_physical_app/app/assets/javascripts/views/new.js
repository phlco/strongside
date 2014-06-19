var ExerciseForm = Backbone.View.extend({
  el: '#new',
  events: {
    'submit form': 'create'
  },
  initialize: function(){
    this.render();
  },
  render: function(){
    var source = $("#new-exercise-template").html();

    // Don't need to compile through Handlebars, but
    // I'll leave it in there to get used to how it works
    var template = Handlebars.compile( source );
    var view = template();
    this.$el.html( view );
  },
  create: function(e){
    e.preventDefault();
    var name = $('#exercise_name').val();
    var calories = $('#exercise_calories').val();
    var difficulty = $('#exercise_difficulty').val();
    var newExercise = new Exercise({name: name, calories: calories, difficulty: difficulty});
    newExercise.save();
    router.navigate('/', {trigger: true});
  }
});
