var userList = new UserList();
var editUser = new EditUser();

var router = new Router();  //creates a new instance of router

//listen for router events --- routers emit events called route (specifically the route called home) and then execute function
router.on('route:home', function(){
  userList.render();
});

router.on('route:editUser', function(id){
  editUser.render({id: id});
});

// this tells backbone to start listening to the url for routes --  NOTHING will happen until this is set
Backbone.history.start();
