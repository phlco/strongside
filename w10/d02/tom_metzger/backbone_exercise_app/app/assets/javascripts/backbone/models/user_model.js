var User = Backbone.Model.extend({
  urlRoot: '/users',
  //backbone knows how to append ids to urlRoot and it knows what type of request to submit given the request
});
