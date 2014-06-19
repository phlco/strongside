describe("a postcard", function(){

it("has a message string", function() {
  postcard = new Postcard();
  postcard.writeMessage("miss you!");
  var test = function() {
    postcard.writeMessage(500);
  };

  expect(postcard.message).toEqual("miss you!");
  expect(test).toThrow();


});

});