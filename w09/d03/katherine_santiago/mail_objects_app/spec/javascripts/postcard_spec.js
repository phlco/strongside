describe("a postCard", function() {

  it("has a message when created", function() {
    postcard = new postCard("Wish you were here!");
    expect(postcard.message).toBe("Wish you were here!");
  });
});