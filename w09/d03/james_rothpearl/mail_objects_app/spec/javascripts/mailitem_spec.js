describe("mail", function(){

  it("has a shipping address", function(){
    var mail = new Mail();
    mail.shippingAddress = "1 main street"
    expect(mail.shippingAddress).toBe("1 main street");
  });

  it("has a stamp value number", function(){
    var mail = new Mail();
    mail.stampValue = "43"
    expect(mail.stampValue).toBe("43");

  })



})
