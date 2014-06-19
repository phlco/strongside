describe("package object", function(){
    var gift;
    beforeEach(function(){
      gift = new Package();
    });

  it("has a content array", function(){
    expect(gift.content).toMatch([]);
  });

  it("has a fragile boolean", function(){
    expect(gift.fragile).toMatch(true);
  });

  it("has a broken boolean", function(){
    expect(gift.broken).toMatch(false);
  });

  it("has a method shake that sets broken to true if fragile", function(){
    gift.shake();
    expect(gift.broken).toMatch(true);
  });

  it("has an isBroken method that returns whether it is broken or not", function(){
    gift.shake();
    expect(gift.isBroken()).toMatch(true);
  });

});
