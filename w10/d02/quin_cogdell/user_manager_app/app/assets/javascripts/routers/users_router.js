var app = app || {};

app.Router = Backbone.Router.extend({
  routes: {
    "": "home",
    "new": "editUser",
    'edit/:id': 'editUser'
  }
});
