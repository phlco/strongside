var app = app || {};

app.EditMachine = Backbone.View.extend({
  el: '.page',
  events: {
    'submit .edit-machine-form': 'saveMachine',
    'click .delete-machine': 'deleteMachine',
    'click .go-home': 'goHome'
  },
  render: function(options){
    var _this = this;
    if (options.id) {
      _this.machine = new app.Machine({id: options.id});
      _this.machine.fetch({
        success: function(machine){
          var source = $('#edit-machine-template').html();
          var template = Handlebars.compile(source);
          var content = template({machine: machine.attributes});
          _this.$el.html(content);
        }
      });
    } else {
      var source = $('#edit-machine-template').html();
      var template = Handlebars.compile(source);
      var content = template({machine: null});
      this.$el.html(template);
    }
  },
  saveMachine: function(e){
    e.preventDefault();
    $form = $(e.currentTarget);
    var machineData = $form.serializeObject();
    var machine = new app.Machine();
    machine.save(machineData, {
      success: function(machine){
        app.router.navigate('', {trigger: true});
      }
    });
  },
  deleteMachine: function(e){
    this.machine.destroy({
      success: function(){
        app.router.navigate('', { trigger:true});
      }
    });
    e.preventDefault();
  },
  goHome: function(e){
    e.preventDefault();
    app.router.navigate('', { trigger:true});
  }
});
