var ListView = Backbone.View.extend({
  el: '#todo',

  events: {
    "click button":"makeTask",
    "keypress":"checkKey"
  },
  checkKey: function(e) {
    if (e.which==13) {
      this.makeTask();
    }
  },
  makeTask: function() {
    console.log('appending task');
    var deed = this.$el.find('input').val();
    if (deed.length > 0) {
      var theTask = new TaskView({description: deed})
      $("#tasks").append(theTask.$el);
      this.$el.find('input').val('')
    }
  }
})

var TaskView = Backbone.View.extend({

  initialize: function(data) {
    this.template = Handlebars.compile($('#todo_tmp').html());
    this.$el.html(this.template(data))
  },
  events: {
    "click": "crossOut"
  },
  crossOut: function() {
    this.$el.css({textDecoration: "line-through"})
  }
})

$(document).ready(function() {
  window.listView = new ListView({name: "Zooniever"});
})
