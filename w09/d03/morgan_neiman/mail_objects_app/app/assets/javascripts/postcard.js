function Postcard() {

}

Postcard.prototype.writeMessage = function(message) {
  if( typeof message == "string") {
    this.message = message;
  }
  else {
    throw "must be string";
  }
};