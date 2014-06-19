describe("MailItem", function(){
  var mailItem;

  beforeEach(function () {
    mailItem = new MailItem("805 Spence Cir");
  });

  it("has a shipToAddress property", function() {
    expect(mailItem.shipToAddress).toBe("805 Spence Cir");
  });

  it("has a stampValue property", function() {
    expect(mailItem.stampValue).toBeDefined();
  });
});