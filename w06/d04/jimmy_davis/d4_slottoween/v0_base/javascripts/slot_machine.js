SlotMachine = function() {
  // This is the constructor function that is called to create a new slot machine.
  // which I will be calling in main.js

  // Create my rollers inside of a "rollers" object (so that I can easily reference my rollers by number.
  this.rollers = {
    "1": new Roller(1),
    "2": new Roller(2),
    "3": new Roller(3)
  };

  // I need to setup my event listeners so that when I click on the handle and the buttons
  // they will call the appropriate actions.

  // Note that since the Browser is setting up the event listeners for me
  // the "this" variable in the callback will automatically be set to the dom element
  // that it was activated the callback, ie when I click on the handle, the dom element will be set
  // to the div that contains the handle.

  // and since I really want to reference the slotMachine inside of the .spin and .stop methods,
  // I want to pass in a pointer to this, I called it "mySlotMachine", which the callback functions
  // can access because they act as closures.

  var mySlotMachine = this; // so that I can access the current slot machine in my callback functions

  // When I click on the handle, call the .spin method on 'this' slot machine
  var handleNode = document.getElementById("handle");
  handleNode.addEventListener("click", function() {
    mySlotMachine.spin();
  });

  // When I click a stop button, call the .stop method with the appropriate roller number stopped
  var button1 = document.getElementById("button-1");
  button1.addEventListener("click", function() {
    mySlotMachine.stopRoller(1);
  });

  var button2 = document.getElementById("button-2");
  button2.addEventListener("click", function() {
    mySlotMachine.stopRoller(2);
  });

  var button3 = document.getElementById("button-3");
  button3.addEventListener("click", function() {
    mySlotMachine.stopRoller(3);
  });

}


SlotMachine.prototype.spin = function() {
  // When I spin the slotmachine, I will need to spin all 3 of my rollers.
  this.rollers[1].spin();
  this.rollers[2].spin();
  this.rollers[3].spin();
}

SlotMachine.prototype.stopRoller = function(rollerNumber) {
  // When this method, .stopRoller is called,
    // I need to find the appropriate roller
      // and stop it only if it is spinning
  var rollerToStop = this.rollers[rollerNumber];
  if (rollerToStop.isSpinning === true) {
    rollerToStop.stop();
  }

  // Then I want to check if all of my rollers have stopped spinning
    // if they have, check if I have won or lost
  if (this.rollers[1].isSpinning === false && this.rollers[2].isSpinning === false && this.rollers[3].isSpinning === false) {
    this.checkWinOrLose();
  }


  // Add the other ones later

  // I also want to check if all the other rollers have stopped, if they have
    // check if I won or not and say "Win or Lose" appropriately
}

SlotMachine.prototype.checkWinOrLose = function() {

  // If all of my rollers have the same index values, then I know that they all "landed" on the same thing
    // then I win
  // otherwise
    // I lose

  if (this.rollers[1].curIndex === this.rollers[2].curIndex && this.rollers[2].curIndex === this.rollers[3].curIndex) {
    alert("You Win!");
  }
  else {
    alert("You Lose!");
  }
}
