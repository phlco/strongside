var Exercises = Backbone.Collection.extend({
	url: "/exercises",
// if you name space the routes you need to update the URL here in the Model
  // url: "/api/exercises",
  model: Exercise,

  initialize: function(){
    this.fetch();
  }
  
});
