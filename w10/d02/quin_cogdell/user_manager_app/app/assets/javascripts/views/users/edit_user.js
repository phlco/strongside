var app = app || {};

app.EditUser = Backbone.View.extend({
  el: '.page',
  render: function(options) {
    var that = this;
    // debugger
    if(options.id) {

      that.user = new app.User({id: options.id});
      that.user.fetch({
        success: function (user) {
          var template = _.template($('#edit-list-template').html(), {user: user});
          that.$el.html(template);
        }
      });
      } else {
        var template = _.template($('#edit-list-template').html(), {user: null});
        this.$el.html(template);
      }

    },
  events: {
    "submit .edit-user-form": 'saveUser',
    "click .delete": 'deleteUser'
  },
  saveUser: function (ev) {
    var userDetails = $(ev.currentTarget).serializeObject();
    var user = new app.User();
    user.save(userDetails, {
      success: function(user){
        app.router.navigate("", {trigger: true});
     }
    });
    return false;
  },
  deleteUser: function (ev) {
    this.user.destroy({
      success: function() {
        app.router.navigate("", {trigger: true});
      }
    });
    return false;
  }
});
