function Postcard() {

}

Postcard.prototype.message = function(message){
  if (typeof(message) === "string"){
    this.message = message;
  }
};

