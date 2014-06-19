/*
  What does the following code do?

  Write comments to annoate __every__ line and clarify the code
*/

Function.prototype.curry = function(){

  var fn = this;
  var args = Array.prototype.slice.call( arguments );

  return function(){
    return fn.apply( this, args.concat(Array.prototype.slice.call( arguments )) );
  }
}

String.prototype.csv = String.prototype.split.curry(/,\s*/);

("Ice, King").csv();
