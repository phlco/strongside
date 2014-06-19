require_relative '../lib/school'

describe School do

  before(:each) do
    @school = School.new(:name => "Hippy Dippy School")
  end

  it "should display an object that contain students" do
    # school = School.new("Hippy Dippy School")
    expect(@school.db.class).to eq(Hash)
  end

  it "should display an object that contain students" do
    expect(@school.db.empty?).to eq(true)
  end

  # it "should add a student to the correct grade" do
  #   student = {"james" => 2}
  #   @school.add(student)
  #   expect(@school.db["james"]).to eq(2)
  #  end

  it "should add a student to the correct grade" do
    @school.add("James", 2)
    expect(@school.db).to eq(2 => ["James"])
  end

  it "should add several students to the same grade, and others to different grades." do
    @school.add("Phil", 2)
    @school.add("Jennifer", 3)
    @school.add("Little Billy", 1)
    expect(@school.db).to eq(2 => ["Phil"], 3 => ["Jennifer"], 1 => ["Little Billy"])
  end

  it "can give you all the students in a single grade" do
    @school.add("James", 2)
    @school.add("Blair", 2)
    expect(@school.grade(2)).to eq(["James", "Blair"])
  end

  it "should be able to sort all of the students by grade" do
    @school.add("Jennifer", 3)
    @school.add("Little Billy", 1)
    @school.add("James", 2)
    @school.add("Blair", 2)
    expect(@school.sort).to eq(1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"])
  end

end