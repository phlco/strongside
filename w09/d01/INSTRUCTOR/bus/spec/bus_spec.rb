require_relative 'spec_helper'
require_relative '../lib/bus'

describe Bus do

  it "is empty" do
    expect(Bus.new).to be_empty
  end

  it "can add a passenger" do
    bus = Bus.new
    passenger = User.new(name: "Mick Jagger").work
    bus.add(passenger)
    expect(bus).not_to be_empty
  end

  it "can take more than one passenger" do
    bus = Bus.new
    u1 = User.new(name: "Mick Jagger").work
    bus.add(u1)
    expect(bus.size).to eq(1)
    u2 = User.new(name:"Keith Richards").work
    bus.add(u2)
    expect(bus.size).to eq(2)
  end

  it "returns true if it contains a specific rider" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger").work
    expect(bus.contains?(user)).to be_false
    bus.add(user)
    expect(bus.contains?(user)).to be_true
  end

  it "won't let you add the same passenger twice" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger").work
    bus.add(user)
    bus.add(user)
    expect(bus.size).to eq(1)
  end

  it "can only hold 20 people max" do
    bus = Bus.new
    20.times do |n|
      user = User.new(name: n).work
      bus.add(user)
    end
    expect(bus.size).to eq(20)
    bus.add(User.new(nam: "the straw").work)
    expect(bus.size).to eq(20)
  end
  it "has a fare of 2 dollars" do
    bus = Bus.new
    expect(bus.fare).to eq 2
  end
  it "adds a user only if they have enough money" do
  end
end
