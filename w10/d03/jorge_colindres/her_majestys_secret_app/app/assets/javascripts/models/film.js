var app = app || {};

app.Film = Backbone.Model.extend({
  gross: function(){
    return Number(this.get('gross').replace(/[^0-9\.]+/g,""));
  }
});
