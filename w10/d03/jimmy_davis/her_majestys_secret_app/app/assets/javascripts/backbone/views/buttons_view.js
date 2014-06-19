var ButtonsView = Backbone.View.extend({
  el: '#get_actors',

  events: {
    "onClick": "showAllActors"
  },

  showAllActors: function (e){
    var films = new Films( bonds.films );
    var actors = films.getActors();
    $('#show-info').append('<p>' + actors + '</p>');
  }
})
