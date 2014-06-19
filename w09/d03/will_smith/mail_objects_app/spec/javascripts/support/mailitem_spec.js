describe("a mailitem", function(){
  var mailitem;
  beforeEach(function(){
    mailitem = new Mailitem();
    mailitem.shipToAddress = "118 East 1st Street";
    mailitem.stampValue = 42;
  });

  it ("has a shipping address", function(){
    expect(mailitem.shipToAddress).toEqual("118 East 1st Street");
  });

  it ("has a stamp that has a value", function(){
    expect(mailitem.stampValue).toEqual(42);
  });
});
