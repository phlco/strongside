$.fn.serializeObject = function() {
  var o = {};
  var a = this.serializeArray();
  $.each(a, function() {
    if (o[this.name] !== undefined) {
      if (!o[this.name].push) {
        o[this.name] = [o[this.name]];
      }
      o[this.name].push(this.value || '');
    } else {
      o[this.name] = this.value || '';
    }
  });
  return o;
};

var Users = Backbone.Collection.extend({
  url: '/users'
});

var User = Backbone.Model.extend({
  urlRoot: '/users'
})

var Router = Backbone.Router.extend({
  routes: {
    '':'home',
    'new':'editUser',
    'edit/:id':'editUser'
  }
});

var UserList = Backbone.View.extend({
  el: '.page',
  render: function() {
    var that = this
    var users = new Users();
    users.fetch({
      success: function(users) {
        var template = Handlebars.compile($('#user-list-template').html());
        var users_json = users.toJSON();
        that.$el.html(template({ users: users_json }));
      }
    })
  }
});

var EditUser = Backbone.View.extend({
  el: '.page',
  render: function(options) {
    var that = this;
    if (options.id) {
      that.user = new User({id: options.id});
      that.user.fetch({
        success: function(user) {
          var template = Handlebars.compile($('#user-edit-template').html());
          that.$el.html(template(user.toJSON()));
        }
      });
    } else {
      var template = Handlebars.compile($('#user-create-template').html());
      that.$el.html(template({user: null}));
    }
  },
  events: {
    "submit .create-user-form": "saveUser",
    "submit .edit-user-form": "saveUser",
  },
  saveUser: function(ev) {
    var userDetails = $(ev.currentTarget).serializeObject();
    var user = new User();
    user.save(userDetails, {
      success: function() {
        router.navigate("", {trigger: true})
      }
    })
    console.log(userDetails);
    return false;
  }
})

var router = new Router();
router.on('route:home', function() {
  userList.render();
});
router.on('route:editUser', function(id) {
  editUser.render({id: id});
});

var userList = new UserList();
var editUser = new EditUser();

Backbone.history.start();
