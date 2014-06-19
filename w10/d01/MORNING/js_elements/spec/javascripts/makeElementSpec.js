// Create a function called make$Element that returns a jQuery wrapped DOM element.

describe("make$Element", function(){

  describe("creates a new Element", function(){
    var $tag;

    beforeEach(function(){
      spyOn(window, '$').andCallThrough();
      $tag = make$Element({tagName: 'p', className: 'dog'});
    });

    it("calls $('<tag>') internally", function(){
      expect($).toHaveBeenCalled();
    });

    it("returns a jQuery wrapped object", function(){
      expect($tag instanceof jQuery).toBe(true);
    });

  });

  describe("without options", function(){

    it("creates a div", function(){
      var $tag = make$Element();
      expect($tag.is('div')).toBe(true);
    });

  });

  describe("with options", function(){

    it("creates the specified element", function(){
      var $tag = make$Element({tagName: 'p'});
      expect($tag.is('p')).toBe(true);
    });

    it("creates the specified className", function(){
      var $tag = make$Element({className: 'dog'});
      expect($tag.hasClass('dog')).toBe(true);
    });

    it("creates the specified id", function(){
      var $tag = make$Element({id: 'cat'});
      expect($tag.is('#cat')).toBe(true);
    });

  });
});
