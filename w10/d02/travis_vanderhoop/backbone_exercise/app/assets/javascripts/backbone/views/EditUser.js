var EditUser = Backbone.View.extend({
        el: '.page',
        render: function(options){
          var that = this;
          if (options.id) {
            that.user = new User({id: options.id});
            that.user.fetch({
              success: function(user) {
                var template = _.template($('#edit-user-template').html(), {user:user});
                that.$el.html(template);
              }
            });
          } else {
            // _.template() turns the inner html of the edit-user-template into a template
            var template = _.template($('#edit-user-template').html(), { user: null });
            this.$el.html(template);
          }
        }, // render function
        events: {
          'submit .edit-user-form': 'saveUser',
          'click .delete' : 'deleteUser'
        }, // events
        saveUser: function(event){
          // here, current target is the form, and we're using a snippet of jQuery (found above) called .serialize to turn the form into a json object.
          var userDetails = $(event.currentTarget).serializeObject();
          var user = new User();
            debugger
          user.save(userDetails, {
            success: function(user){
              // router.navigate is used to save the state of your page. here, we're routing to the root. what does trigger: true do?
              router.navigate('', { trigger: true });
            } // success function
          }); // user.save
          // return false is the equivelent of event.preventsDefault on form submission, which would reload the page.
          return false;
        },
        deleteUser : function(ev){
          this.user.destroy({
            success: function(user){
              router.navigate('', { trigger: true });
            } //success function
          });
          return false;
        } // deleteUser
      }); // EditUser
