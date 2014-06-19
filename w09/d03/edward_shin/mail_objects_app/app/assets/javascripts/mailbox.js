function Mailbox(){
  this.objects = [];
}

Mailbox.prototype.acceptMail = function(mailitem){
  this.objects.push(mailitem);
}

Mailbox.prototype.openMail = function() {
  return this.objects.shift();
}
Mailbox.prototype.toString = function() {
  var postcardCount = 0;
  var pckgCount = 0;
  for(i = 0; i < this.objects.length; i++){
    if (this.objects[i] instanceof Postcard){
      postcardCount = postcardCount + 1;
    } else if (this.objects[i] instanceof Package) {
      pckgCount = pckgCount + 1;
    }
  }
  return "There are "+postcardCount+" postcards and "+pckgCount+" packages"

}