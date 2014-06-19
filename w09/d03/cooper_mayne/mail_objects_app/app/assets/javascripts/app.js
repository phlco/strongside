function MailItem (options) {
  this.shipToAddress = options['address'];
  this.stampValue = options['stampValue'];
}

function PostCard (options) {
  this.type = 'postcard';
  this.message = options['message'];
}

function Package () {
  this.type = 'package';
  this.content = [];
  this.fragile = false;
  this.broken = false;
}

Package.prototype.shake = function() {
  if (this.fragile) {
    this.broken = true;
  }
};

function MailBox () {
  this.content = []
}

MailBox.prototype.acceptMail = function(package) {
  this.content.push(package);
};

MailBox.prototype.openMail = function() {
  return this.content.shift()
};

MailBox.prototype.toString = function() {
  var postNum = 0
  var packNum = 0
  for (var i = 0; i < this.content.length; i++) {
    if(this.content[i].type == 'package'){
      packNum++;
    } else {
      postNum++;
    }
  };
  return "The mailbox has "+ postNum +" postcards and "+ packNum +" packages"
};
