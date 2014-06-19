function Package(contents){
  this.contents = contents;
  this.broken = false;
}

Package.prototype.shake = function() {
  if (this.fragile) {
    this.broken = true;
  }
};
