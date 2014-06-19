describe("Postcard Object", function(){
  it("has a message", function(){
  var postcard = new Postcard("Hi, how are you?");
  expect(postcard.message).toBe("Hi, how are you?");
});

});