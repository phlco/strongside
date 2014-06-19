require_relative 'spec_helper'
require_relative '../user'

describe User do

  before(:each) do
    @person1male = User.new({gender: 'male', first_name: "Rick", last_name: "Boner", age: 1})
    @person16female = User.new({gender: 'female', first_name: "Mary", last_name: "Squish", age: 16})
    @person20male = User.new({gender: 'male', first_name: "Arthur", last_name: "Boner", age: 20})
    @person25femalesingle = User.new({gender: 'female', first_name: "Connie", last_name: "Boner", age: 25, married: false})
    @person35femalemarried = User.new({gender: 'female', first_name: "Sue", last_name: "Boner", age: 35, married: true})
  end

  describe ".abilities" do
    it "should return an empty array if the person is under 16" do
      expect(@person1male.abilities).to eq([])
    end

    it "should return an array of symbols if the person is 16 or over" do
      expect(@person20male.abilities).to eq([:drive, :vote])
    end

    it "should let a person do everything if they're 35 or over" do
      expect(@person35femalemarried.abilities).to eq([:drive, :vote, :rent_car, :president])
    end
  end

  describe ".formal_name" do
    it "should display 'Mrs.' in front of a user's name if they are female, 20+, and married" do
      expect(@person35femalemarried.formal_name).to eq("Mrs. Sue Boner")
    end

    it "should display 'Ms.' in front of a user's name if they are female, 20+, and NOT married" do
      expect(@person25femalesingle.formal_name).to eq("Ms. Connie Boner")
    end

    it "should not alter a female user's name if she is under 20" do
      expect(@person16female.formal_name).to eq("Mary Squish")
    end

    it "should display 'Mr.' in front of a male user's name if he is 20+" do
      expect(@person20male.formal_name).to eq("Mr. Arthur Boner")
    end

    it "should not alter a male user's name if he is under 20" do
      expect(@person1male.formal_name).to eq("Rick Boner")
    end

  end

end