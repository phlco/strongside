function Mailbox () {
  this.mailItems = [];
}

Mailbox.prototype.acceptMail = function (mail) {
  this.mailItems.push(mail);
};

Mailbox.prototype.openMail = function () {
    return this.mailItems[0];
    this.mailItems.shift();
};
