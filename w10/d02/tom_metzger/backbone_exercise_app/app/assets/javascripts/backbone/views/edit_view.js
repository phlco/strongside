var EditUser = Backbone.View.extend({
  el: '.page',  //identifies the container element for the content that will be rendered by this views
  render: function(options) {
    var that = this;
    if (options.id) {
      that.user = new User({id: options.id})
      that.user.fetch({
        success: function(user) {
          var template = _.template($('#edit-user-template').html(), {user: user});
          that.$el.html(template);
        }
      }) //triggers GET users for user id
    } else {
    var template = _.template($('#edit-user-template').html(), {user: null});
    this.$el.html(template);
    }
  },

  events: {
    // syntax for events
    // the first word is the event
    // separated by a space
    // then the event you want it to do
    // this is followed by a :  (colon) and the function that you want executed
    'submit .edit-user-form': 'saveUser',
    'click .delete': 'deleteUser'
  },

  saveUser: function(e) {
    var userDetails = $(e.currentTarget).serializeObject();
    var user = new User();
    // call user.save (takes 2 parameters: 1- details to be sent to the server & saved  2- options hash of wahat to do on success)
    user.save(userDetails, {
      success: function(user) {
        router.navigate('', {trigger: true});  //used for saving state of the page, updates url of the page, silent by default so need to tell it to trigger a route
      }
    })  //
    console.log(userDetails);
    return false; //this cancels the default behavior of refreshing the page when a form is submitted
  },

  deleteUser: function(e) {
    this.user.destroy({
      success: function() {
        router.navigate('', {trigger: true});
      }
    })
    return false;
  }
});
