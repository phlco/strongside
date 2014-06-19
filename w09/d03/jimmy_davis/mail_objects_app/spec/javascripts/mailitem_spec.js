describe("a mail item", function(){

  var mailitem;

  beforeEach( function() {
    mailitem = new MailItem("902 Broadway");
  });

  it("has a ship to address", function() {
    mailitem.shipToAddress("902 Broadway");
    expect(mailitem.shipToAddress).toEqual("902 Broadway");
    var test = function() {
      mailitem.shipToAddress(902);
    };
    expect(test).toThrow();
  });

  it("has a stamp value", function() {
    mailitem.stampValue(43);
    expect(mailitem.stampValue).toEqual(43);
    var test = function() {
      mailitem.stampValue("nan");
    };
    expect(test).toThrow();
  });
});
