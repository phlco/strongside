beforeEach(function() {
  this.addMatchers({
    toBeTypeOf: function(expected) {
      var actual, objType;
      actual = this.actual;

      objType = actual ? Object.prototype.toString.call(actual) : '';

      return objType.toLowerCase() === '[object ' + expected.toLowerCase() + ']';
    }
  });
});
