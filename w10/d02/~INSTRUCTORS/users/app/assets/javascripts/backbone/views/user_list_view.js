var app = app || {};

// var UserListView = Backbone.View.extend({
app.UserListView = Backbone.View.extend({
  el: '.page',
  render: function () {
    var that = this;
    var users = new app.Users();
    users.fetch({
      success: function (users) {
        // var template = _.template($('#user-list-template').html(), {users: users.models});
        var source = $('#user-list-template').html();
        var template = Handlebars.compile(source)
        var html = template({users: users.toJSON()})
        that.$el.html(html);
      }
    })
  }
});

