describe ("a mail item", function(){

  var mailitem;

  beforeEach(function(){
    mailitem = new Mailitem("200 East 30th Street");
  });

  it("has a shipping address", function(){
    mailitem.writeAddress("200 East 31st Street");
    expect(mailitem.shipToAddress).toEqual("200 East 31st Street");
    var test = function() {
      mailitem.writeAddress(400);
    };
    expect(test).toThrow();
  });

  it("has a stamp value number", function() {
    mailitem.addStamp(4);
    expect(mailitem.stampValue).toEqual(4);
    var test = function() {
      mailitem.addStamp("woohoo");
    };
    expect(test).toThrow();
  });

});

describe("a package", function(){
  var packageItem;

  beforeEach(function(){
    packageItem = new Package();
  });

  it("has an array of content", function(){
    packageItem.addContent("present");
    packageItem.addContent("letter");
    expect(packageItem.content).toEqual(["present", "letter"]);
  });

  it("has a fragile boolean", function(){
    packageItem.setFragile(true);
    expect(packageItem.fragile).toBe(true);
    var test = function() {
      packageItem.setFragile("hi");
    };
    expect(test).toThrow();
  });

  it("has a broken boolean", function(){
    expect(packageItem.broken).toBe(false);
  });

  it("has a method shake", function(){
    packageItem.shake();
    expect(packageItem.broken).toBe(false);
    packageItem.setFragile(true);
    packageItem.shake();
    expect(packageItem.broken).toBe(true);
  });

  it("has an is broken method", function(){
    expect(packageItem.isBroken()).toBe(false);
    packageItem.setFragile(true);
    packageItem.shake();
    expect(packageItem.isBroken()).toBe(true);
  });
});

describe("a mailbox", function(){

  var mailbox, postcard, packageItem;

  beforeEach( function(){
    mailbox = new Mailbox();
    postcard = new Postcard();
    packageItem = new Package();
  });

  it("has an array of mailitem objects", function() {
    except(mailbox.mailItems).toEqual([]);
  });

  it("has an acceptmail method", function(){
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageItem);
    expect(mailbox.mailItems).toEqual([postcard, packageItem]);
    var test = function() {
      mailbox.acceptMail("Not a mail item");
    };
    expect(test).toThrow();
  });

  it("has an openmail function that removes the first item in the mailitems array", function(){
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageItem);
    mailbox.openMail();
    expect(mailbox.mailItems).toEqual([packageItem]);
  });

  it("has a toString method", function() {
    mailbox.acceptMail(postcard);
    mailbox.acceptMail(packageItem);
    expect(mailbox.toString()).toEqual("The mailbox has 1 postcards and 1 packages");
  });

});

describe("a postcard", function(){

  it("has a message string", function(){
    postcard = new Postcard();
    postcard.writeMessage("Greetings!");
    var test = function() {
      postcard.writeMessage(500);
    };

    expect(postcard.message).toEqual("Greetings!")
    expect(test).toThrow();
  });

});

  // it "has a ship_to_address" do
  //   mail_item = Mailitem.new(ship_to_address: '1 North Pole')
  //   expect(mail_item.ship_to_address).to eq('1 North Pole')
  // end

  // it "has a stamp value" do
  //   mail_item = Mailitem.new(stamp_value: 'yomomma')
  //   expect(mail_item.stamp_value).to eq 'yomomma'
  // end


// describe("a bus", function(){
//   var bus, passenger, passenger2;

//   beforeEach(function(){
//     bus = new Bus();
//     passenger = { name: "Levon Helm" };
//     passenger2 = { name: "Yoko Ono"};
//   });

//   it("is empty", function(){
//     expect(bus.isEmpty()).toBe(true);
//   });

//   it("accepts a passenger", function(){
//     bus.add(passenger);
//     expect(bus.isEmpty()).not.toBe(true);
//   });

//   it("returns true if it contains a specific passenger", function() {
//     bus.add(passenger);
//     expect(bus.contains(passenger)).toBe(true);
//     expect(bus.contains(passenger2)).toBe(false);
//   });

//   it("accepts multiple passengers", function(){
//     bus.add(passenger);
//     expect(bus.getSize()).toBe(1);
//     bus.add(passenger2);
//     expect(bus.getSize()).toBeGreaterThan(1);
//   });

//   it("won't accept same passenger twice and throws error", function() {
//     bus.add(passenger);
//     expect(bus.getSize()).toBe(1);
//      var test = function() {
//       bus.add(passenger);
//     }
//     expect(test).toThrow();
//     expect(bus.getSize()).toBeLessThan(2);
//   });

//   it("returns a list of passengers names", function() {
//     bus.add(passenger);
//     bus.add(passenger2);
//     expect(bus.getPassengers()).toEqual(["Levon Helm", "Yoko Ono"]);
//   });


// });
