describe("a package", function(){
  var pckg;
  beforeEach(function(){
    pckg = new Package();
  });

  it("has a content array", function(){
    expect(pckg.contentArray).toEqual([]);
  });

  it("has a fragile indicator", function(){
    expect(pckg.fragile).toBe(false);
  });

  it("has a broken indicator", function(){
    expect(pckg.broken).toBe(false);
  });

  it("has a shake method that will break the contents of the package if it is fragile", function(){
    pckg.fragile = true;
    pckg.shake();
    expect(pckg.broken).toBe(true);
  });

  it("has a isBroken method that tells me if my package is broken", function(){
    pckg.broken = true;
    expect(pckg.isBroken()).toBe(true);
  });

})