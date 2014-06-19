var app = app || {};

$(function () {
  app.userListView = new app.UserListView();
  app.userEditView = new app.UserEditView();

  app.router = new app.Router();
  app.router.on('route:home', function () {
    //render user list
    app.userListView.render();
  });
  app.router.on('route:edit', function (id) {
    debugger;
    app.userEditView.render({id: id});
  });

  Backbone.history.start();
});

