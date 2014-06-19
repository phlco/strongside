function MailItem() {
}

MailItem.prototype.writeAddress = function(address) {
  if( typeof address == "string" ) {
    this.shippingAddress = address;
  }
  else {
    throw "must be a string";
  }
};

MailItem.prototype.addStamp = function(value) {
  if( typeof value == "number") {
    this.stampValue = value;
  }
  else {
    throw "must be integer";
  }
};