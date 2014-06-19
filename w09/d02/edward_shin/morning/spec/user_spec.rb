require_relative 'spec_helper'
require_relative '../user'


describe ".Gender" do
  it "should be able to get gender" do
    user = User.new(gender: "male")
    expect(user.gender).to eq("male")
  end
end

describe ".name" do
  it "should be able to get first and last name" do
    user = User.new(first_name: "eddie", last_name: "shin")
    expect(user.first_name).to eq("eddie")
    expect(user.last_name).to eq("shin")
  end
end

describe ".age" do
  it "should be able to get age" do
    user = User.new(age: 25)
    expect(user.age).to eq 25
  end
end

describe ".married" do
  it "should be able to see if theyre married" do
    user = User.new(married: false)
    expect(user.married?).to be_false
  end
end

describe ".abilities" do
  it "should be able to return abilities that based on age" do
    user = User.new(age: 15)
    expect(user.abilities).to eq([:drive])
  end

  it "should return drive & vote" do
    user = User.new(age: 18)
    expect(user.abilities).to eq([:drive, :vote])
  end

  it "should return drive, vote, and rent car" do
    user = User.new(age: 27)
    expect(user.abilities).to eq([:drive, :vote, :rent_car])
  end

  it "should return drive, vote, rent car, & president" do
    user = User.new(age: 45)
    expect(user.abilities).to eq([:drive, :vote, :rent_car, :president])
  end

end

describe ".formal name" do

  it "should return Mrs. infront of name" do
    user = User.new(first_name: "Helen", last_name: "Carter", gender: "female",married: true, age: 25)
    expect(user.formal_name).to eq("Mrs. Helen Carter")
  end

  it "should return just her name" do
    user = User.new(first_name: "Helen", last_name: "Carter", gender: "female", age: 15)
    expect(user.formal_name).to eq("Helen Carter")
  end

  it "should return Ms. infront of name" do
    user = User.new(first_name: "Helen", last_name: "Carter", gender: "female", age: 23)
    expect(user.formal_name).to eq("Ms. Helen Carter")
  end

end

