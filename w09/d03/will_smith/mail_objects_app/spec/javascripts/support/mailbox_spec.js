describe ("a mailbox", function(){
  var mailbox;

  beforeEach(function(){
    mailbox = new Mailbox();
  });

  it ("has an array of Mailitem objects", function(){
    expect(mailbox.mailItems).toBeDefined();
  });

  it ("has an accept mail method", function(){
    var mail = new Postcard();
    expect(mailbox.acceptMail(mail)).toBeDefined;
  });

  it ("can take a postcard or a package and place them into the array of mail items", function(){
    var postcard = new Postcard();
    var packageObject = new Package();
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageObject);
    expect(mailbox.mailItems).toEqual([postcard, packageObject]);
  });

  it ("can open mail", function(){
    var postcard = new Postcard();
    var packageObject = new Package();
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageObject);
    expect(mailbox.openMail()).toEqual(postcard);
  });
});

// Mailbox should have an openMail method that removes and returns the first item in its array of MailItem objects
