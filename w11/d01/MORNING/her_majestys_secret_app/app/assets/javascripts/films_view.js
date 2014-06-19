var FilmsView = Backbone.View.extend({

  el: "#films",

  events: {
    "click thead td"      : "sortBy",
    "click #viewAll"      : "renderTable",
    "click #bestBond"     : "bestBond",
    "click #worstBond"    : "worstBond",
    "click #loneliestBond": "loneliestBond",
    "click #oddBonds"     : "oddBonds",
    "click #starCount"    : "starCount",
    "click #totalGross"   : "totalGross",
    "click #getActors"    : "getActors",
  },

  initialize: function(){
    this.listenTo(this.collection, "sort", this.renderTable);
    this.renderTable();
  },

  sortBy: function(e) {
    var attr = $(e.currentTarget).text();
    this.collection.comparator = function(model) {
      return model.get( attr );
    }
    this.collection.sort();
  },

  renderTable: function(){
    var template = Handlebars.compile( $("#films-table-template").html() );
    $('#display').html( template( {films: this.collection.toJSON()} ));
  },

  oddBonds: function(e){
    var bonds = this.collection.oddBonds();
    this.renderTitles({titles: bonds});
  },

  loneliestBond: function(e){
    var bond = this.collection.loneliestBond();
    this.renderActor({actor: bond});
  },

  bestBond: function(e){
    var bond = this.collection.bestBond();
    this.renderActor(bond);
  },

  worstBond: function(e){
    var bond = this.collection.worstBond();
    this.renderActor(bond);
  },

  starCount: function(e){
    var stars = this.collection.starCount();
    var template = Handlebars.compile( $('#obj-template').html() );
    $('#display').html( template({star: stars}) );
  },

  renderActor: function(actor) {
    var template = Handlebars.compile( $('#actor-template').html() );
    $('#display').html( template(actor) );
  },

  renderTitles: function(titles) {
    var template = Handlebars.compile( $('#title-template').html() );
    $('#display').html( template(titles) );
  },

  totalGross: function(e){
    var gross = this.collection.totalGross();
    $('#display').html( gross );
  },

  getActors: function(e){
    var actors = this.collection.getActors();
    this.renderTitles({titles: actors});
  }

});
