function Timer() {
  this.count = 0;
}

Timer.prototype.tick = function() {
  this.count++;
  console.log(this.count);
  return this.count;
}

// Make the timer, the one created on line 11, tick up every second by calling its tick method

var timer = new Timer();
timer.tick();

setInterval(fn, ms);

