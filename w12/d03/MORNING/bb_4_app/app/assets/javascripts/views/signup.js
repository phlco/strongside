App.Views.Signup = Backbone.View.extend({
  el: "#signup_form",
  events: {
    "submit form" : "createUser"
  },
  initialize: function(){
    this.email = $("#user_email");
    this.password = $("#user_password");
    this.password_confirmation = $("#user_password_confirmation");
    this.errors = $("#errors");
    this.listenTo(this.model, "invalid", this.displayErrors);
  },
  show: function(){
    this.$el.show();
  },
  hide: function(){
    this.$el.hide();
  },
  createUser: function(e){
    e.preventDefault();
    // this.model.set(  );
    this.model.save(this.getAttributes());
  },
  getAttributes: function(){
    return {
      email: this.email.val(),
      password: this.password.val(),
      password_confirmation: this.password_confirmation.val(),
      name: "dave"
    }
  },
  displayErrors: function(){
    this.errors.text(this.model.validationError.join(' '))
  }
});
