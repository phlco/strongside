describe("Postcard", function(){
  it("has a message", function(){
    var p = new Postcard("Wish you were here!");
    expect(p.message).toBeDefined();
  });
});