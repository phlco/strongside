describe("a mailbox", function() {
  var m;

  beforeEach(function() {
    m = new mailBox();
    n = new mailBox();
    n.acceptMail('stuff');
    n.acceptMail('things');
  });

  it("is empty when created", function() {
    expect(m.isEmpty()).toBe(true);
  });

  it("can accept mail", function(){
    expect(n.isEmpty()).not.toBe(true);
  });

  it("has an open mail method that removes and returns the first item", function(){
    expect(n.openMail()).toBe('stuff');
  });

  it("has an open mail method that removes and returns the first item", function(){
    expect(n.openMail()).toBe('stuff');
  });

  it("has a to string method that returns the number of things in the box", function(){
    expect(n.toString()).toBe('you have 2 things to open');
  });

});