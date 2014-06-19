require_relative 'spec_helper'
require_relative '../school'

describe School do
  before(:each) do
    @school = School.new("Hippy Dippy School")
  end

  it "is a class" do
    expect(@school.class).to eq(School)
  end

  it "has a database on its instantiation" do
    expect(@school.db).to eq({})
  end

  it "can add students to its database" do
    @school.add("Travis", 3)
    expect(@school.db).to eq({3 => ["Travis"]})
  end

  it "can add multiple students to the same grade" do
    @school.add("Travis", 3)
    @school.add("Minkus", 3)
    @school.add("Tyler", 5)
    expect(@school.db).to eq({3 => ["Minkus", "Travis"], 5 => ["Tyler"]})
  end

  it "can access all the students in a particular grade" do
    @school.add("Minkus", 3)
    @school.add("Travis", 3)
    @school.add("Tyler", 2)
    expect(@school.grade(2)).to eq(["Tyler"])
  end

  it "can return a list of all students" do
    @school.add("Travis", 3)
    @school.add("Minkus", 3)
    @school.add("Tyler", 2)
    expect(@school.sort).to eq({2 => ["Tyler"], 3 => ["Minkus", "Travis"]})
  end

end
