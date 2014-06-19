describe("a mailbox", function(){

  var mailbox, postcard, packageItem;

  beforeEach( function() {
    mailbox = new Mailbox();
    postcard = new Postcard();
    packageItem = new Package();
  });

  it("has an array of mailitem objects", function() {
    expect(mailbox.mailItems).toEqual([]);
  });

  it("has an acceptmail method", function(){
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageItem);
    expect(mailbox.mailItems).toEqual([postcard, packageItem]);
    var test = function() {
      malbox.acceptMail("i'm not a mail item!!!!");
    };
    expect(test).toThrow();
  });

  it("has an openmail function that removes the first item in the mailitems array", function() {
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageItem);
    mailbox.openMail();
    expect(mailbox.mailItems).toEqual([packageItem]);

  });

  it("has a toString method", function() {
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageItem);
    expect(mailbox.toString()).toEqual("The mailbox has 1 postcards and 1 packages");
  });

});