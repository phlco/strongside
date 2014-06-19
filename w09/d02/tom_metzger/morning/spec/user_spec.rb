require_relative 'spec_helper'
require_relative '../lib/user'

describe User do
  before(:each) do
    @user = User.new({gender: "female", first_name: "bubbles", last_name: "the cat", age: 3, married: false})
  end

  it "should have a .gender" do
    expect(@user.gender).to eq("female")
  end

  it "should have a .first_name and .last_name" do
    expect(@user.first_name).to eq("bubbles")
    expect(@user.last_name).to eq("the cat")
  end

  it "should have an .age" do
    expect(@user.age).to eq(3)
  end

  it "should indicate if .married" do
    expect(@user.married?).to be_false
  end
end

describe "#abilities" do
  it "should return none for users less than 16" do
    @user = User.new({age: 10})
    expect(@user.abilities).to be_nil
  end

  it "should return drive for users 16 and older" do
    @user = User.new({age: 16})
    expect(@user.abilities).to eq([:drive])
  end

  it "should return drive for users 18 and older" do
    @user = User.new({age: 18})
    expect(@user.abilities).to eq([:drive, :vote])
  end

  it "should return drive for users 25 and older" do
    @user = User.new({age: 25})
    expect(@user.abilities).to eq([:drive, :vote, :rent_car])
  end

  it "should return drive for users 35 and older" do
    @user = User.new({age: 35})
    expect(@user.abilities).to eq([:drive, :vote, :rent_car, :president])
  end

end

describe "#formal_name" do
  it "should display full name if female is under 20" do
    @user = User.new({gender: "female", first_name: "bubbles", last_name: "the cat", age: 3})
    expect(@user.formal_name).to eq("bubbles the cat")
  end

  it "should display Ms. full name if unmarried female over 20" do
    @user = User.new({gender: "female", first_name: "bubbles", last_name: "the cat", age: 20, married: false})
    expect(@user.formal_name).to eq("Ms. bubbles the cat")
  end

  it "should display Mrs. full name if married female over 20" do
    @user = User.new({gender: "female", first_name: "bubbles", last_name: "the cat", age: 20, married: true})
    expect(@user.formal_name).to eq("Mrs. bubbles the cat")
  end

  it "should display Mr. full name if male over 20" do
    @user = User.new({gender: "male", first_name: "bailey", last_name: "the cat", age: 20, married: false})
    expect(@user.formal_name).to eq("Mr. bailey the cat")
  end

  it "should display Mr. full name if male under 20" do
    @user = User.new({gender: "male", first_name: "bailey", last_name: "the cat", age: 5, married: false})
    expect(@user.formal_name).to eq("bailey the cat")
  end

end
