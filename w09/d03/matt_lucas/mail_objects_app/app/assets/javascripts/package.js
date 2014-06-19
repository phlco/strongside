function package(stuff, fragileBoolean) {
  contents = [];
  this.fragile = fragileBoolean;
}

package.prototype.contents = function() {
  return this.contents;
};

package.prototype.fragile = function() {
  return this.fragile;
};

package.prototype.broken = function() {
  return this.broken;
};

package.prototype.shake = function() {
  if (this.fragile === true) {
    this.broken = true;
    return self.broken;
  }

};