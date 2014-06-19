require_relative 'spec_helper'
require_relative '../lib/school'

describe School do

  it "has an empty db if no students have been added" do
    school = School.new("Hippy Dippy School")
    expect(school.db).to be_empty
  end

  it "adds a student to the correct grade" do
    school = School.new("Hippy Dippy School")
    school.add("James", 2)
    expect(school.db).to eq({2 => ["James"]})
  end

  it "can add several students to the same grade and add students to different grades" do
    school = School.new("Hippy Dippy School")
    school.add("James", 2)
    school.add("Blair", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.db).to eq(2 => ["James", "Blair"], 3 => ["Jennifer"], 1 => ["Little Billy"])
  end

  it "can return all students in a single grade" do
    school = School.new("Hippy Dippy School")
    school.add("James", 2)
    school.add("Blair", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.grade(2)).to eq(["James", "Blair"])
  end

  it "can get sorted list of all students, with grades" do
    school = School.new("Hippy Dippy School")
    school.add("James", 2)
    school.add("Blair", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.sort).to eq(1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"])
  end

end
