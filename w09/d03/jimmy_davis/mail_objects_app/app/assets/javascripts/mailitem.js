function MailItem() {
}

MailItem.prototype.shipToAddress = function(address) {
  if( typeof address == "string" ) {
    this.shipToAddress = address;
  }
  else {
    throw "Address must be a string";
  }
};

MailItem.prototype.stampValue = function(value) {
  if( typeof value == "number") {
    this.stampValue = value;
  }
  else {
    throw "Stamp value must be a number";
  }
};
