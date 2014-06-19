describe("a package", function() {
  var pack;
  beforeEach(function() {
    pack = new Package({
      contents: ["flowers", "candy"],
      fragile: false
    });
  });
  it("should have a contents array", function() {
    expect(Array.isArray(pack.contents)).toBe(true);
  });
  it("should have a fragile boolean", function() {
    expect(typeof(pack.fragile)).toBe("boolean");
  })
  describe("method: shake", function() {
    it("should break the package if it's fragile", function() {
      pack.fragile = true;
      pack.shake();
      expect(pack.broken).toBe(true);
    });
    it("should not break the package if it's not fragile", function() {
      pack.shake();
      expect(pack.broken).toBe(false);
    });
  });
  it("should tell you if it's broken with isBroken()", function() {
    expect(pack.isBroken()).toBe(false);
  });
});
