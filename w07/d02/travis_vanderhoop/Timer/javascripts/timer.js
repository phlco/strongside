function Timer() {
  this.count = 0;
}

Timer.prototype.tick = function() {
  this.count++;
  console.log(this.count);
  debugger;
  return this.count;
}

var timer = new Timer();
timer.tick()



setInterval(timer.tick, 5000)



