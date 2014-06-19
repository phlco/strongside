require_relative 'spec_helper'
require_relative '../lib/school'

describe School do

  before(:each) do
    @school = School.new('My New School')
  end

  it "should have name" do
    expect(@school.name).to eq("My New School")
  end

  it "the db should be empty if no students have been added" do
    expect(@school.db).to be_empty
  end

  it "should add students to corrent grade" do
    @school.add("James", 2)
    expect(@school.db).to eq( {2 => ["James"] } )
  end

  it "should return all students in given grade" do
    @school.add("James", 2)
    @school.add("Kames", 3)
    @school.add("Cooper", 2)
    expect(@school.grade_roster(2)).to eq([ "James", "Cooper" ])
  end

  it "should return a sorted list by grade and student name" do
    @school.add("James", 2)
    @school.add("Kames", 3)
    @school.add("Cooper", 2)
    @school.add("Cooper", 1)

    expect(@school.sorted_roster).to eq([[1, ["Cooper"]],[ 2,["Cooper","James"]],[3,["Kames"]] ])
  end
  
end
