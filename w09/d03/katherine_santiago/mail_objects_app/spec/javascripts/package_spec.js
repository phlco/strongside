describe("a package", function() {

  beforeEach(function() {
    p = new package();
    p.contents = ["glass"];
    p.fragile = true;
    p.isBroken = false;
  });

  it("has a content array when created", function() {
    expect(p.contents.constructor.class).toBe(undefined);
  });

  it("tells you when it's fragile", function() {
    expect(p.fragile).toBe(true);
  });

  it("tells you when it's broken", function() {
    p.isBroken = true;
    expect(p.isBroken).toEqual(true);
  });

  it("has a method shake", function() {
    p.shake();
    expect(p.isBroken).toBe(true);
  });


});