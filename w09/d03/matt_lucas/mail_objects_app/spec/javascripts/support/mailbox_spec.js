describe("a mailbox", function() {
  var m;

  beforeEach(function() {
    m = new mailBox();
  });

  it("is empty when created", function() {
    expect(m.isEmpty()).toBe(true);
  });

});