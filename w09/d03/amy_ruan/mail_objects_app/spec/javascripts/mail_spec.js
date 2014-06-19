describe("a mail", function(){
  var mail;

  beforeEach(function(){
    mail = new Mail({shipToAddress: "902 Broadway", stampValue: 0.50});
  });

  it("has a shipToAddress", function(){
    expect(mail.shipToAddress).toBe("902 Broadway");
  });

  it("has a stampValue", function(){
    expect(mail.stampValue).toBe(0.50);
  });
});



describe("a postcard", function(){
  var postcard;

  beforeEach(function(){
    postcard = new Postcard({message: "hello"});
  });

  it("has a message", function(){
    expect(postcard.message).toBe("hello");
  });
})

describe("a package",function(){
  var package;

  beforeEach(function(){
    package = new Package();
  });

  it("has a content array", function(){
    expect(package.contents).toBeArray;
  });

  it("have a broken boolean", function(){
    expect(package.isBroken).toBe(false);
  });

  it("have a fragile boolean", function(){
    expect(package.isFragile).toBe(false);
  });

  it("can shake and change to broken if it is fragile",function(){
    package.shake();
    expect(package.isBroken).toBe(false);
    package.isFragile = true;
    package.shake();
    expect(package.isBroken).toBe(true);
  })

  it("has a broken method", function(){
    expect(package.isBroken1()).toBe(false);
  });
})

describe("a mailbox", function(){
  var mailbox, package, postcard;

  beforeEach(function(){
    mailbox = new Mailbox();
    package = new Package();
    postcard = new Postcard({message: "hello"});
  });

  it("has an array of mailitems", function(){
    var prototype=Object.getPrototypeOf(mailbox.contents);
    expect(prototype).toEqual([])
  });

  it("accepts postcards or packages", function(){
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(package);
    expect(mailbox.contents).toContain(postcard,package)
  });

  it("opens Mail and removes and returns the first item in its array of MailItem", function(){
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(package);
    expect(mailbox.openMail()).toBe(postcard);
  });

  it("has a toString method that tells you number of postcards and packages in the mailbox",function(){
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(package);
    mailbox.acceptMail(package);
    expect(mailbox.toString()).toBe("The mailbox has 1 postcards and 2 packages")
  })
})