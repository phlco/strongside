describe("a MailItem", function(){

  var mailItem;

  beforeEach(function(){
    letter = new MailItem("1210 Western Avenue", 0.50);
  });

  it("should have a mailToAddress", function(){
    expect(letter.getToAddress()).toEqual("1210 Western Avenue");
  }); // it should have a mailToAddress

  it("should have a stamp value number", function(){
    expect(letter.getPostageAmount()).toEqual(0.50);
  }); // should have a stamp value number

}); // describe a mailItem
