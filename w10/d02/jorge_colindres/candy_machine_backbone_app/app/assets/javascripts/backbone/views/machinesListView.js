var app = app || {};

app.MachinesList = Backbone.View.extend({
  el: '.page',
  events: {
    'click .buy-candy': 'buyCandy',
    'click .refill': 'refillMachine',
    'click .cashout': 'cashoutMachine'
  },
  render: function(){
    var _this = this;
    this.machines = new app.Machines();
    this.machines.fetch({
      success: function(machines){
        var source = $('#machines-list-template').html();
        var template = Handlebars.compile(source);
        var content = template({machines: machines.toJSON()});
        _this.$el.html(content);
      }
    });
  },
  buyCandy: function(e){
    e.preventDefault();
    var _this = this;
    var button = e.currentTarget;
    var $candy = $(button).parent().siblings('.candy');
    var $money = $(button).parent().siblings('.money');
    var machine = this.getMachineClicked($money);
    $.ajax({
      url: machine.url() + '/sell',
      type: 'PUT',
      context: machine,
      dataType: 'json',
      data: machine.toJSON
    })
    .done(function(updatedMachine) {
      this.set({candy: updatedMachine.candy});
      this.set({money: updatedMachine.money});
      $candy.html(updatedMachine.candy);
      $money.html(updatedMachine.money);
    });
  },
  refillMachine: function(e){
    e.preventDefault();
    var _this = this;
    var button = e.currentTarget;
    var $candy = $(button).parent().siblings('.candy');
    var machine = this.getMachineClicked($candy);
    $.ajax({
      url: machine.url() + '/refill',
      type: 'PUT',
      context: machine,
      dataType: 'json',
      data: machine.toJSON
    })
    .done(function(updatedMachine) {
      this.set({candy: updatedMachine.candy});
      $candy.html(updatedMachine.candy);
    });
  },
  cashoutMachine: function(e){
    e.preventDefault();
    var _this = this;
    var button = e.currentTarget;
    var $money = $(button).parent().siblings('.money');
    var machine = this.getMachineClicked($money);
    $.ajax({
      url: machine.url() + '/cashout',
      type: 'PUT',
      context: machine,
      dataType: 'json',
      data: machine.toJSON
    })
    .done(function(updatedMachine) {
      this.set({money: updatedMachine.money});
      $money.html(updatedMachine.money);
    });
  },
  getMachineClicked: function(childEl){
    debugger
    var machineId = childEl.parent()
                        .attr('id')
                        .substring(8);
    return this.machines.findWhere({id: parseInt(machineId, 10)});
  }
});
