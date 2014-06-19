

mailItem = function(address) {

};

mailItem.prototype.shipToAddress = function(address){
  if (typeof(address) === "string"){
    this.shipToAddress = address;
  } else {
    throw "must be a string";
  }

};

mailItem.prototype.stampValue = function(stampPrice){
  if (typeof(stampPrice) === "number"){
    this.stampValue = stampPrice;
  } else {
    throw "must be a number";
  }


};
