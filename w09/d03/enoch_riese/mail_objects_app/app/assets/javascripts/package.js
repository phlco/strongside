function Package(options) {
  this.contents = options.contents;
  this.fragile = options.fragile;
  this.broken = false;
}

Package.prototype.shake = function() {
  if (this.fragile === true) {
    this.broken = true;
  }
}
Package.prototype.isBroken = function() {
  return this.broken;
}
