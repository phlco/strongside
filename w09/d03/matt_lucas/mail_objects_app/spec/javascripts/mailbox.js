function mailBox() {
  this.contents = [];
}

mailBox.prototype.isEmpty = function() {
  return this.contents.length === 0;
};