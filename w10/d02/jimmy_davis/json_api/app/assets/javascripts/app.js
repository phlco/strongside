var app = app || {};

$(function() {

    var userListView = new app.UserListView();
    var userEditView = new app.UserEditView();

    app.router = new app.Router();
    app.router.on('route:home', function() {
      // render user list
      userListView.render();
    })
    app.router.on('route:edit', function(id) {
      userEditView.render({id: id});
    })

    Backbone.history.start();
});
