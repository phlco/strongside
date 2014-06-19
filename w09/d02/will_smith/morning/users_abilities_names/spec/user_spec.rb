require_relative 'spec_helper'
require_relative '../lib/user'

describe User do
  let(:user) do
    User.new(
      :first_name => 'Will',
      :last_name => 'Smith',
      :age => 28 ,
      :gender => 'male',
      :is_married => false
      )
  end

  it "should have a gender" do
    expect(user.gender).to eq("male")
  end

  it "should have a first name" do
    expect(user.first_name).to eq("Will")
  end

  it "should have a last name" do
    expect(user.last_name).to eq("Smith")
  end

  it "should haver an age" do
    expect(user.age).to eq(28)
  end

  it "should have a married boolean" do
    expect(user.is_married?).to be_false
  end

  describe "#abilities" do

    it "should be able to drive when the age is 16" do
      u_16 = User.new(age: 16)
      expect(u_16.abilities).to match_array([:drive])
      # https://www.relishapp.com/rspec/rspec-rails/docs/matchers/activerecord-relation-match-array
    end

    it "should be able to drive when the age is 16 even if the method is called twice" do
      u_16 = User.new(age: 16)
      expect(u_16.abilities).to match_array([:drive])
    end


    it "should be able to drive and vote when the age is 18" do
      u_18 = User.new(age: 18)
      expect(u_18.abilities).to match_array([:drive, :vote])
    end

    it "should be able to drive, vote, and rent a car when the age is 25" do
      u_25 = User.new(age: 25)
      expect(u_25.abilities).to match_array([:drive, :vote, :rent_car])
    end

    it "should be able to drive, vote, rent a car, and be president when the age is 35" do
      u_35 = User.new(age: 35)
      expect(u_35.abilities).to match_array([:drive, :vote, :rent_car, :president])
    end

  end

  describe "#formal_name" do
    let(:user) do
      User.new(
        :first_name => 'April',
        :last_name => 'Ludgate',
        :age => 21 ,
        :gender => 'female',
        :is_married => true
        )
    end
    it "should display 'Mrs.' before the last name if it is female, the age is 20 or older, and is married" do
      expect(user.formal_name).to eq("Mrs. Ludgate")
    end

    it "should display 'Ms.' before the last name if it is female, the age is 20 or older, and is not married" do
      u11 = User.new(gender: "female", first_name: "Kate", last_name: "Upton", age: 21, is_married: false)
      expect(u11.formal_name).to eq("Ms. Upton")
    end

    it "should display the first and last name if it is female, the age is under 20, and is not married" do
      u12 = User.new(gender: "female", first_name: "Julie", last_name: "Jenner", age: 17, is_married: false)
      expect(u12.formal_name).to eq("Julie Jenner")
    end

    it "should display 'Mr.' before the last name if it is male and the age is over 20" do
      u13 = User.new(gender: "male", first_name: "Will", last_name: "Smith", age: 28, is_married: false)
      expect(u13.formal_name).to eq("Mr. Smith")
    end

    it "should display the first and last name if it is male and the age is under 20" do
      u14 = User.new(gender: "male", first_name: "Jack", last_name: "Smith", age: 19, is_married: false)
      expect(u14.formal_name).to eq("Jack Smith")
    end
  end
end
