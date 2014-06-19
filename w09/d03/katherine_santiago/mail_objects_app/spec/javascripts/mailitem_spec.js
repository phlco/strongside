describe("a mailitem", function() {

  beforeEach(function() {
    mailitem = new mailItem("New York", .50);
  });

  it("is created with a shipToAddress", function() {
    expect(mailitem.shipToAddress).toBe("New York");
  });

  it("has a stampValue when created", function() {
    expect(mailitem.stampValue).toBe(.50);
  });
});