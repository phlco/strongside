App.Views.Login = Backbone.View.extend({
  el: "#login_form",
  events: {
    "submit form"  : "loginUser"
  },
  initialize: function(){
    this.email = $("#email");
    this.password = $("#password");
  },
  show: function(){
    this.$el.show();
  },
  hide: function(){
    this.$el.hide();
  },
  loginUser: function(e){
    e.preventDefault();
    this.model.set( this.getAttributes() );
    this.model.authenticate();
    debugger;
  },
  getAttributes: function(){
    return {
      email: this.email.val(),
      password: this.password.val()
    }
  }
});
