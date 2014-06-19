require_relative 'spec_helper'
require_relative '../lib/user'

describe User do

  # contexxt is for setting up initial conditions
  # one use case of describe is for describing vairous methods that the class has

  it "has the gender getter" do
    user = User.new
    expect(user.gender).to eq nil
  end

  it "has the first_name getter" do
    user = User.new
    expect(user.first_name).to eq nil
  end

  it "has the last_name getter" do
    user = User.new
    expect(user.last_name).to eq nil
  end

  it "has the age getter" do
    user = User.new
    expect(user.age).to eq nil
  end

  it "has the married? getter" do
    user = User.new
    expect(user.married).to eq nil
  end

  it "returns drive when you're 16" do
    user = User.new
    expect(user.abilities(16)).to eq [:drive]
  end

  it "returns drive and vote when you're 18" do
    user = User.new
    expect(user.abilities(18)).to eq [:drive, :vote]
  end

  it "returns drive, vote and rent a car when you're 25" do
    user = User.new
    expect(user.abilities(25)).to eq [:drive, :vote, :rent_car]
  end

  it "returns drive, vote, rent a car and be president when you're 35" do
    user = User.new
    expect(user.abilities(35)).to eq [:drive, :vote, :rent_car, :president]
  end

  it "should have formal_name method" do
    user = User.new
    user.should respond_to :formal_name
  end

  it "should return Mrs. if the person is female and 20 or over and is married" do
    user = User.new
    user.gender = "female"
    user.age = 20
    user.married = true
    expect(user.formal_name).to eq "Mrs."
  end

end
