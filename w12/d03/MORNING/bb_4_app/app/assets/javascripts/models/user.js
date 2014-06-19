App.Models.User = Backbone.Model.extend({
  urlRoot: "/users",
  defaults: {
    "email":                  "",
    "password":               "",
    "password_confirmation":  ""
  },
  // attrs is model attributes
  // options are what's passed from save or set
  validate: function(attrs, options){
    var errors = [];
    if(attrs.email === "" || attrs.password === "" || attrs.password_confirmation === ""){
      errors.push("Fields can't be Blank!");
    }
    if(attrs.password !== attrs.password_confirmation) {
      errors.push("Passwords must match");
    }
    if(errors.length > 0) {
      return errors;
    }
  },
  authenticate: function(){
    var user = this;
    $.ajax({
      url: "/login",
      type: "post",
      data: {
        email: this.get('email'),
        password: this.get('password')
      }
    }).done(function(response){
      user.set(response);
    })
  }
});

App.Models.Dog = Backbone.Model.extend({
  urlRoot: "/dogs",
  toJSON: function() {
    return { dog: _.clone( this.attributes ) }
  },
  defaults: {
    "name" : "name",
    "password" : "password",
    "password_confirmation" : "password_confirmation"
  }
});

d1 = new App.Models.Dog({email: "phil", password: "phil", password_confirmation: "phil"});
