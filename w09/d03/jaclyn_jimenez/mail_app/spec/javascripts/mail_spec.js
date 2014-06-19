// MailItem should have a shipToAddress string
// MailItem should have a stampValue number

describe("a mail item", function(){
  var mail;
  beforeEach(function(){
    mail = new MailItem();
  });

  it("should have a shipToAddress string", function() {
    expect(mail.shipToAddress).toMatch("902 Broadway");
  });

  it("should have a stampValue number", function() {
    expect(mail.stampValue).toMatch(20);
  });


});
