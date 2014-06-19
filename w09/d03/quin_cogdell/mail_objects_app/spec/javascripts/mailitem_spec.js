describe("a mailItem",function(){
  var mail, address, stampValue;

  beforeEach(function(){
    mail = new mailItem();
    address = "123 North Pole";
    addressBad = 123;
    stampPrice = 0.40;
    stampPriceBad = "0.40";
  });

  it("has a shipToAddress", function(){
    mail.shipToAddress(address);
    expect(mail.shipToAddress).toBe("123 North Pole");
  });

  it("has a shipToAddress that is a string", function(){
    var testAddress = function() {
      mail.shipToAddress(addressBad);
    };
    expect(testAddress).toThrow();
  });

  it("has a stampValue", function(){
    mail.stampValue(stampPrice);
    expect(mail.stampValue).toBe(0.40);
  });

  it("has a shipToAddress that is a string", function(){
    var testStampValue = function() {
      mail.stampValue(stampPriceBad);
    };
    expect(testStampValue).toThrow();
  });


});



