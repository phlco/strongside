var ExerciseView = Backbone.View.extend({

  el: "#detail",

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    console.log("im here though");
    var source = $("#detail-template").html();
    var template = Handlebars.compile(source);
    this.$el.html( template(this.model.toJSON) );
  }
});
