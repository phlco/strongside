require_relative 'spec_helper'
require_relative '../lib/user'
require 'pry'

describe User do

  # context is for setting up initial conditions
  # one use case of describe is for describing various methods that the class has

  context 'provide basic user info when asked' do
    # before(:each) do
    #   @user = User.new(gender: 'male', first_name: 'Joe', last_name: 'Smith', age: 20, married: false)
    # end

    let(:user) do
      User.new(gender: 'male', first_name: 'Joe', last_name: 'Smith', age: 20, married: false)
    end

    it "has a gender" do
      expect(user.gender).to eq 'male'
    end

    it "has a first_name" do
      expect(user.first_name).to eq 'Joe'
    end

    it "has a last_name" do
      expect(user.last_name).to eq 'Smith'
    end

    it "has an age" do
      expect(user.age).to eq 20
    end

    it "can be married or not" do
      expect(user.married?).to eq false
    end

  end

  describe '#abilities' do

    it "has no abilities when age is less than 16" do
      user = User.new(age: 15)
      expect(user.abilities).to eq []
    end

    it "can drive when it's 16 or older" do
      user = User.new(age: 17)
      expect(user.abilities).to eq [:drive]
    end

    it "can drive and vote when it's 18 or older" do
      user = User.new(age: 18)
      expect(user.abilities).to eq [:drive, :vote]
    end

    it "can drive, vote, and rent a car if it's 25 or older" do
      user = User.new(age: 26)
      expect(user.abilities).to eq [:drive, :vote, :rent_car]
    end

    it "can drive, vote, rent a car, and be president if it's 35 or older" do
      user = User.new(age: 36)
      expect(user.abilities).to eq [:drive, :vote, :rent_car, :president]
    end

  end

  it "should display Mrs. in front of its name if it's female, married and over 20" do
    user = User.new(gender: 'female', first_name: 'Broomhilda', last_name: 'Tarantino', age: 22, married: true)
    expect(user.formal_name).to eq 'Mrs. Broomhilda Tarantino'
  end

  it "should display Ms. in front of its name if it's female, not married and over 20" do
    user = User.new(gender: 'female', first_name: 'Susan', last_name: 'Boyle', age: 22, married: false)
    expect(user.formal_name).to eq 'Ms. Susan Boyle'
  end

  it "should display first and last name if age is under 20" do
    user = User.new(age: 19, first_name: "Little", last_name: "Kid")
    expect(user.formal_name).to eq 'Little Kid'
  end

  it "should display Mr. in front of name if male and 20 or over" do
    user = User.new(gender: 'male', first_name: 'Tiger', last_name: 'Woods', age: 25)
    expect(user.formal_name).to eq 'Mr. Tiger Woods'
  end
end




