function MailBox(){
  this.mailItems = [];
}

MailBox.prototype.acceptMail = function(mailItem){
  // only accepts the mailItem if it
  // is an instance of Package or Postcard
  if (mailItem instanceof Package || mailItem instanceof Postcard) {
    this.mailItems.push(mailItem);
  }
};

MailBox.prototype.openMail = function(){
  if (this.mailItems.length > 0) {
    // .shift will give the first item
    // in an array, while also removing it
    return this.mailItems.shift();
  }
};

MailBox.prototype.toString = function(){
  var pcount = 0;
  var pkcount = 0;

  // iterate through mail and count each type
  $.each(this.mailItems, function(index, item) {
    if (item instanceof Postcard) {
      pcount += 1;
    } else {
      pkcount += 1;
    }
  });

  return "The mailbox has " + pcount + " postcard(s) and " + pkcount + " package(s).";
};