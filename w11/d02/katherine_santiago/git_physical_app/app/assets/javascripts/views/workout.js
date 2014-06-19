var WorkoutView = Backbone.View.extend({
  el: "#randworkout",
  initialize: function() {
    this.listenTo(this.collection, "sync add", this.render);
  },
  render: function(){
    var sample = _.sample(this.collection.models, 3);
    var jsonSample = sample.map(function(obj){
      return obj.toJSON();
    });
    var source = $("#exercises-template").html();
    var template = Handlebars.compile( source );
    var view = template( {exercises: jsonSample });
    this.$el.html( view );
  }
});