describe(".mailbox", function () {

  describe("Properties", function () {

    it("should have and array of items", function () {
      mailbox = new Mailbox();
      expect(mailbox.items).toBeDefined();
    });

    it("should have tally properties initialized", function () {
      expect(mailbox.packageTally).toBe(0);
      expect(mailbox.postcardTally).toBe(0);
      expect(mailbox.unknownTally).toBe(0);
    });
  });

  describe("Methods", function () {

    beforeEach(function () {
      mailbox = new Mailbox();
    });

    it("should have #acceptMail method", function () {
      expect(mailbox.acceptMail).toBeTypeOf("function");
    });

    it("should #acceptMail with types .postcard or .package", function () {
      postcard = new Postcard();
      mailbox.acceptMail(postcard);
      expect(mailbox.items.length).toBe(1);
      package = new Package();
      mailbox.acceptMail(package);
      expect(mailbox.items.length).toBe(2);
    });

    it("should have #openMail method", function () {
      expect(mailbox.openMail).toBeTypeOf("function");
    });

    it("should removes and returns 1st item in array", function () {
      postcard = new Postcard();
      mailbox.acceptMail(postcard);
      package = new Package();
      mailbox.acceptMail(package);
      expect(mailbox.openMail()).toMatch(package);
    });

    it("should have #toString method", function () {
      expect(mailbox.toString).toBeTypeOf("function");
    });

    it("should return number of each type of mail items in a string", function () {
      postcard = new Postcard();
      mailbox.acceptMail(postcard);
      package = new Package();
      mailbox.acceptMail(package);
      expect(mailbox.toString()).toBe("The mailbox has 1 postcards and 1 packages");
    });

    it("should have #tally method", function () {
      expect(mailbox.tally).toBeTypeOf("function");
    });

    it("should increment when '++' and mail item is passed", function () {
      postcard = new Postcard();
      mailbox.tally("++", postcard);
      expect(mailbox.postcardTally).toBe(1);
      package = new Package();
      mailbox.tally("++", package);
      expect(mailbox.packageTally).toBe(1);
    });

    it("should decrement when '--' and mail item is passed", function () {
      // increment first
      postcard = new Postcard();
      mailbox.tally("++", postcard);
      package = new Package();
      mailbox.tally("++", package);
      // then decrement
      postcard = new Postcard();
      mailbox.tally("--", postcard);
      expect(mailbox.postcardTally).toBe(0);
      package = new Package();
      mailbox.tally("--", package);
      expect(mailbox.packageTally).toBe(0);
    });
  });
});