require_relative "../lib/school"
require_relative "spec_helper"
require "pry"
describe School do
  school = School.new("Hippy Dippy School")
  it "should have an empty db if no students have been added" do
    expect(school.db).to eq({})
  end
  it "should add a student to the correct grade" do
    school.add("James", 2)
    expect(school.db).to eq({2 => ["James"]})
  end
  it "should be able to take several students in the same grade" do
    school.add("Phil", 2)
    expect(school.db).to eq({2 => ["James", "Phil"]})
  end
  it "should be able to take students in different grades" do
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.db).to eq({2 => ["James", "Phil"], 3 => ["Jennifer"], 1 => ["Little Billy"]})
  end
  it "can tell you all the students in a single grade" do
    expect(school.grade(2)).to eq(["James", "Phil"])
  end
  it "can sort students by grade and name" do
    expect(school.sort).to eq({1 => ["Little Billy"], 2 => ["James", "Phil"], 3 => ["Jennifer"]})
  end
end
