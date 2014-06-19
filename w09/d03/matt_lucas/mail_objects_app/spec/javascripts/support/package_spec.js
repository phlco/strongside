describe("a package", function() {

  beforeEach(function() {
    p = new package();
    p.contents = "glass";
    p.fragile = true;
    p.broken = false;
  });

  it("has an array of objects when created", function(){
    expect(p.contents.constructor.class).toBe(undefined);
  });

  it("tells you when it's fragile", function() {
    expect(p.fragile).toBe(true);
  });

  it("tells you when it's broken", function() {
    expect(p.broken).toBe(false);
  });

  it("has a method called shake", function() {
    p.shake();
    expect(p.broken).toBe(true);
  });

});