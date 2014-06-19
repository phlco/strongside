create a Rectangle Constructor function

create methods on the rectangle prototype

* isSquare - Returns whether the rectangle is a square or not
* area - Calculates the area of the rectangle
* perimeter - Calculates the perimeter of the rectangle

function Rectangle(length, width) {
  this.length = length;
  this.width = width;
}

Rectangle.prototype.area = function(){
  return this.length * this.width;
}

Rectangle.prototype.isSquare = function(){
  return this.length === this.width;
}

Rectangle.prototype.perimeter = function(){
  return (this.length + this.width) * 2
}

function Auto(wheels){
  this.wheels = wheels;
}

Car.prototype.drive = function(){
  return "vroom"
}
