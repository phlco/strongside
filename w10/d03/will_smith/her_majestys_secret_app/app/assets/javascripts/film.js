var Film = Backbone.Model.extend({
  gross: function(){
    return parseInt(this.get('gross').slice(1).split(',').join(''));
  }
});
