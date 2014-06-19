describe('a postcard', function(){

  var postcard;
  beforeEach(function(){
    postcard = new Postcard('hello');
  });

  it('should have a message', function(){
    expect(postcard.message).toBeDefined();
    expect(postcard.message).toBe('hello');
  });
});
