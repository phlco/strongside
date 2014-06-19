function Mailbox(){
  this.mailItems = [];
}

Mailbox.prototype.acceptMail = function(postcardOrParcel){
  if (postcardOrParcel.constructor === Postcard || postcardOrParcel.constructor === Parcel) {
    this.mailItems.push(postcardOrParcel);
  }
};

Mailbox.prototype.openMail = function(){
  this.mailItems.splice(0,1);
};
