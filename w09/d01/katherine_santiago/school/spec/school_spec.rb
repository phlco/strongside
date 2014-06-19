require_relative 'spec_helper'
require_relative '../lib/school'

describe School do

  it "has a list of student names by grade-level" do
    school = School.new("Hippy Dippy School")
    expect(school.db).to eq({})
  end

  it "adds students to the school" do
    school = School.new("Hippy Dippy School")
    school.add("Kat", 10)
    school.add("Tasha", 11)
    school.add("Travis", 11)
    expect(school.db).to eq( {10=>["Kat"], 11=>["Tasha", "Travis"] })
  end

  it "gives you students by grade" do
    school = School.new("Hippy Dippy School")
    school.add("Kat", 10)
    expect(school.grade(10)).to eq(["Kat"])
  end

  it "gives you sorted list of all students" do
    school = School.new("Hippy Dippy School")
    school.add("Kat", 10)
    school.add("Travis", 11)
    school.add("Tasha", 11)
    expect(school.sort).to eq( {11=>["Tasha", "Travis"], 10=>["Kat"]})
  end


end