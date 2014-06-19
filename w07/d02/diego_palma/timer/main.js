function Timer() {
  this.count = 0;
}

Timer.prototype.tick = function() {
  // debugger;
  this.count += 1;
  console.log(this.count);
  return this.count;
}

var timer = new Timer();
var callTheTimerTickFunction = function() {
  // timer.tick.call(timer)
  timer.tick();
}

setInterval(callTheTimerTickFunction, 1000) // I can introduce the var