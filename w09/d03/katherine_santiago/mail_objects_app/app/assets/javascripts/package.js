function package(stuff, fragileBoolean) {
  this.contents = [];
  this.fragile = fragileBoolean;
}

package.prototype.contents = function() {
  return this.contents;
};

package.prototype.fragile = function() {
  return this.fragile;
};

package.prototype.isBroken = function(brokenBoolean) {
  return this.isBroken;
};

package.prototype.shake = function() {
  if (this.fragile === true) {
    this.isBroken = true;
  }
};

