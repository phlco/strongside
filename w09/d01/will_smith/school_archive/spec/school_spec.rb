require_relative 'spec_helper'
require_relative '../lib/school'

describe School do
  it "should be initialized with a database for students" do
    school = School.new
    expect(school).to respond_to(:db)
  end

  it "should have an empty database to start" do
    school = School.new
    expect(school.db).to eq({})
  end

  it "should add students to the database with their grade" do
    school = School.new
    school.add("James", 2)
    expect(school.db).to eq({2 => ["James"]})
  end

  it "should add several students to the same grade and students to different grades" do
    school = School.new
    school.add("James", 2)
    school.add("Phil", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.db).to eq({2 => ["James", "Phil"], 3 => ["Jennifer"], 1 => ["Little Billy"]})
  end

  it "should return all the students in a single grade" do
    school = School.new
    school.add("James", 2)
    school.add("Phil", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.grade(2)).to eq(["James", "Phil"])
  end

  it "should sort the list of all the students. Grades should be sorted in descending order numerically, students should be sorted in ascending order alphabetically." do
    school = School.new
    school.add("James", 2)
    school.add("Blair", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.sort).to eq({1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"]})
  end
end
