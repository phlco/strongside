require_relative 'spec_helper'
require_relative '../lib/school'

describe School do
  it "exists" do
    school = School.new
    expect(school).to be
  end
  it "has an empty database when it is created" do
    school = School.new
    expect(school.db).to eq({})
  end
  it "can add a student with a grade" do
    school = School.new
    school.add("James", 2)
    expect(school.db).to eq({2 => ["James"]})
  end
  it "can add students to the same grade" do
    school = School.new
    school.add("James", 2)
    school.add("Phil", 2)
    expect(school.db[2]).to match_array(["James", "Phil"])
  end
  it "can add students to different grades" do
    school = School.new
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.db[1]).to match_array(["Little Billy"])
    expect(school.db[3]).to match_array(["Jennifer"])
  end
  it "can get students by grade" do
    school = School.new
    school.add("James", 2)
    school.add("Phil", 2)
    expect(school.grade(2)).to match_array(["James", "Phil"])
  end
  it "can sort students by grade and alphabet" do
    school = School.new
    school.add("James", 2)
    school.add("Blair", 2)
    school.add("Jennifer", 3)
    school.add("Little Billy", 1)
    expect(school.sort).to eq({1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"]})
  end
end