describe("a mailbox", function(){
  var mailbox, pckg, postcard;
  beforeEach(function(){
    mailbox = new Mailbox();
    pckg = new Package();
    postcard = new Postcard();
  });

  it("has an array of mail item objects", function(){
    expect(mailbox.objects).toBeArray;
  });

  it("has a method takes in a postcard or package", function(){
    mailbox.acceptMail(pckg);
    expect(mailbox.objects[0]).toBe(pckg);
    mailbox.acceptMail(postcard)
    expect(mailbox.objects[1]).toBe(postcard)
  });

  it("has a method, openMail, that removes and returns the first item in the objects array", function(){
    mailbox.acceptMail(pckg);
    mailbox.acceptMail(postcard)
    expect(mailbox.openMail()).toEqual(pckg);
    expect(mailbox.objects.length).toEqual(1);
  });

  it("has a to_string method that includes the number of postcards and packages in the mail", function(){
    for(var i = 0; i < 16; i++) {
      postcard = new Postcard();
      mailbox.acceptMail(postcard);
    }
    for(var i = 0; i < 3; i++) {
      pckg = new Package();
      mailbox.acceptMail(pckg);
    }
    expect(mailbox.objects.length).toEqual(19);
    mailbox.toString();
    expect(mailbox.toString()).toEqual("There are 16 postcards and 3 packages");
  })
})