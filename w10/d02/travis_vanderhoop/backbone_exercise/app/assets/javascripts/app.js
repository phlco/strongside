$( document ).ready(function() {
  debugger
  var userList = new UserList(),
      editUser = new EditUser(),
      router = new Router();

      // NOTE: In backbone, routers have a namespace 'route'
      router.on('route:home', function(){
        // renders the View declared and initialized above
        userList.render();
      }); // on route:home

      router.on('route:editUser', function(id){
        editUser.render({id:id});
      });

      // history.start() tells backbone to start listening to the URLs passed to the application
      Backbone.history.start();
});
