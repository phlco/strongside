describe("a postcard", function(){

  var postcard;

  beforeEach(function(){
    postcard = new Postcard("Dear family, do not fret. I am well.");
  });

  it("has a message", function(){
    expect(postcard.getMessage()).toBe("Dear family, do not fret. I am well.");
  }); // it is empty

}); // describe a postcard
