describe("postcard", function(){
  it("has a message string", function(){
    var postcard = new Postcard();
    postcard.message = "oh hello there"
    expect(postcard.message).toBe("oh hello there");
  });
})
