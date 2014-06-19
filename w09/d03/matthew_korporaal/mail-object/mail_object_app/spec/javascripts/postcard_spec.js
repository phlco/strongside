describe(".postcard", function () {

  describe("Properties", function () {

    beforeEach(function () {
      postcard = new Postcard();
    });

    it("should have a message string", function () {
      expect(postcard.message).toBeDefined();
    });
  });
});