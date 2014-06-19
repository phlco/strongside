require_relative 'spec_helper'
require_relative '../lib/school'

describe School do

  it "should have a name" do
    school = School.new("Hippy Dippy School")
    expect(school.name).to eq "Hippy Dippy School"
  end

  it "should be an empty database if there are no students" do
    school = School.new("Hippy Dippy School")
    expect(school.db).to be_empty
  end

  it "should be able to have students added into the appropriate grade" do
    school = School.new("Hippy Dippy School")
    school.add("James", 2)
    expect(school.db).to eq(2 => ["James"])
  end

  it "should be able to have several students in the same grade, and students in different grades" do
    school = School.new("Hippy Dippy School")
    school.add("James", 2)
    school.add("Blair", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.db).to eq({2 => ["James", "Blair"], 3 => ["Jennifer"], 1 => ["Little Billy"]})
  end

  it "can query for all students in a specific grade" do
        school = School.new("Hippy Dippy School")
    school.add("James", 2)
    school.add("Blair", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.grade(2)).to eq(["James", "Blair"])
  end






end
