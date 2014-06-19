describe("a mailItem", function() {

  it("is created with a shipToAddress", function() {
    mailitem = new mailItem('new york');
    expect(mailitem.shipToAddress).toBe('new york');
  });
  it("is created with a stampValue", function() {
    mailitem = new mailItem('new york', '50');
    expect(mailitem.stampValue).toBe('50');
  });

});