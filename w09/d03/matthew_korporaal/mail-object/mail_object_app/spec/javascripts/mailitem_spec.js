describe(".mailItem", function () {

  describe("Properties", function () {

    beforeEach(function () {
      mailitem = new MailItem();
    });

    it("should have a shipToAddress string", function () {
      expect(mailitem.shipToAddress).toBeDefined();
    });

    it("should have a stampValue number", function () {
      expect(mailitem.stampValue).toBeDefined();
    });
  });
});