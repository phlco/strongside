var app = app || {};

$(function() {
  // debugger
  var userList= new app.UserList();
  var editUser = new app.EditUser();

  app.router = new app.Router();

  app.router.on('route:home', function() {
    userList.render();
  });

  app.router.on('route:editUser', function(id){
    editUser.render({id: id});
  });

  Backbone.history.start();

});
