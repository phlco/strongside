describe("person", function(){

  var
    person = new Person({gender: 'female'}),
    lotion = new Lotion({brand: "Jurgens", ounces: 32}),
    basket = new Basket({material: "wicker", contents: []});

  it("takes the lotion", function(){
    person.take(lotion);

    expect(person.hasLotion()).toBe(true);
  });

  it("rubs the lotion on its skin", function(){
    spyOn(lotion, 'squeeze').andCallThrough();
    person.applyLotion();

    expect(lotion.squeeze).toHaveBeenCalled();
    expect(person.isLotioned()).toBe(true);
    expect(lotion.ounces).toBeLessThan(32)
  });

  it("places the lotion in the basket", function(){
    person.place(lotion, basket);

    expect(person.hasLotion()).toBe(false);
    expect(basket.contains(lotion)).toBe(true);
  });

});
