var Exercise = Backbone.Model.extend({
  //goes to the url below with the id that is passed thru the params
  urlRoot: "/api/exercises",
  //when creates, fetches the info
  initialize: function(){
    this.fetch();
  }
});
