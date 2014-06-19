var app = app || {};

app.Router = Backbone.Router.extend({
  routes: {
     '': 'home',
     'new': 'editMachine',
     'edit/:id': 'editMachine ',
     ':id/sell': 'sellCandy',
     ':id/refill': 'refillMachine',
     ':id/cashout': 'cashoutMachine'
  }
});
