// Mailbox Object

// Mailbox should have an array of MailItem objects
// Mailbox should have an acceptMail method
// acceptMail should take a postcard or package
// acceptMail should place that mail in the Mailbox's array of MailItem objects
// Mailbox should have an openMail method that removes and returns the first item in its array of MailItem objects
// Mailbox should have a toString method that includes the number of postcards and packages in the mailbox
// Example: The mailbox has 16 postcards and 3 packages

describe("a Mailbox", function() {

  beforeEach(function(){
    mailbox = new Mailbox();
    mail1 = new mailItem('times square');
    mail2 = new mailItem('123 north pole');
    mailbox.acceptMail(mail1);
    mailbox.acceptMail(mail2);

  });

  it("has an array of MailItem Objects", function() {
    expect(mailbox.getMail()).toEqual([mail1, mail2]);
  });




});
