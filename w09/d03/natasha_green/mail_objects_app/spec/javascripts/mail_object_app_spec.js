describe("Mailitem Object", function(){

  // it("is empty", function(){
  //   var mailItem = new MailItem();
  //   expect(mailItem.isEmpty()).toBe(true);
  // });

  it("has a ship to address", function(){
    var mailItem = new MailItem("Denver");
    expect(mailItem.shipToAddress).toBe("Denver");
  });
//we want to create a new mailitem that takes the parameter of its
//ship to address

  it("should have a stamp value", function(){
    var mailItem = new MailItem("Denver");
    expect(mailItem.stampValue).toBeDefined()
  //Used when you don't want it to be undefined

  });
});

