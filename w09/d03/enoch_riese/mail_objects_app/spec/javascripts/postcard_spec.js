describe("a postcard", function() {
  it("has a message string", function() {
    post = new Postcard("Hi");
    expect(typeof(post.message)).toBe("string");
  })
});
