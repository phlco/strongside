App.Views.ExercisesNew = Backbone.View.extend({

  el: "#detail",
  template: Handlebars.compile( $('#new-exercise-template').html() ),

  events: {
    "click button" : "createExercise"
  },

  initialize: function(){
    this.listenTo(this.model, "sync", this.close)
    this.render();
  },

  render: function(){
    this.$el.html( this.template() );
  },

  createExercise: function(e){
    e.preventDefault();
    var name = $('#exercise-name').val();
    var calories = $('#exercise-calories').val();
    var difficulty = $('#exercise-difficulty').val();
    this.model.set({name: name, calories: calories, difficulty: difficulty});
    this.model.save();
  },

  close: function(){
    this.remove();
    App.router.navigate("/exercises", {trigger: true});
  }
})
