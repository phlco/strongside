require_relative 'spec_helper'
require_relative '../lib/user.rb'

describe User do
  context "provide basic user info" do
    let(:user) do
      User.new(gender: "male", first_name: "Jorge", last_name: "Colindres", age: 10)
    end

    it "#gender" do
      expect(user.gender).to eq("male")
    end

    it "#first_name" do
      expect(user.first_name).to eq("Jorge")
    end

    it "#last_name" do
      expect(user.last_name).to eq("Colindres")
    end

    it "#age" do
      expect(user.age).to eq(10)
    end
  end # end context

  context "provide marriage methods" do
    describe "#married?" do
      it "can check if #married?" do
        user = User.new
        expect(user.married?).to be_false
      end
    end # end #married? describe

    describe "#get_married" do
      it "can #get_married" do
        user = User.new
        user.get_married
        expect(user.married?).to be_true
      end
    end # end #get_married describe
  end # end context

  describe "#abilities" do
    it "has #abilities getter for @abilities" do
      user = User.new
      expect(user).to respond_to :abilities
    end

    it "won't add :drive if younger than 16" do
      user = User.new(age: 15)
      expect(user.abilities).to match_array([])
    end

    it "adds :drive to @abilities if 16 or older" do
      user = User.new(age: 16)
      expect(user.abilities).to match_array([:drive])
    end

    it "won't add :vote if younger than 18" do
      user = User.new(age: 17)
      expect(user.abilities).to match_array([:drive])
    end

    it "adds :vote to @abilities if 18 or older" do
      user = User.new(age: 18)
      expect(user.abilities).to match_array([:drive, :vote])
    end

    it "won't add :rent_car if younger than 25" do
      user = User.new(age: 24)
      expect(user.abilities).to match_array([:drive, :vote])
    end

    it "adds :rent_a_car to @abilities if 25 or older" do
      user = User.new(age: 25)
      expect(user.abilities).to match_array([:drive, :vote, :rent_car])
    end

    it "won't add :president if younger than 35" do
      user = User.new(age: 34)
      expect(user.abilities).to match_array([:drive, :vote, :rent_car])
    end

    it "adds :president to @abilities if 35 or older" do
      user = User.new(age: 35)
      expect(user.abilities).to match_array([:drive, :vote, :rent_car, :president])
    end
  end # end #abilities describe

  describe "#formal_name" do
    context "#formal_name for females" do
      let(:user) do
        user = User.new(gender: "female", first_name: "Jill", last_name: "Smith", age: 20)
      end

      it "appends Mrs. before last name if female, married and 20 or older" do
        user.get_married
        expect(user.formal_name).to eq("Mrs. Smith")
      end

      it "appends Ms. before last name if female, not married and 20 or older" do
        expect(user.formal_name).to eq("Ms. Smith")
      end

      it "appends no prefix and displays first and last name if female, not married and younger than 20" do
        user.age = 19
        expect(user.formal_name).to eq("Jill Smith")
      end
    end # end context

    context "#formal_name for males" do
      let(:user) do
        user = User.new(gender: "male", first_name: "Bill", last_name: "Smith", age: 20)
      end

      it "appends Mr. to last name if male and 20 or over" do
        expect(user.formal_name).to eq("Mr. Smith")
      end

      it "appends no prefix and displays first and last name if male and younger than 20" do
        user.age = 19
        expect(user.formal_name).to eq("Bill Smith")
      end
    end # end context
  end # end #formal_name describe
end # end User describe
