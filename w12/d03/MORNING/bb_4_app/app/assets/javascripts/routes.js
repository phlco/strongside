App.Router = Backbone.Router.extend({
  routes: {
    ""  : "index"
  },
  initialize: function(){
    Backbone.history.start();
    var user = new App.Models.User()
    App.main = new App.Views.Main({model: user});
  },
  index: function(){
    console.log('index');
  }
});
