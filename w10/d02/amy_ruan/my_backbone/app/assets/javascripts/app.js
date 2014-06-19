var app = app || {};

$(function){
  var userListView = new app.UserListView();
  var userListView = new app.UserListView();

  app.router = new app.Router();
  app.router.on('route:home', function(){
    userListView
  })

}