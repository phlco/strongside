require_relative 'spec_helper'
require_relative '../lib/school'
require 'pry'

describe School do

  it "should have a db method" do
    school = School.new
    expect(school).to respond_to(:db)
  end

  it "should have an empty db if no students have been added" do
    school = School.new
    expect(school.db).to eq({})
  end

  it "should add students to the proper class" do
    school = School.new
    school.add("James", 2)
    expect(school.db).to eq({2 => ["James"]})
  end

  it "should be able to add multiple students to the same grade" do
    school = School.new
    school.add("James", 2)
    school.add("Blair", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.db).to eq({2 => ["James", "Blair"], 3 => ["Jennifer"], 1 => ["Little Billy"]})
  end

  it "should return all the students in a single grade" do
    school = School.new
    school.add("James", 2)
    school.add("Blair", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.grade(2)).to eq(["James", "Blair"])
  end

  it "should return a sorted list of students descending numerically by grade and ascending by student name" do
    school = School.new
    school.add("James", 2)
    school.add("Blair", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.sort).to eq({1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"]})
  end

end
