require_relative 'spec_helper'
require_relative '../school'

describe School do
before(:each) do
  @school = School.new("Hippy Dippy School")
end

  it "should create a new school with a silly name" do
    expect(@school.class.name).to eq("School")
  end

  it "should have an empty db hash when initialized" do
    expect(@school.db.empty?).to be_true
    expect(@school.db.class).to eq(Hash)
  end

  it "should add a student to the correct grade" do
    expect(@school.add("James",2)).to be
    expect(@school.db).to eq({2 => ["James"]})
  end

  it "should add several students to the same or different grades" do
    @school.add("James",2)
    @school.add("Jennifer",3)
    expect(@school.db).to eq({2 => ["James"], 3 => ["Jennifer"]})
    @school.add("Little Billy",1)
    @school.add("Blair", 2)
    expect(@school.db).to eq({2 => ["James", "Blair"], 3 => ["Jennifer"], 1 => ["Little Billy"]})
  end

  it "should return all students in a single grade" do
    @school.add("James",2)
    @school.add("Jennifer",3)
    @school.add("Little Billy",1)
    @school.add("Blair", 2)
    expect(@school.grade(2)).to eq(["James", "Blair"])
  end

  it "should get a sorted list of students by grade and name" do
    @school.add("James",2)
    @school.add("Jennifer",3)
    @school.add("Little Billy",1)
    @school.add("Blair", 2)
    expect(@school.sort).to eq({ 3 => ["Jennifer"], 2 => ["Blair", "James"], 1 => ["Little Billy"] })
  end

end

