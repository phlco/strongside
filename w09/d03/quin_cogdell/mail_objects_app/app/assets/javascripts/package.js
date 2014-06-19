function Package() {
  this.content =[];
  this.fragile = false;
  this.broken = false;
  this.weight = 100;
}


Package.prototype.addContent = function(item) {
  this.content.push(item);
};

Package.prototype.setFragile = function(bool) {
    if (typeof bool === 'boolean'){
      this.fragile = bool;
   } else {
      throw "must be a boolean";
   }
};

Package.prototype.setBroken = function(bool) {
    if (typeof bool === 'boolean'){
      this.isBroken = bool;
   } else {
      throw "must be a boolean";
   }
};

Package.prototype.isBroken = function() {
  return this.broken;
};

Package.prototype.shake = function() {
  if(this.fragile === true) {
    this.broken = true;
  }
};

Package.prototype.isHeavy = function() {
  return this.weight > 10;
};
