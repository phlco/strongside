require_relative 'spec_helper'
require_relative '../school'

describe School do
  it "should have a name" do
    school = School.new("Happy Dippy School")
    expect(school.name).to eq("Happy Dippy School")
  end

  it "student db should be empty" do
    school = School.new("Happy Dippy School")
    expect(school.db.length).to eq 0
  end

  it "when you add students, you should add grade with them" do
    school = School.new("Happy Dippy School")
    school.add("James", 2)
    school.add("Blair", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.db).to eq({2 => ["James", "Blair"], 3 => ["Jennifer"], 1 => ["Little Billy"]})
  end

  it "when you as for a grade, you get the students in that grade" do
    school = School.new("Happy Dippy School")
    school.add("James", 2)
    school.add("Blair", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.grade(2)).to eq(["James", "Blair"])
  end

  it "returns sorted by grade then alphabetically" do
   school = School.new("Happy Dippy School")
   school.add("James", 2)
   school.add("Blair", 2)
   school.add("Jennifer", 3)
   school.add("Little Billy", 1)
   expect(school.sort).to eq({1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"]})
 end
end