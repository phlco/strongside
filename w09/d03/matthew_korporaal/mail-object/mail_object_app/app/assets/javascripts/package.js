function Package () {

  this.content = [];
  this.fragile = false;
  this.broken = false;
}

Package.prototype.shake = function () {

  if (this.fragile === true) {
    this.broken = true;
  }
}