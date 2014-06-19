describe(".package", function () {

  describe("Properties", function () {

    beforeEach(function () {
      package = new Package();
    });

    it("should have a content array", function () {
      expect(package.content).toBeDefined();
    });

    it("should have a fragile boolean", function () {
      expect(package.fragile).toBeDefined();
    });

    it("should have a broken boolean", function () {
      expect(package.broken).toBeDefined();
    });
  });

  describe("Methods", function () {
    beforeEach(function () {
      package = new Package();
    });

    it("should have a #shake function", function () {
      expect(package.shake).toBeDefined();
    });

    it("should be 'broken', if 'fragile' and #shake is invoked", function () {
      package.fragile = true;
      package.shake();
      expect(package.broken).toBe(true);
    });
  });
});