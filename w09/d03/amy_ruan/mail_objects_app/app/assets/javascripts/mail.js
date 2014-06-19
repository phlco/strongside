// var options = options || {}
function Mail(options){
  this.shipToAddress = options["shipToAddress"]
  this.stampValue = options["stampValue"]
}

function Postcard(options){
  this.message = options["message"]
}

function Package(){
  // var myPackage = this;
  this.contents = []
  this.isBroken = false
  this.isFragile = false
}

Package.prototype.isBroken1 = function(){
  return this.isBroken;
}

// Package.prototype.isFragile = function(){
//   return false;
// }

Package.prototype.shake = function(){
  if (this.isFragile) {
    this.isBroken = true
  }
}


function Mailbox() {
  this.contents = []
}

Mailbox.prototype.acceptMail = function(object){
  this.contents.push(object)
}

Mailbox.prototype.openMail = function(){
  var contents = this.contents;
  return contents[0]
}

Mailbox.prototype.toString = function(){
  var contents = this.contents;
  var numPackage = 0;
  var numPostcard = 0;

  for(var i = 0; i < this.contents.length; i++) {
    var prototype = (Object.getPrototypeOf(contents[i]));
    var packageCheck = Object.getPrototypeOf(new Package());
    var postcardCheck = Object.getPrototypeOf(new Postcard({message: "hello"}));
    if(prototype == packageCheck) {
      numPackage += 1;
    }
    else if(prototype == postcardCheck){
      numPostcard += 1;
    }
  }
  return "The mailbox has " + numPostcard + " postcards and " + numPackage + " packages"
}
