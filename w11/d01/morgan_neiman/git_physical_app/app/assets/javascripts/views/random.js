var RandomView = Backbone.View.extend({
  el: "#exercises",
  initialize: function() {
    this.render();
  },
  render: function() {
    var allWorkouts = exercises.pluck("name");
    allWorkouts = this.shuffle(allWorkouts);
    this.$el.html(allWorkouts[0]);
    this.$el.append(allWorkouts[1]);
    this.$el.append(allWorkouts[2]);
    console.log("random");
    // not doing calories. you could really be more thoughtful when creating these exercises.
  },
  shuffle: function(o){ //v1.0
    for(var j, x, i = o.length; i; j = Math.floor(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x);
      return o;
  }
});