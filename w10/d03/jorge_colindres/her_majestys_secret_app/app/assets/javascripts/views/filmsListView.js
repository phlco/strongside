var app = app || {};

app.FilmsListView = Backbone.View.extend({
  el: '.page',
  collection: new app.Films(bonds.films),
  events: {
    'click .get-best': 'getBestBond',
    'click .get-worst': 'getWorstBond',
    'click .get-lonliest': 'getLonliestBond',
    'click .get-odd': 'getOddBonds'
  },
  render: function(){
    var source = $('#films-list-template').html();
    var template = Handlebars.compile(source);
    var content = template({films: this.collection.toJSON()});
    this.$el.html(content);
  },
  getBestBond: function(){
    var bestBond = this.collection.bestBond();
    alert(bestBond.actor + ' is the best bond.');
  },
  getWorstBond: function(){
    var worstBond = this.collection.worstBond();
    alert(worstBond.actor + ' is the worst bond.');
  },
  getLonliestBond: function(){
    var loneliestBond = this.collection.loneliestBond();
    alert(loneliestBond + ' is the loneliest bond.');
  },
  getOddBonds: function(){
    var oddBonds = this.collection.oddBonds();
    alert('Here are the odd-year bond films:');
    _.each(oddBonds, function(oddBond){
      alert(oddBond);
    });
  }
});
