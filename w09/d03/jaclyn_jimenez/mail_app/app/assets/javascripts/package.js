function Package() {
  this.content = [];
  this.fragile = true;
  this.broken = false;
}

Package.prototype.shake = function() {
  if (this.fragile) {
    this.broken = true;
  }
};
Package.prototype.isBroken = function() {
  return this.broken;
};
