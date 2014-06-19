describe("a mailbox", function() {
  var m;

  beforeEach(function() {
    m = new mailBox();
    m.acceptMail("postcard");
    m.acceptMail("stuff");
    m.acceptMail("more stuff");
    n = new mailBox();

  });

  it("is empty when created", function() {
    expect(n.isEmpty()).toBe(true);
  });

  it("accepts mailitems", function() {
    expect(m.isEmpty()).toBe(false);
  });

  it("has an open mail method that removes and returns the first item", function(){
    expect(m.openMail()).toBe('postcard');
  });

  it("has a to string method that returns the number of things in the box", function(){
    expect(m.toString()).toBe('you have 3 things to open');
  });



});