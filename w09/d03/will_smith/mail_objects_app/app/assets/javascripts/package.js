function Package() {
  this.content = [];
  this.fragile = true;
  this.broken = false;
}

Package.prototype.shake = function(){
  if (this.fragile === true) {
    this.broken = true;
  }
};

Package.prototype.isBroken = function(){
  if (this.broken === true) {
    return 'yes, it is broken';
  } else {
    return 'no, it is no broken';
  }
};
