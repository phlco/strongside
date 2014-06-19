var Film = Backbone.Model.extend({

  urlRoot: "/",
  initialize: function(query){
    this.set("film", query);
    // $('#bondsTable').dataTable();

  },


  gross: function(){
    var theGross = parseInt(this.get('gross').slice(1).split(',').join(''));
    return theGross;
  },


});
