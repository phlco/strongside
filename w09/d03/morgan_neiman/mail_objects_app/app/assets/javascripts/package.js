function Package() {
  this.fragile = false;
  this.content = [];
  this.broken = false;
}

Package.prototype.addContent = function(content) {

  this.content.push(content);
};

Package.prototype.setFragile = function(bool) {
  if( typeof bool == "boolean" ) {
    this.fragile = bool;
  }
  else {
    throw "must be boolean";
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