describe("a mailitem", function() {
  var mailitem;
  beforeEach(function() {
    mailitem = new Mailitem("140 Franklin", 0.37);
  });
  it("has a shipToAddress string", function() {
    expect(typeof(mailitem.shipToAddress)).toBe("string");
  });
  it("has a stampValue number", function() {
    expect(typeof(mailitem.stampValue)).toBe("number")
  });
});
