describe("a parcel", function(){

  var parcel;

  beforeEach(function(){
    parcel = new Parcel([]);
  });

  it("has a content array", function(){
    expect(parcel.content).toEqual([]);
  }); // has a content array

  it("has a fragile boolean value", function(){
    expect(parcel.fragile).toBe(false);
  }); // has a fragile boolean

  it("has a broken boolean value", function(){
    expect(parcel.broken).toBe(false);
  }); // has a broken boolean

  it("has a shake method that breaks the contents", function(){
    parcel.shake();
    expect(parcel.broken).toBe(true);
  }); // has a shake function that turns a the broken boolean to false

  it("tells you whether it's broken or not", function(){
    parcel.shake();
    expect(parcel.broken).toBe(true);
  }); // tell you whether it's broken




}); // describe a parcel
