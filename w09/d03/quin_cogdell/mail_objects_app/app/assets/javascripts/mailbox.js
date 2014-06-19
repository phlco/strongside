function Mailbox() {
  this.mailItems = [];
}



Mailbox.prototype.acceptMail = function(item) {
  this.mailItems.push(item);
};

Mailbox.prototype.getMail = function() {
  return this.mailItems;
};
