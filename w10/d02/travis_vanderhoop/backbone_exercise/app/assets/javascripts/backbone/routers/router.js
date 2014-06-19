var Router = Backbone.Router.extend({
  // routes allow different actions depending on the routes that are input/ask for
  routes: {
    // here, the url triggers a route called home
    '':'home',
    'new':'editUser',
    'edit/:id': 'editUser'
  }
}); // Router Backbone Router.extend();
