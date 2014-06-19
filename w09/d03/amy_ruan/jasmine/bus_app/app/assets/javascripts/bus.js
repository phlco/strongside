function Bus () {
  this.passengers = [];
}

Bus.prototype.isEmpty = function() {
  return this.passengers.length === 0;
}

Bus.prototype.add = function(passenger){
  if (!this.contains(passenger)){
    this.passengers.push(passenger);
  }
}

Bus.prototype.contains = function(passenger){
  return this.passengers.indexOf(passenger) !== -1;
}

Bus.prototype.getSize = function(){
  return this.passengers.length;
}

Bus. prototype.getPassengers = function(){
  return this.passengers.map(function(n){return n.name})

  // var names = [];
  // for (var i = 0; i< this.getSize(); i++){
  //   this.passengers[i].name;
  //   names.push()
  // }
  // return names
}

