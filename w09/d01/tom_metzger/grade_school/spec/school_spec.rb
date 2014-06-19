require_relative 'spec_helper'
require_relative '../lib/school'

describe School do

  before(:each) do
    @school = School.new("Hippy Dippy School")
  end

  it "should return the #name of the school" do
    expect(@school.name).to eq("Hippy Dippy School")
  end

  it "should have no students in the db" do
    expect(@school.db.empty?).to eq(true)
  end

  it "should .add students into the correct grade" do
    @school.add("James", 2)
    expect(@school.db[2]).to eq(["James"])
  end

  # context 'when analyzing student distributions"'
  # what is the best way to DRY up the code below?

  it "should .add students to the same grade and to different grades in db" do
    @school.add("James", 2)
    @school.add("Phil", 2)
    @school.add("Jennifer", 3)
    @school.add("Little Billy", 1)
    expect(@school.db).to eq({2 => ["James", "Phil"], 3 => ["Jennifer"], 1 => ["Little Billy"]})
  end

  it "should return all students in a single .grade" do
    @school.add("James", 2)
    @school.add("Phil", 2)
    @school.add("Jennifer", 3)
    @school.add("Little Billy", 1)
    expect(@school.grade(2)).to eq(["James", "Phil"])
  end

  it "should .sort and return the grades their respective students in ascending order" do
    @school.add("James", 2)
    @school.add("Phil", 2)
    @school.add("Jennifer", 3)
    @school.add("Little Billy", 1)
    expect(@school.db.sort).to eq({1 => ["Little Billy"], 2 => ["James", "Phil"], 3 => ["Jennifer"]})
  end


end
