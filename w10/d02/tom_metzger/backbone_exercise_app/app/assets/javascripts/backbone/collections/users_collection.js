var Users = Backbone.Collection.extend({
  url: '/users'  //in backbone /users returns a list of users
  // need to use an ajax prefilter to modify the base url of all ajax requests
  // required if hosting servers externally to client
  // model:User
});
