function Mailbox(){
  this.mailitems = [];
}

Mailbox.prototype.acceptMail = function(mail) {
  this.mailitems.push(mail);
};

Mailbox.prototype.openMail = function() {
  this.mailitems.shift();
};

Mailbox.prototype.toString = function() {
  var postcards = 0, packages = 0;
  for (var i = 0; i < this.mailitems.length; i++) {
    if (this.mailitems[i].contents) {
      packages++;
    } else if (this.mailitems[i].message){
      postcards++;
    }
  }
  return 'The mailbox has ' + postcards + ' postcards and ' + packages + ' packages.';
};
