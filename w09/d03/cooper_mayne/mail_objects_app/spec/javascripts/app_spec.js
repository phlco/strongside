describe("MailItem", function() {
  
  it("should have a shipToAddress string", function() {
    mail = new MailItem({address: "123 abc st"});
    expect(mail.shipToAddress).toBe("123 abc st")
  })

  it("should have a stampValue number", function() {
    mail = new MailItem({address: "123 abc st", stampValue: 123});
    expect(mail.stampValue).toBe(123)
  })
})


describe("Postcard", function() {
  it("should have a message string", function() {
    var postcard = new PostCard({message: "hello world"});
    expect(postcard.message).toBe("hello world")
  })
})

describe("Package", function() {
  it("should have an empty content array", function() {
    var pack = new Package();
    expect(pack.content).toEqual([])
  })

  it("should have a content array", function() {
    var pack = new Package();
    pack.content = ["stuff","mroe stuff"]
    expect(pack.content).toEqual(["stuff","mroe stuff"])
  })

  it("should have a fragile boolean", function() {
    var pack = new Package();
    expect(pack.fragile).toBe(false)
  })

  it("should have a broken boolean, false by default", function() {
    var pack = new Package();
    expect(pack.broken).toBe(false)
  })

  it("#shake() breaks it if its fragile", function() {
    var pack = new Package();
    pack.fragile = true
    pack.shake();
    expect(pack.broken).toBe(true);
  })

  it("#shake() doesn't break if its  not fragile", function() {
    pack = new Package();
    pack.shake();
    expect(pack.broken).toBe(false);
  })
  
  it("#shake() many times and package remains broken", function() {
    pack = new Package();
    pack.fragile=true
    pack.shake();
    pack.shake();
    expect(pack.broken).toBe(true);
  })
})

describe("MailBox", function() {
  it("should have an array of MailItem objects", function() {
    var mailBox = new MailBox()
    expect(mailBox.content).toEqual([])
  })

  it("#acceptMail should take a postcard or package", function() {
    var mailBox = new MailBox()
    mailBox.acceptMail('thePackage')
    expect(mailBox.content).toEqual(['thePackage'])
  })

  it("#acceptMail should take many postcard or package", function() {
    var mailBox = new MailBox()
    mailBox.acceptMail('thePackage')
    mailBox.acceptMail('thePackage2')
    mailBox.acceptMail('thePackage3')
    expect(mailBox.content).toEqual(['thePackage','thePackage2','thePackage3'])
  })

  it("#openMail should return and remove first mailitem", function() {
    var mailBox = new MailBox()
    mailBox.acceptMail('thePackage')
    mailBox.acceptMail('thePackage2')
    mailBox.acceptMail('thePackage3')
    expect(mailBox.openMail()).toBe('thePackage')
    expect(mailBox.content.length).toBe(2)
  }) 

  it("#toString returns number of postcards/packages", function() {
    var mailBox = new MailBox()
    var pack1 = new Package();
    var pack2 = new Package();
    var pack3 = new Package();
    var postcard1 = new PostCard({message: "hello world"});
    var postcard2 = new PostCard({message: "goodbye world"});
    mailBox.acceptMail(pack1);
    mailBox.acceptMail(pack2);
    mailBox.acceptMail(pack3);
    mailBox.acceptMail(postcard1);
    mailBox.acceptMail(postcard2);
    expect(mailBox.toString()).toEqual("The mailbox has 2 postcards and 3 packages")
  }) 
})
