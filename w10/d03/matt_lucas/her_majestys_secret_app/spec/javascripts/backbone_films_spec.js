describe("model and collection", function(){

  describe("Film", function(){

    var query = _.findWhere( bonds.films, { title: "You Only Live Twice" } );
    var film = new Film( query );

    describe(".gross()", function(){
      it("converts gross to a number", function(){
        expect( film.gross() ).toEqual(756544419);
      });
    });

  });

  describe("Films", function(){

    var films = new Films( bonds.films );

    describe(".getActors()", function(){
      it("returns all the Actors' names without duplicates", function(){
        expect( films.getActors() ).toEqual( answers.actorsNames );
      });
    });

    describe(".totalGross()", function(){
      it("calculates total gross", function(){
        expect( films.totalGross() ).toEqual( answers.totalGross );
      });
    });

    describe(".titles({words: number})", function(){
      it("returns titles with the specified number of words", function(){
        expect( films.titles({words: 2}) ).toEqual( answers.twoWordTitles );
      });
    });

    describe(".starCount()", function(){
      it("tallys Actors and their total number of films", function(){
        expect( films.starCount() ).toEqual( answers.starCount );
      });
    });

    describe(".loneliestBond()", function(){
      it("Return the name of the Actor who starred in the least number of Bond films", function(){
        expect( films.loneliestBond() ).toEqual( answers.loneliest );
      });
    });

    describe(".oddBonds()", function(){
      it("Returns Bond films from odd-numbered years", function(){
        expect( films.oddBonds() ).toEqual( answers.oddBonds );
      });
    });

    describe(".bestBond()", function(){
      it("calculates which actor was the best Bond based on gross averages", function(){
        expect( films.bestBond() ).toEqual( answers.bestBond );
      });
    });

    describe(".worstBond()", function(){
      it("calculates which actor was the worst bond based on gross averages", function(){
        expect( films.worstBond() ).toEqual( answers.worstBond );
      });
    });

  });

});
