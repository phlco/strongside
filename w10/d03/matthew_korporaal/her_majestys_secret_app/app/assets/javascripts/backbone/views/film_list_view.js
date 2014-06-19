var app = app | {};

var FilmListView = Backbone.View.extend({
  el: '.page',
  render: function (){
    var that = this;
    var films = new Films( bonds.films );

    var template = _.template($('#film-list-template').html(), {films: films.models});
    that.$el.html(template);

  }
});