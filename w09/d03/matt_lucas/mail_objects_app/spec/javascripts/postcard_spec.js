describe("a postcard", function() {

  it("has a message when created", function(){
    postcard = new postCard('Hi');
    expect(postcard.message).toBe('Hi');
  });

});