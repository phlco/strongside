


$(document).ready(function(){
  router = new Router();
  Backbone.history.start();
  Backbone.debug.collections();
  Backbone.debug.models();
  Backbone.debug.views();
  Backbone.debug.routers();
});
