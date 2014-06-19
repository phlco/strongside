describe("bonds", function(){

  describe(".gross( film )", function(){
    it("converts gross to a number", function(){
      var query = _.findWhere( bonds.films, { title: "You Only Live Twice" } );
      expect( bonds.gross( query ) ).toEqual( 756544419 );
    });
  });

  describe(".getActors()", function(){
    it("returns all the Actors' names without duplicates", function(){
      expect( bonds.getActors() ).toEqual( answers.actorsNames );
    });
  });

  describe(".totalGross()", function(){
    it("calculates total gross", function(){
      expect( bonds.totalGross() ).toEqual( answers.totalGross );
    });
  });

  describe(".titles({words: number})", function(){
    it("returns titles with the specified number of words", function(){
      expect( bonds.titles({words: 2}) ).toEqual( answers.twoWordTitles );
    });
  });

  describe(".starCount()", function(){
    it("tallys Actors and their total number of films", function(){
      expect( bonds.starCount() ).toEqual( answers.starCount );
    });
  });

  describe(".loneliestBond()", function(){
    it("Return the name of the Actor who starred in the least number of Bond films", function(){
      expect( bonds.loneliestBond() ).toEqual( answers.loneliest );
    });
  });

  describe(".oddBonds()", function(){
    it("Returns Bond films from odd-numbered years", function(){
      expect( bonds.oddBonds() ).toEqual( answers.oddBonds );
    });
  });

  describe(".bestBond()", function(){
    it("calculates which actor was the best Bond based on gross averages", function(){
      expect( bonds.bestBond() ).toEqual( answers.bestBond );
    });
  });

  describe(".worstBond()", function(){
    it("calculates which actor was the worst bond based on gross averages", function(){
      expect( bonds.worstBond() ).toEqual( answers.worstBond );
    });
  });

});
