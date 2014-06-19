var RandomView = Backbone.View.extend({

  el: "#random",
  initialize: function(){
    this.listenTo(this.collection, "sync", this.render);
  },
  render: function(){
    var source = $("#random-template").html();
    var template = Handlebars.compile( source );
    var shuffle = _.shuffle(this.collection.toJSON());
    var random = _.sample(shuffle,3)
    var view = template( {exercises: random});
    this.$el.html( view );
    // var random = _.sample(shuffle,3);

    // console.log(random)

  }
})