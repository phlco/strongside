var UserList = Backbone.View.extend({
  // element is the continer for the view
  // elements should have child views and NO views are outside element
  el: '.page',
  render: function() {
    // HOW THIS WORKS
          // this.$el.html('!CONTENT SHOULD SHOW HERE!');  --- this was initial test content
    // 1) instantiate a new users collection to get data
    var users = new Users();
    // 2) define this because anonymous function doesn't have scope
    var that = this; //hack to get around lack of scope (no this) in the anonymous function
    users.fetch({
      success: function(){
        // templating function for displaying content,  HE uses _'s templating , we have used Handlebars
        var template = _.template($('#user-list-template').html(), {users: users.models});
    // 3) the above template function takes in the html string which is the table defined above with the id = "user-list-template" and passes it the content from users: users.models
            // we are using _'s templating function (instead of Handlebars or another templating package)
            // part one passes a string of data (the Jquery object $('#user-list-template') referring to the table above )
            // the second argument passes the models to the template becaues we don't need the associated functions now
        that.$el.html(template);
      }
    })
  }

});
