var app = app || {};

app.Users = Backbone.Collection.extend ({
  url: '/users'
});