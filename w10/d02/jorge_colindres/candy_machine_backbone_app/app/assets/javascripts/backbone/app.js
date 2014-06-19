$(function() {
  var machineListView = new app.MachinesList();
  var editMachineView = new app.EditMachine();
  app.router = new app.Router();

  app.router.on('route:home', function(){
    machineListView.render();
  });
  app.router.on('route:editMachine', function(id){
    editMachineView.render({id: id});
  });

  Backbone.history.start();
});
