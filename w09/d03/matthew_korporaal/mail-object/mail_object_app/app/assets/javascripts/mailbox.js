function Mailbox () {

  this.items = [];
  this.packageTally = 0;
  this.postcardTally = 0;
  this.unknownTally = 0;
}

Mailbox.prototype.acceptMail = function (somethingToMail) {

  // push item into mailbox array
  this.items.push(somethingToMail);
  // id type of item and tally
  this.tally("++", somethingToMail);
}

Mailbox.prototype.openMail = function () {

  // send the first item saved back
  var delivery = this.items.shift();
  // decrement the proper counter
  this.tally("--", delivery)

  return delivery;
}

Mailbox.prototype.toString = function () {

  return "The mailbox has " +
          this.postcardTally.toString() +
          " postcards and " +
          this.packageTally.toString() +
          " packages";
}

Mailbox.prototype.tally = function (op, thingToTally) {

  // This adds or decrements one based on op argument
  if (thingToTally.constructor === Postcard) {
    eval('this.postcardTally' + op);
  } else if (thingToTally.constructor === Package) {
    eval('this.packageTally' + op);
  } else {
    eval('this.unknownTally' + op);
  }
}