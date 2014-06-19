describe("a Postcard", function(){

  beforeEach(function(){
    postcard = new Postcard();
    message = "Hi Mom";
    postcard.message(message);
  });

  it("has a messages that is a string", function(){
    expect(postcard.message).toBe("Hi Mom");
    expect(typeof(postcard.message)).toBe("string");
  });



});
