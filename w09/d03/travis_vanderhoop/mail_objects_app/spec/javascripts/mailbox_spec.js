describe("a mailbox", function(){

  var mailbox;

  beforeEach(function(){
    mailbox = new Mailbox();
  });

  it("has an array of mailItems", function(){
    expect(mailbox.mailItems).toEqual([]);
  }); // has an array of mailItems

  it("only accepts parcels and postcards", function(){
    postcardHome = new Postcard("Hello and welcome");
    mailbox.acceptMail(postcardHome);
    expect(mailbox.mailItems[0]).toEqual(postcardHome);
    parcelHome = new Parcel(["$500"]);
    mailbox.acceptMail(parcelHome);
    expect(mailbox.mailItems[1]).toEqual(parcelHome);
    mailbox.acceptMail("Marp");
    expect(mailbox.mailItems[2]).toBe(undefined);
  }); // it only accepts mail

  it("can open mail in chronological order", function(){
    postcardHome = new Postcard("Hello and welcome");
    mailbox.acceptMail(postcardHome);
    parcelHome = new Parcel(["$500"]);
    mailbox.acceptMail(parcelHome);
    mailbox.openMail();
    expect(mailbox.mailItems[0]).toEqual(parcelHome);
  }); // can open mail in chronological order

  it("can tell you how many parcels and postcards it houses", function(){

  });







}); // describe Mailbox
