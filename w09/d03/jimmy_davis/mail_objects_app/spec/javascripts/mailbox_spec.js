describe("a mailbox", function(){

  var mailbox, postcard, postcard2, postcard3, packageItem, packageItem2;

  beforeEach( function() {
    mailbox = new Mailbox();
    postcard = new Postcard();
    postcard2 = new Postcard();
    postcard3 = new Postcard();
    packageItem = new Package();
    packageItem2 = new Package();
  });

  it("has an array of mailitem objects", function() {
    expect(mailbox.mailItems).toEqual([]);
  });

  it("has an acceptMail method", function(){
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageItem);
    expect(mailbox.mailItems).toEqual([postcard, packageItem]);
    var test = function() {
      malbox.acceptMail("not a postcard or package");
    };
    expect(test).toThrow();
  });

  it("has an openMail function that removes and returns the first item in the mailitems array", function() {
    mailbox.acceptMail(packageItem);
    mailbox.acceptMail(postcard);
    mailbox.openMail();
    expect(mailbox.mailItems).toEqual([postcard]);
  });

  it("has a toString method", function() {
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(postcard2);
    mailbox.acceptMail(postcard3);
    mailbox.acceptMail(packageItem);
    mailbox.acceptMail(packageItem2);
    expect(mailbox.toString()).toEqual("The mailbox has 3 postcards and 2 packages");
  });

});
