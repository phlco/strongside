
describe('a mail item', function(){

  var item;
  beforeEach(function(){
    item = new MailItem('.99', '123 Main');
  });

  it('should have a stampValue', function(){
    expect(item.stampValue).toBeDefined();
    expect(item.stampValue).toBe('.99');
  });

  it('should have a shipToAddress', function(){
    expect(item.shipToAddress).toBeDefined();
    expect(item.shipToAddress).toBe('123 Main');
  });
});
