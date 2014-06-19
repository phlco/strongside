function Mailbox() {
  this.items = []
}

Mailbox.prototype.acceptMail = function(item) {
  this.items.push(item);
};

Mailbox.prototype.openMail = function() {
  last = this.items.pop();
  return last;
}

Mailbox.prototype.toString = function() {
  var packs = 0;
  var posts = 0;
  for (var i = this.items.length - 1; i >= 0; i--) {
    if (this.items[i] instanceof Package) {
      packs ++;
    }
    else if (this.items[i] instanceof Postcard) {
      posts ++;
    };
  };
  return "The Mailbox has " + posts + " postcards and " + packs + " packages"
}
