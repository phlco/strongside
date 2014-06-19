require_relative 'spec_helper'
require_relative '../school'

describe School do
  before(:each) do
    @school = School.new("Hippy Dippy School")
  end
  it "should have a name" do
    expect(@school.name).to eq("Hippy Dippy School")
  end
  it "should have an empty db" do
    expect(@school.db).to be_empty
  end

  it "should be able to add students and grades" do
    #format {2 => ["James"]}
    @school.add("James", 2)
    expect(@school.db[2]).to eq(["James"])
  end
  it "should add several students to the same grade, and students to different grades" do
    @school.add("Phil", 2)
    @school.add("Blair", 2)
    @school.add("Jennifer", 3)
    @school.add("Little Billy", 1)
  expect(@school.db).to eq({2 => ["Phil", "Blair"], 3 => ["Jennifer"], 1 => ["Little Billy"]})
  end

  it "should allow you to ask for all the students in a single grade" do
    @school.add("Phil", 2)
    @school.add("Blair", 2)
    @school.add("Jennifer", 3)
    @school.add("Little Billy", 1)
    expect(@school.grade(2)).to eq(["Phil", "Blair"])
  end

  it "should be a sorted list of all the students." do
    #Grades are sorted in descending order numerically,
    #and the students within them are sorted in ascending order alphabetically.
    @school.add("Phil", 2)
    @school.add("Blair", 2)
    @school.add("Jennifer", 3)
    @school.add("Little Billy", 1)
    expect(@school.sort).to eq({1 => ["Little Billy"], 2 => ["Blair", "Phil"], 3 => ["Jennifer"]})
  end

end
