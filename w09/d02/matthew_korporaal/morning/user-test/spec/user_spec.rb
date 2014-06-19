require_relative 'spec_helper'
require_relative '../lib/user'

describe User do
let(:user) {
  User.new({
    gender: "m",
    first_name: "Matt",
    last_name: "Korp",
    age: 37,
    married: true
  }) }

  it "should have a getter method" do
    expect(user.gender).to eq("m")
    expect(user.first_name).to eq("Matt")
    expect(user.last_name).to eq("Korp")
    expect(user.age).to eq(37)
    expect(user.married?).to eq(true)
  end

  describe '#abilities' do
    it "should return nil when age < 16" do
      user.age = 13
      expect(user.abilities).to eq([])
    end

    it "should return an ability when age 16" do
      user.age = 16
      expect(user.abilities).to eq([:drive])
    end

     it "should return an ability when age 18" do
      user.age = 18
      expect(user.abilities).to eq([:drive, :vote])
    end

     it "should return 2 abilities when age 25" do
      user.age = 25
      expect(user.abilities).to eq([:drive, :vote, :rent_car])
    end

    it "should return 3 abilities when age 35" do
      user.age = 35
      expect(user.abilities).to eq([:drive, :vote, :rent_car, :president])
    end
  end

  describe '#formal_name' do
    it "should add Mrs. to 20+, f, married" do
      user.first_name = "Jenny"
      user.last_name = "Moore"
      user.age = 20
      user.gender = 'f'
      expect(user.formal_name).to eq("Mrs. Jenny Moore")
    end

    it "should add no prefix to any female under 20" do
      user.first_name = "Jenny"
      user.last_name = "Moore"
      user.gender = 'f'
      user.age = 18
      expect(user.formal_name).to eq("Jenny Moore")
    end

    it "should add Ms. to any f, 20, unmarried" do
      user.first_name = "Jenny"
      user.last_name = "Moore"
      user.gender = 'f'
      user.married = false
      user.age = 21
      expect(user.formal_name).to eq("Ms. Jenny Moore")
    end

    it "should add Mr. to man 20+" do
      expect(user.formal_name).to eq("Mr. Matt Korp")
    end

    it "should return name, no Mr." do
      user.age = 10
      expect(user.formal_name).to eq("Matt Korp")
    end

  end

end