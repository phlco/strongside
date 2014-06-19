function Package(){
  this.contentArray = [];
  this.fragile = false;
  this.broken = false;
}

Package.prototype.shake = function() {
  if(this.fragile){
    this.broken = true;
  }
}

Package.prototype.isBroken = function() {
  return this.broken
}