describe("postcard object", function(){
    var p;
    beforeEach(function(){
      p = new Postcard();
    });

  it("has a message string", function(){
    expect(p.message).toMatch("Wish You Were Here!");
  });


});
