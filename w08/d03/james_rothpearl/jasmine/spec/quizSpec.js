describe('a quiz', function() {

  it('should be about JavaScript and Testing in Jasmine', function() {
    expect(QUIZ_TOPICS).toContain('javascript');
    expect(QUIZ_TOPICS).toContain('jasmine');
  });

});

describe('sleepIn', function() {

  it("should return false if it's a weekday", function() {
    spyOn(window, 'sleepIn').andCallThrough();
    var weekday = sleepIn();
    expect(weekday).toBe(false);
  });

  it("should return true if the weekend or a vacation", function(){
    var vaycay = sleepIn({vacation: true});
    expect(vaycay).not.toBe(false);
    expect(vaycay).toBe(true);
  });

});

describe('objectBuilder', function() {

  it('should create an object from two arrays', function() {
    var keys = ['name', 'age', 'sayName'];
    var values = ['Marco', 35, function sayName(){return "Hello I am " + this.name;}];
    var newObj = objectBuilder(keys, values);

    spyOn(newObj, 'sayName').andCallThrough();
    newObj.sayName();

    var name = newObj.sayName();

    expect( newObj.name ).toEqual( 'Marco' );
    expect( newObj.age ).toEqual( 35 );
    expect( newObj.sayName ).toHaveBeenCalled();
    expect( name ).toEqual( "Hello I am Marco" );
  });

});

describe('addItUp', function() {

  it('should return the summed numbers of an array', function(){
    var s1 = addItUp([1,2,3]);
    expect(s1).toEqual(6);
  });

  // add it up revisted
  it('should return summed numbers for nested arrays', function(){
    var s2 = addItUp([1, 2, [3], [4, 5]]);
    expect(s2).toEqual(15);
  });

});

describe('arrayCount', function() {

  it('should count the number of arrays in an array', function() {
    var a1 = [1, 2, [1, 2]];
    var a2 = [1, 2, [1, 2], [ [1], {num: 2} ]];
    expect( arrayCount(a1) ).toEqual(2);
    expect( arrayCount(a2) ).toEqual(4);
  });

});
