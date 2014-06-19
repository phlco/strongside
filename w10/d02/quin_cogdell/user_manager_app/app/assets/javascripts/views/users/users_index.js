var app = app || {};

app.UserList = Backbone.View.extend({
  el: ".page",

  render: function() {
    var that = this;
    var users = new app.Users();
    users.fetch({
      success: function(users) {
        // using underscore's templating function
        var template = _.template($('#user-list-template').html(), {users: users.models});
        that.$el.html(template);
      }
    });
  }
});
