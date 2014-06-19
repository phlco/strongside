# a small archiving program that stores students along with the grades they're in

require_relative 'spec_helper'
require_relative '../school'

describe School do

  before(:each) do
    @school = School.new("Hippy Dippy School")
  end

  it "should have a name" do
    expect(@school.name).to be
  end

  it "start with an empty db" do
    expect(@school.db).to eq({})
  end

  it "should add each student to the correct grade" do
    @school.add("James", 2)
    expect(@school.db).to eq({2 => ["James"]})
    @school.add("Sally", 2)
    expect(@school.db).to eq({2 => ["James", "Sally"]})
  end

  it "can add several students to the same grade" do
    @school.add("James", 2)
    expect(@school.db).to eq({2 => ["James"]})
    @school.add("Sally", 2)
    expect(@school.db).to eq({2 => ["James", "Sally"]})
  end

  it "can add students to different grades" do
    @school.add("James", 2)
    expect(@school.db).to eq({2 => ["James"]})
    @school.add("Mary", 3)
    expect(@school.db).to eq({2 => ["James"], 3 => ["Mary"]})
  end

  it "can return all the students of a single grade" do
    @school.add("James", 2)
    expect(@school.db).to eq({2 => ["James"]})
    @school.add("Sally", 2)
    expect(@school.grade(2)).to eq(["James", "Sally"])
  end

  it "should be able to get a sorted list of all the students" do
    # grades are sorted in ascending order numerically (large -> small)
    # students are sorted in ascending order alphabetically (a -> z)
    @school.add("Jennifer", 3)
    @school.add("Little Billy", 1)
    @school.add("Blair", 2)
    @school.add("James", 2)
    expect(@school.sort).to eq({1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"]})
  end

end