function Mailbox() {
  this.mailItems = [];
}

Mailbox.prototype.acceptMail = function(mail) {
  if(mail.constructor == Postcard || mail.constructor == Package ) {
    this.mailItems.push(mail);
  }
  else {
    throw "must be mail item";
  }
};

Mailbox.prototype.openMail = function() {

  this.mailItems.shift();

};

Mailbox.prototype.toString = function() {
  var postcards = 0;
  var packages = 0;
  for(i=0; i < this.mailItems.length; i++){
    if(this.mailItems[i].constructor == Postcard) {
      postcards++;
    }
    else {
      packages++;
    }
  }
  return "The mailbox has " + postcards + " postcards and " + packages + " packages";
};

function MailItem() {
};

MailItem.prototype.writeAddress = function(address) {
  if(typeof address == "string") {
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

function Package(){
  this.fragile = false;
  this.content = [];
  this.broken = false;
}

Package.prototype.addContent = function(content) {

  this.content.push(content);
};

Package.prototype.setFragile = function(bool) {
  if(typeof bool == "boolean") {
    this.fragile = bool;
  }
  else {
    throw "must be boolean";
  }
};

Package.prototype.shake = function() {
  if(this.fragile === true ) {
    this.broken = true;
  }
};

Package.prototype.isBroken = function() {
  return this.broken;
};

function Postcard() {

}

Postcard.prototype.writeMessage = function(message) {
  if(typeof message == "string") {
    this.message = message;
  }
  else {
    throw "must be string";
  }
};


