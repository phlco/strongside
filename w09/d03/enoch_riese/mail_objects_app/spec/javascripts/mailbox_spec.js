describe("a mailbox", function() {
  beforeEach(function() {
    mail = new Mailbox();
    pack1 = new Package({
      contents: ["flowers", "candy"],
      fragile: false
    });
    post1 = new Postcard("hey");
    post2 = new Postcard("hi");
  })
  it("should have an array of mailitems", function() {
    expect(Array.isArray(mail.items)).toBe(true);
  });
  describe("acceptMail method", function() {
    it("should take a Postcard or Package", function() {
      mail.acceptMail(pack1);
      expect(mail.items[mail.items.length - 1]).toBe(pack1);
    });
  });
  describe("openMail method", function() {
    beforeEach(function() {
      mail.acceptMail(pack1);
      mail.acceptMail(post1);
    });
    it("should remove last item in the array", function() {
      mail.openMail();
      expect(mail.items.length).toBe(1);
    });
    it("should return the item it removes", function(){
      expect(mail.openMail()).toBe(post1);
    });
  });
  describe("toString method", function() {
    it("should tell you how many postcards and packages it has", function() {
      mail.acceptMail(pack1);
      mail.acceptMail(post1);
      mail.acceptMail(post2);
      expect(mail.toString()).toBe("The Mailbox has 2 postcards and 1 packages");
    });
  });
});
