describe("Package", function(){
  var p;

  beforeEach(function () {
    p = new Package();
  });

  it("has a content array", function(){
    expect(p.content).toBeTypeOf("Array");
  });

  it("has a fragile indicator", function(){
    expect(p.fragile).toBe(false);
  });

  it("tells us if it's broken", function(){
    p.broken = true;
    expect(p.isBroken()).toEqual(p.broken);
    p.broken = false;
    expect(p.isBroken()).toEqual(p.broken);
  });

  describe("shake()", function(){
    it("doesn't break packages", function(){
      p.shake();
      expect(p.isBroken()).toBe(false);
    });

    it("breaks fragile packages", function(){
      p.fragile = true;
      p.shake();
      expect(p.isBroken()).toBe(true);
    });

  });
});