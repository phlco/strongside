function mailItem(address, postage) {
  this.shipToAddress = address;
  this.stampValue = postage;
}

mailItem.prototype.shipToAddress = function() {
  return this.shipToAddress;
};

mailItem.prototype.stampValue = function() {
  return this.stampValue;
};