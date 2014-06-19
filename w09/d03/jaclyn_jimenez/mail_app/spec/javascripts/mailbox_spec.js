describe("mailbox object", function() {
  var mailbox;
  var post1;
  beforeEach(function(){
    mailbox = Mailbox.new;
    post1 = Postcard.new;
  });

it("should have an acceptMail method that takes a postcard or package & adds item to array", function() {
  mailbox.acceptMail(post1);
  expect(mailbox.contents).toMatch([post1]);
});

it("should have an openMail method that removes and returns first item in array", function(){

});



});
