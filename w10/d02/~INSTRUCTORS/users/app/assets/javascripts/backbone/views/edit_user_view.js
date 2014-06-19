var app = app || {};

// var UserEditView = Backbone.View.extend({
app.UserEditView = Backbone.View.extend({
  el: '.page',
  events: {
    'submit .edit-user-form': 'saveUser',
    'click .delete': 'deleteUser'
  },
  saveUser: function (ev) {
    var userDetails = $(ev.currentTarget).serializeObject();
    var user = new app.User();
    user.save(userDetails, {
      success: function (user) {
        app.router.navigate('', {trigger:true});
      }
    });
    return false;
  },
  deleteUser: function (ev) {
    this.user.destroy({
      success: function () {
        console.log('destroyed');
        app.router.navigate('', {trigger:true});
      }
    });
    return false;
  },
  render: function (options) {
    var that = this;
    if(options.id) {
      that.user = new app.User({id: options.id});
      that.user.fetch({
        success: function (user) {
          // var template = _.template($('#edit-user-template').html(), {user: user});
          // that.$el.html(template);

          var source = $('#edit-user-template').html();
          var template = Handlebars.compile(source)
          var context = {
            user: user.toJSON(),
            formType: "Edit",
            submitType: "Update"
          }
          var html = template(context)
          that.$el.html(html);

        }
      })
    } else {

      // var template = _.template($('#edit-user-template').html(), {user: null});
      // that.$el.html(template);

      var source = $('#edit-user-template').html();
      var template = Handlebars.compile(source)
      var context = {
        formType: "New",
        submitType: "Create"
      }
      var html = template(context)
      that.$el.html(html);
    }
  }
});
