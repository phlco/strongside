function Mailbox() {
  this.mailItems = [];
}

Mailbox.prototype.acceptMail = function(item) {
  if ( item.constructor == Postcard || item.constructor == Package ) {
    this.mailItems.push(item);
  }
  else {
    throw "Must be a mailitem (either a package or postcard)";
  }
};

Mailbox.prototype.openMail = function() {
  this.mailItems.shift();
};

Mailbox.prototype.toString = function() {
  var postcards = 0;
  var packages = 0;
  for( i = 0; i < this.mailItems.length; i++ ) {
    if( this.mailItems[i].constructor == Postcard ) {
      postcards++;
    }
    else {
      packages++;
    }
  }
  return "The mailbox has " + postcards + " postcards and " + packages + " packages";
};
