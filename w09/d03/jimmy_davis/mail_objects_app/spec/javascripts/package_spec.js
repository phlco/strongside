describe("a package", function(){

  var packageItem;

  beforeEach( function() {
    packageItem = new Package();
  });

  it("has a content array", function() {
    packageItem.addContent("shirt");
    packageItem.addContent("pants");
    expect(packageItem.content).toEqual(["shirt", "pants"]);
  });

  it("has a fragile boolean", function(){
    packageItem.isFragile(true);
    expect(packageItem.fragile).toBe(true);
    var test = function() {
      packageItem.isFragile("not");
    };
    expect(test).toThrow();
  });

  it("has a broken boolean", function() {
    expect(packageItem.broken).toBe(false);
  });

  it("has a shake method", function() {
    packageItem.shake();
    expect(packageItem.broken).toBe(false);
    packageItem.isFragile(true);
    packageItem.shake();
    expect(packageItem.broken).toBe(true);
  });

  it("has an isBroken method that returns whether broken or not", function() {
    expect(packageItem.isBroken()).toBe(false);
    packageItem.isFragile(true);
    packageItem.shake();
    expect(packageItem.isBroken()).toBe(true);
  });

});
