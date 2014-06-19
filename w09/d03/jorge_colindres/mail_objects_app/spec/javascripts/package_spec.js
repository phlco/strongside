describe('a package', function(){

  var packageObject;
  beforeEach(function(){
    packageObject = new Package('a book');
  });

  it('should have content', function(){
    expect(packageObject.contents).toBeDefined();
    expect(packageObject.contents).toBe('a book');
  });

  it('should have a fragile boolean', function(){
    packageObject.fragile = true;
    expect(packageObject.fragile).toBeTruthy();
    packageObject.fragile = false;
    expect(packageObject.fragile).toBeFalsy();
  });

  it('should have a broken boolean', function(){
    packageObject.broken = true;
    expect(packageObject.broken).toBeTruthy();
    packageObject.broken = false;
    expect(packageObject.broken).toBeFalsy();
  });

  it('should have a method shake', function(){
    expect(packageObject.shake).toBeDefined();
  });

  it('should break if it is fragile and is shaken', function(){
    packageObject.fragile = true;
    packageObject.shake();
    expect(packageObject.broken).toBeTruthy();
  });

});
