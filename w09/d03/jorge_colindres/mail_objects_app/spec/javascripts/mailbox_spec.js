describe('a mailbox', function(){

  var mailbox, postcard, packageObject;
  beforeEach(function(){
    mailbox = new Mailbox();
    postcard = new Postcard('hello');
    packageObject = new Package('book');
  });

  it('should have an array of mail item objects', function(){
    expect(mailbox.mailitems).toBeDefined();
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageObject);
    expect(mailbox.mailitems).toContain(postcard);
    expect(mailbox.mailitems.length).toEqual(2);
  });

  it('should have an acceptMail method', function(){
    expect(mailbox.acceptMail).toBeDefined();
  });

  it('should accept postcards and packages and add them to the mailitems array', function(){
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageObject);
    expect(mailbox.mailitems).toContain(postcard);
  });

  it('should have an openMail method that removes and returns the first item in mailitems', function(){
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageObject);
    mailbox.openMail();
    expect(mailbox.mailitems.length).toEqual(1);
    expect(mailbox.mailitems).not.toContain(postcard);
  });

  it('should have a toString method that includes the number of postcards and packages in it', function(){
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageObject);
    expect(mailbox.toString()).toEqual('The mailbox has 1 postcards and 1 packages.');
  });
});
