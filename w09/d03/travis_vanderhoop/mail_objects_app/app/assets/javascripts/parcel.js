function Parcel(content) {
  this.content = content;
  this.fragile = false;
  this.broken = false;
}

Parcel.prototype.getContent = function(){
  return this.content;
}

Parcel.prototype.isFragile = function() {
  return this.fragile;
}

Parcel.prototype.shake = function() {
  this.broken = true;
}

