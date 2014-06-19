var Exercises = Backbone.Collection.extend({
  url: "/api/exercises",

  model: Exercise,

  initialize: function(){
    this.fetch();
  },

  partay: function(){
    this.trigger("champaignPop");
  }
});