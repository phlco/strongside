function Roller(rollerNumber) {
  // When a rollers is first created
    // it needs to know which roller it is
    // whether it is currently spinning or not (so that I can ask the question are all 3 rollers no longer spinning in slot_machine.js) and by default it will not be spinning
    // and it needs to have a current index which represents which image it is pointing to.

    // also, I need access to all of my image nodes so that I have hide and show images based on the index value.
  this.rollerNumber = rollerNumber;
  this.isSpinning = false;
  this.curIndex = Roller.getRandomIndex();

  this.imageNodes = document.getElementById("images-"+rollerNumber).children;
}

Roller.prototype.spin = function() {
  // This is called when the slot machine's .spin method is called which is called when the hand is pulled
  // I need to change the state of the roller so that it is spinning
  // and then hide the image from the last spin (which is still going to be the current index)
  this.isSpinning = true;
  this.hideImageAt(this.curIndex);
}

Roller.prototype.stop = function() {
  // This is going to be called when the button is clicked
    // I will need to set the state of the spinning to false
    // choose a random index fr the roller to land on
    // and show the appropriate image at this index
  this.isSpinning = false;
  this.curIndex = Roller.getRandomIndex();
  this.showImageAt(this.curIndex);
}

// Helper Functions

// Gives me a random number between 0-9
Roller.getRandomIndex = function() {
  return Math.floor(Math.random()*9);
}

// Hides an image at a given image index
Roller.prototype.hideImageAt = function(index) {
  var imageNode = this.imageNodes[this.curIndex];
  imageNode.className = "hidden";
}

// Shows an image at a given image index
Roller.prototype.showImageAt = function(index) {
  var imageNode = this.imageNodes[this.curIndex];
  imageNode.className = "";
};
