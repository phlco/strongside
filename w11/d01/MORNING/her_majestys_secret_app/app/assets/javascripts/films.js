var Films = Backbone.Collection.extend({

  model: Film,

  grosses: function() {
    return this.map(function(film){ return film.gross() });
  },

  totalGross: function() {
    return _.reduce(this.grosses(), function(memo, num){ return memo + num } );
  },

  getActors: function(){
    return _(this.pluck("actor")).unique();
  },

  starCount: function(){
    return this.countBy(function(film){ return film.get('actor')});
  },

  titles: function(options) {
    var options = options || { words: 1 };
    return _.filter( this.pluck("title"), function(title){
      var words = title.split(' ').length;
      return words == options['words'];
    });
  },

  loneliestBond: function(){
    return _.min(this.groupBy("actor"), function(films){
      return films.length
    })[0].get('actor');
  },

  oddBonds: function(){
    var odds = this.reject(function(film){ return film.get('year') % 2 == 0 });
    return _.map( odds, function(film) { return film.get("title") } );
  },

  bestBond: function(){
    var bonds = this.averageGrosses();
    return _.max(bonds, function(bond) { return bond.gross })
  },

  worstBond: function(){
    var bonds = this.averageGrosses();
    return _.min(bonds, function(bond) { return bond.gross })
  },

  averageGrosses: function(){
    return _.map(this.groupBy("actor"), function(films, actor){
      var films = new Films( films );
      var numberOfFilms = films.length;
      // var grosses = _.reduce(_.map(films, function(model){ return model.gross()} ), function(memo, sum){ return memo + sum })
      var gross = films.totalGross();
      var average = gross/numberOfFilms;
      var result = { actor: actor, gross: average };
      return result;
    });
  }

});
