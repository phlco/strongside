// Package should have a content array
// Package should have a fragile boolean
// Package should have a broken boolean
// Package should have a method shake()
// If the Package's fragile is true and shake() is invoked then broken should be set to true
// Package should have an isBroken() method that returns whether it is broken or not

describe("a Package", function(){

  beforeEach(function(){
    package = new Package();
    item1 = "present";
    item2 = "office supplies";
  });

  it("has a content array", function(){
    package.addContent(item1);
    package.addContent(item2);
    expect(package.content).toEqual([item1, item2]);
  });

  it("has a fragile boolean", function(bool){
    package.setFragile(true);
    expect(package.fragile).toBe(true);
  });

  it("has a broken property that is initialized to false", function() {
    expect(package.broken).toEqual(false);
  });

  it("has an isBroken() method that returns whether it is broken or not", function() {
    package.broken = true;
    expect(package.isBroken()).toEqual(true);
  });

  it("has a method shake that sets broken to true if it is fragile", function(){
    package.setFragile(true);
    package.shake();
    expect(package.isBroken()).toEqual(true);
  });

  it("has a isHeavy method", function(){
    spyOn(package, 'isHeavy').andCallThrough();
    var answer = package.isHeavy();
    expect(package.isHeavy).toHaveBeenCalled();
    expect(answer).toBe(true);
  });

});





