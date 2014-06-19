var ExerciseForm = Backbone.View.extend({
  el: "#new-exercise",

  events: {
    "click #new-ex-button" : "newExercise"
  },

  initialize: function(){
    this.render();
  },

  render: function(){
    var source = $('#new-ex-template').html();
    var template = Handlebars.compile( source );
    this.$el.html( template() );
  },

  newExercise: function(){
    var name = $('#new-ex-name').val();
    var calories = $('#new-ex-calories').val();
    var difficulty = $('#new-ex-difficulty').val();
    var exercise = new Exercise({ name: name, calories: calories, difficulty: difficulty });
    exercise.save();
    this.$el.remove();
    router.navigate("/", {trigger: true});
  }
});
