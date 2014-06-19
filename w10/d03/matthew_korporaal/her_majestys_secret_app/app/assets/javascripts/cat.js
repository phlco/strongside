var Cat = Backbone.Model.extend({
});

var Cats = Backbone.Collection.extend({
  initialize: function(){
    this.on("add", this.announce);
  },
  announce: function(){

  }
})

var cats = new Cats();

var c1 = new Cat({name: "Sam"});
var c2 = new Cat({name: "amoney"});
var c3 = new Cat({name: "jbear"});

cats.add(c1);
cats.add(c2);
cats.add(c3);

var dogs = [];

var d1 = {name: "phil"};
var d2 = {name: "quin"};
var d3 = {name: "jerry"};

dogs.push(d1);
dogs.push(d2);
dogs.push(d3);

_.map(dogs, function(dog){return dog.name})
cats.map(function(cat) {return cat.get('name')})