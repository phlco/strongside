describe("MailBox", function(){
  var box, p, pk;

  beforeEach(function () {
    box = new MailBox();
    // create some mail items
    p = new Postcard("Hello from New York!");
    pk = new Package();
  });

  it("has an array of mailItems", function(){
    // uses custom matcher .toBeTypeOf
    // defined in spechelper.js
    expect(box.mailItems).toBeTypeOf("Array");
  });

  describe("acceptMail()", function(){
    it("places mail into mailItems array", function() {
      // pass in some mail
      box.acceptMail(p);
      box.acceptMail(pk);

      // the mail should be in the array
      expect(box.mailItems).toContain(p);
      expect(box.mailItems).toContain(pk);
    });

    it("only takes postcards and packages as input", function() {
      // these are not mail items (packages or postcards)
      var notMail = "I'm a TXT, LOL YOLO";
      var email = { to: "kingsdaughter@yahoo.com", msg: "You've won!"};

      // pass in the junk
      box.acceptMail(notMail);
      box.acceptMail(email);

      // the junk should not be in the array
      expect(box.mailItems).not.toContain(notMail);
      expect(box.mailItems).not.toContain(email);
    });

  });

  describe("openMail()", function(){

    it("returns the first mailItem", function(){
      // save a reference to the first item
      var firstMailItem = box.mailItems[0];

      var mail = box.openMail();
      expect(mail).toBe(firstMailItem);
    });

    it("removes any opened mail from the mailItem array", function(){
      var mail = box.openMail();
      expect(box.mailItems).not.toContain(mail);
    });
  });

  describe("toString()", function(){
    beforeEach(function(){
      box.acceptMail(p);
      box.acceptMail(pk);
    });

    it("returns a count of total postcards and packages", function(){
      expect(box.toString()).toBe("The mailbox has 1 postcard(s) and 1 package(s).");
    });
  });
});