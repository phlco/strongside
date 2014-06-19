function MailItem(mailToAddress, postageAmount){
  this.toAddress = mailToAddress;
  this.postageAmount = postageAmount;
} // MailItem()

MailItem.prototype.getToAddress = function() {
  return this.toAddress;
};

MailItem.prototype.getPostageAmount = function() {
  return this.postageAmount;
}

