require_relative 'spec_helper'
require_relative '../user'

describe User do
  before(:each) do
    @user1 = User.new("Male", "Travis", "Vander Hoop", 26, false)
    @user2 = User.new("Female", "Mallory", "Easton", 24, false)
    @user3 = User.new("Male", "Sam", "Eldred", 25, false)
    @user4 = User.new("Male", "Little Guy", "Davis", 17, false)
    @user5 = User.new("Female", "Sarah", "Martin", 30, true)
    @user6 = User.new("Female", "Karlyn", "Vander Hoop", 16, true)
    @user7 = User.new("Female", "Tess", "Bruett", 9, false)
  end

  it "has getter methods for its attributes" do
    expect(@user1.first_name).to eq("Travis")
    expect(@user1.last_name).to eq("Vander Hoop")
    expect(@user1.gender).to eq("Male")
    expect(@user1.age).to eq(26)
    expect(@user1.married).to eq(false)
  end

  it "returns an array when abilities is called" do
    expect(@user1.abilities.class).to be(Array)
  end

  it "returns an array of symbols representing age-appropriate abilities" do
    expect(@user1.abilities).to eq([:drive, :vote, :rent_car])
    expect(@user2.abilities).to eq([:drive, :vote])
    expect(@user3.abilities).to eq([:drive, :vote, :rent_car])
  end

  it "has a method called formal_name that returns a string" do
    expect(@user1.formal_name.class).to eq(String)
  end

  it "can formalize a user's name" do
    expect(@user1.formal_name).to eq("Mr. Travis Vander Hoop")
    expect(@user2.formal_name).to eq("Ms. Mallory Easton")
    expect(@user4.formal_name).to eq("Little Guy Davis")
    expect(@user5.formal_name).to eq("Mrs. Sarah Martin")
    expect(@user6.formal_name).to eq("Karlyn Vander Hoop")
    expect(@user7.formal_name).to eq("Tess Bruett")
  end



end
