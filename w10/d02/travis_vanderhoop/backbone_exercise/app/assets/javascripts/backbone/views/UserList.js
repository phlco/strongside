var UserList = Backbone.View.extend({
  el: '.page',
  // each View has a render function responsible for rendering the view to the page (loading in a template with the appropriate template and placing it in the DOM)
  render: function(){
    // instantiates new Users Collection
    var users = new Users();
    // because the 'success' function has a narrower scope, we need to pass it the current 'this' using a variable, 'that'
    var that = this;
    // fetches data from the url designed in the Users Collection definition
    users.fetch({
      success: function(users){
        //underscore's templating function takes two parameters. The first is a string of content. The second is a piece of data to interpolate into that string of content. FUCK YEAH.
        var template = _.template($('#user-list-template').html(), {users: users.models});
        that.$el.html(template);
      }
    });
  }
}); // UserList.View.extend
