$(document).ready(function(){
  router = new Router();
  // pushState -- takes away the dead link (# in the URL)
  Backbone.history.start({ pushState: true });

// Backbone.debug.collections(); // => log and return all collections
// Backbone.debug.models(); // => log and return all models
// Backbone.debug.views(); // => log and return all views
// Backbone.debug.routers(); // => log and return all routers
});
