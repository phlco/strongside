App.Views.Exercise = Backbone.View.extend({

  el: "#detail",
  template: Handlebars.compile( $("#detail-template").html() ),

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    this.$el.html( this.template(this.model.toJSON) );
  }
});
