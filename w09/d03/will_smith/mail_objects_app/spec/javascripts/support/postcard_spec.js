describe("a postcard", function(){
  var postcard;
  beforeEach(function(){
    postcard = new Postcard();
    postcard.message = "Dear sweet Gloria - Love you, Captain Skinboat.";
  });

  it ("contains a message", function(){
    expect(postcard.message).toEqual("Dear sweet Gloria - Love you, Captain Skinboat.")
  });
});
