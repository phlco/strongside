var app = app || {};

app.Router = Backbone.Router.extend({
    routes: {
      "": "home",
      "edit/:id": "edit",
      "new": "edit",
    }
});
