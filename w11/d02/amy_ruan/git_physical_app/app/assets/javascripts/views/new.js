var ExerciseForm = Backbone.View.extend({
  el: "#exercises",
  events: {
    "click button" : "newExercise"
  },
  initialize: function(){
    this.render();
  },
  render: function(){
    var source = $("#exercises-form-template").html();
    var template = Handlebars.compile(source);
    this.$el.html(template);
  },
  newExercise: function(){
    console.log('new exercise');
    var name = $('#new-exercise').val();
    var exercise = new Exercise({name: name})
    exercise.save();
    router.navigate("/", {trigger: true});
  }
})
