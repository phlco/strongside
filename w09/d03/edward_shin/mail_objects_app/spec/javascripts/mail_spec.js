describe("mail", function(){

  it("has a shipping address", function(){
    var mail = new Mail();
    mail.shippingAddress = "1 main st";
    expect(mail.shippingAddress).toBe("1 main st");
  });

  it("has a stamp value", function(){
    var mail = new Mail();
    mail.stampValue = 5;
    expect(mail.stampValue).toBe(5);
  });

})