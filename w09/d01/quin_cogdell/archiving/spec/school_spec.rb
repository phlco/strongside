require_relative '../lib/school'

describe School do

  before(:each) do
    @school = School.new("Hippy Dippy School")
  end

  it 'has a name' do
    expect(@school.name).to eq "Hippy Dippy School"
  end

  it 'is empty when no students have been added' do
    expect(@school.db).to eq({})
  end

  context 'provides a list of students by grade' do
    it 'should add a student to a grade given a student and grade' do
      @school.add("James", 2)
      expect(@school.db).to eq({2 => ["James"]})
    end

    it 'can accept several students to the same grade and students to different grades' do
      @school.add("James", 2)
      @school.add("Phil", 2)
      @school.add("Jennifer", 3)
      @school.add("Little Billy", 1)
      expect(@school.db).to eq({2 => ["James", "Phil"], 3 => ["Jennifer"], 1 => ["Little Billy"]})
    end
  end

  it 'should report on students for a single grade' do
    @school.add("James", 2)
    @school.add("Phil", 2)
    @school.add("Jennifer", 3)
    @school.add("Little Billy", 1)
    expect(@school.grade(2)).to eq(["James", "Phil"])
  end

  it 'should report on students by grade in asc order and students in alphabetical order' do
    @school.add("James", 2)
    @school.add("Phil", 2)
    @school.add("Jennifer", 3)
    @school.add("Little Billy", 1)
    expect(@school.sort).to eq({1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"]})
  end


end
