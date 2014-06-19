function Package() {
  this.content = [];
  this.fragile = false;
  this.broken = false;
}

Package.prototype.isBroken = function(){
  return this.broken;
};

Package.prototype.shake = function(){
  if (this.fragile) this.broken = true;
};