describe("package", function(){

  var pckg;

  beforeEach(function(){
    pckg = new Package();
  });

  it("has a content array", function(){
    expect(pckg).toBeArray;
  });

  it("has a fragile boolean", function(){
    expect(pckg).toBeBoolean;
  });

  it("has a broken boolean", function(){
    expect(pckg).toBeBoolean;
  });

  it("has a shake method that sets fragile and broken to true", function(){
    pckg.fragile = true;
    pckg.shake();
    expect(pckg.broken).toBe(true)
  })

  it("has an isBroken method that returns whether it is broken or not", function(){
    pckg.fragile = true;
    pckg.shake();
    expect(pckg.isBroken()).toBe(true)
  })


})
