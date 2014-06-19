describe("a package", function(){

  var packageItem;

  beforeEach( function() {
    packageItem = new Package();
  });

  it("has an array of content", function() {
    packageItem.addContent("present");
    packageItem.addContent("letter");
    expect(packageItem.content).toEqual(["present", "letter"]);
  });

  it("has a fragile boolean", function(){
    packageItem.setFragile(true);
    expect(packageItem.fragile).toBe(true);
    var test = function() {
      packageItem.setFragile("hi");
    };
    expect(test).toThrow();
  });

  it("has a broken boolean", function() {
    expect(packageItem.broken).toBe(false);
  });

  it("has a method shake", function() {
    packageItem.shake();
    expect(packageItem.broken).toBe(false);
    packageItem.setFragile(true);
    packageItem.shake();
    expect(packageItem.broken).toBe(true);
  });

  it("has an isbroken method", function() {
    expect(packageItem.isBroken()).toBe(false);
    packageItem.setFragile(true);
    packageItem.shake();
    expect(packageItem.isBroken()).toBe(true);
  });

});