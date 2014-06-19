function Mailbox() {
  this.contents = [];
}

Mailbox.prototype.acceptMail = function(m) {
  this.contents.push(m);
};
