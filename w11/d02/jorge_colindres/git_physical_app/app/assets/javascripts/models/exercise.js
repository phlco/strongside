var Exercise = Backbone.Model.extend({
  urlRoot: "/api/exercises",
  initialize: function(){
    this.fetch();
  }
});
