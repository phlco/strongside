function Package() {
  this.fragile = false;
  this.content = [];
  this.broken = false;
}

Package.prototype.addContent = function(content) {
  this.content.push(content);
};

Package.prototype.isFragile = function(boo) {
  if( typeof boo == "boolean" ) {
    this.fragile = boo;
  }
  else {
    throw "Must be true or false";
  }
};

Package.prototype.shake = function() {
  if( this.fragile === true ) {
    this.broken = true;
  }
};

Package.prototype.isBroken = function() {
 return this.broken;
};
