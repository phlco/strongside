var InfoButtonsView = Backbone.View.extend({
  el: '#all',

  events: {
    "onClick": "showAllActors"
  },

  showAllActors: function (e){
    var films = new Films( bonds.films );
    var actors = films.getActors();
    $('#info-area').append('<p>' + actors + '</p>');
  }
})