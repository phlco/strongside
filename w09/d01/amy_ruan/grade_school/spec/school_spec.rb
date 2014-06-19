require_relative ('../lib/school')
require 'pry'
describe School do

  it "should have a name" do
    school = School.new("Hippy Dippy School")
    expect(school.name).to eq("Hippy Dippy School")
  end

  it "no students then it should be empty" do
    school = School.new("Hippy Dippy School")
    expect(school.db.size).to eq(0)
  end

  it "can add a student and they get added to the correct grade" do
    school = School.new("Hippy Dippy School")
    school.add("James",2)
    expect(school.db).to eq ({2 => ["James"]})
  end

  it "can add multiple students" do
    school = School.new("Hippy Dippy School")
    school.add("Little Billy",1)
    school.add("Blair",2)
    school.add("James",2)
    school.add("Jennifer",3)
    expect(school.db).to eq ({1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"]})
  end

  it "tells the name of all the grades" do
    school = School.new("Hippy Dippy School")
    school.add("Little Billy",1)
    school.add("Blair",2)
    school.add("James",2)
    school.add("Jennifer",3)
    # binding.pry
    expect(school.grade(2)).to eq (["Blair", "James"])
  end

  it "should sort by grade" do
    school = School.new("Hippy Dippy School")
    school.add("Little Billy",1)
    school.add("Blair",2)
    school.add("James",2)
    school.add("Jennifer",3)
    expect(school.sort).to eq ({1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"]}
)
  end
end