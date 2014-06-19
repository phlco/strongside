describe ("a package", function(){
  var packageObject;

  beforeEach(function(){
    packageObject = new Package();
  });

  it ("has a content array", function(){
    expect(packageObject.content).toBeDefined();
  });

  it ("has a fragile boolean", function(){
    expect(packageObject.fragile).toBeTruthy();
  });

  it ("has a broken boolean", function(){
    expect(packageObject.broken).not.toBeTruthy;
  });

  it ("breaks fragile package contents", function(){
    packageObject.content = ["Glassware", "China", "Grandparents"];
    packageObject.shake();
    expect(packageObject.broken).toBe(true);
  });

  it ("tells you if the package contents are broken", function(){
    packageObject.content = ["Glassware", "China", "Grandparents"];
    packageObject.shake();
    expect(packageObject.isBroken()).toEqual('yes, it is broken');
  });

});
