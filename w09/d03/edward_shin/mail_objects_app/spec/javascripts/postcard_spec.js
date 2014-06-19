describe("a postcard", function(){

  it("has a message", function(){
    postcard = new Postcard();
    postcard.message = "HI MOM!"
    expect(postcard.message).toBe("HI MOM!");
  })

})