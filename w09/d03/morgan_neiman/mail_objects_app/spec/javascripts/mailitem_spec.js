describe("a mail item", function(){

  var mailitem;

  beforeEach( function() {
    mailitem = new MailItem("34 north 7th st");
  });

  it("has a shipping address", function() {
    mailitem.writeAddress("34 north 7t st");
    expect(mailitem.shippingAddress).toEqual("34 north 7t st");
    var test = function() {
      mailitem.writeAddress(400);
    };
    expect(test).toThrow();
  });
  it("has a stamp value number", function() {
    mailitem.addStamp(4);
    expect(mailitem.stampValue).toEqual(4);
    var test = function() {
      mailitem.addStamp("flalaa");
    };
    expect(test).toThrow();
  });

});