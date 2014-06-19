var app = app || {};

// var Router = Backbone.Router.extend({

app.Router = Backbone.Router.extend({
    routes: {
      "": "home",
      "edit/:id": "edit",
      "new": "edit",
    }
});