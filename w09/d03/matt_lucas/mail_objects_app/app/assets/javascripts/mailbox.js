function mailBox() {
  this.contents = [];
}

mailBox.prototype.isEmpty = function() {
  if (this.contents.length === 0) {
    return true;
  }
};

mailBox.prototype.acceptMail = function(item) {
  this.contents.push(item);
};

mailBox.prototype.openMail = function(){
  return this.contents[0];
  this.contents.delete[0];
};

mailBox.prototype.toString = function(){
  return 'you have ' + this.contents.length + ' things to open';
};