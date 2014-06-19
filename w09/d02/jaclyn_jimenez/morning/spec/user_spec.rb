require_relative 'spec_helper'
require_relative '../lib/user'

describe User do
  before(:each) do
    @baby = User.new(
    {
      first_name: "blue ivy",
      last_name: "carter",
      gender: "female",
      age: 1,
      marital_status: "single"
      }
    )
    @teen = User.new(
    {
      first_name: "stacy",
      last_name: "carter",
      gender: "female",
      age: 17,
      marital_status: "single"
      }
    )
    @legal = User.new(
    {
      first_name: "lola",
      last_name: "carter",
      gender: "female",
      age: 20,
      marital_status: "single"
      }
    )
    @young_adult = User.new(
    {
      first_name: "sasha",
      last_name: "carter",
      gender: "female",
      age: 26,
      marital_status: "single"
      }
    )
    @adult = User.new(
    {
      first_name: "hilary",
      last_name: "carter",
      gender: "female",
      age: 40,
      marital_status: "married"
      }
    )
      @guy = User.new(
    {
      first_name: "sean",
      last_name: "carter",
      gender: "male",
      age: 40,
      marital_status: "married"
      }
    )
    @young_guy = User.new(
    {
      first_name: "billy",
      last_name: "carter",
      gender: "male",
      age: 10,
      marital_status: "single"
      }
    )
  end
  it "should have a method to get first name" do
    expect(@baby.first_name).to eq("blue ivy")
  end
  it "should have a method to get last name" do
    expect(@baby.last_name).to eq("carter")
  end
  it "should have a method to get gender" do
    expect(@baby.gender).to eq("female")
  end
  it "should have a method to get age" do
    expect(@baby.age).to eq(1)
  end
  it "should have a method to get marital_status" do
    expect(@baby.marital_status).to eq("single")
  end
  it "should have a method to get abilities" do
    expect(@baby.abilities).to eq([])
    expect(@teen.abilities).to eq([:drive])
    expect(@legal.abilities).to eq([:drive, :vote])
    expect(@young_adult.abilities).to eq([:drive, :vote, :rent_car])
    expect(@adult.abilities).to eq([:drive, :vote, :rent_car, :president])
  end
  it "should have a formal name method" do
    expect(@baby.formal_name).to eq(" blue ivy carter")
    expect(@young_adult.formal_name).to eq("Ms. sasha carter")
    expect(@adult.formal_name).to eq("Mrs. hilary carter")
    expect(@guy.formal_name).to eq("Mr. sean carter")
    expect(@young_guy.formal_name).to eq(" billy carter")
  end

end
