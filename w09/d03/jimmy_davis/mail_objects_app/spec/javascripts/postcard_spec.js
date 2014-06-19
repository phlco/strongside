describe("a postcard", function(){

 it("has a message string", function() {
   postcard = new Postcard();
   postcard.writeMessage("Greetings from NYC!");
   var test = function() {
     postcard.writeMessage(123);
   };
   expect(postcard.message).toEqual("Greetings from NYC!");
   expect(test).toThrow();
  });

 });
