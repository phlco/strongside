require_relative 'spec_helper'
require_relative '../bus'
require_relative '../user'

describe Bus do

  it "is empty when initialized" do
    expect(Bus.new).to be_empty
  end

  it "can add a passenger" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger")
    user.work
    bus.add(user)
    expect(bus).to_not be_empty
  end

  it "can take more than one passenger" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger")
    user.work
    bus.add(user)
    expect(bus.size).to eq(1)
    user_two = User.new(name: "Keith Richards")
    user_two.work
    bus.add(user_two)
    expect(bus.size).to eq(2)
  end

  it "returns true if it contains a specific rider" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger")
    user.work
    bus.add(user)
    expect(bus.contains?(user)).to be_true
  end

  it "won't let you add the same passenger twice" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger")
    user.work
    bus.add(user)
    bus.add(user)
    expect(bus.size).to eq(1)
  end

  it "can only hold 20 people" do
    bus = Bus.new
    20.times do
      user = User.new(name: "Poobrain")
      user.work
      bus.add(user)
    end
    expect(bus.size).to eq(20)
    user = User.new(name: 'The Straw')
    bus.add(user)
    expect(bus.size).to eq(20)
  end

  it "has a fare of 2 dollars" do
    bus = Bus.new
    expect(bus.fare).to eq 2
  end

  it "lowers a user's balance when it rides the bus" do
    user = User.new(name: 'Jamal')
    user.work
    bus = Bus.new
    bus.add(user)
    expect(user.balance).to eq 3
  end

end