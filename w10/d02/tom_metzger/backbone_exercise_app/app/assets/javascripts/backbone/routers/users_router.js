var Router = Backbone.Router.extend({
  // backbone router takes object called routes
  // can specify different actions depending on what route is in the browser navigation
  routes: {
    '': 'home',  //this loads home route (root route) and calls it 'home'
    'new' : 'editUser',
    'edit/:id' : 'editUser' //id from route is passed into the function "editUser "
  }
});
