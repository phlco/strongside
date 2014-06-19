App.Views.Main = Backbone.View.extend({
  el: "#main",
  events: {
    "click #signup_button"  : "showSignup",
    "click #login_button"   : "showLogin",
  },
  initialize: function(){
    this.signup = new App.Views.Signup({model: this.model});
    this.login = new App.Views.Login({model: this.model});
  },
  showSignup: function(e){
    this.signup.show();
    this.login.hide();
  },
  showLogin: function(e){
    this.signup.hide();
    this.login.show();
  }
});
