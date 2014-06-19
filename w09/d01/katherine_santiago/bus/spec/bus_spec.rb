require_relative 'spec_helper'
require_relative '../lib/bus'
require_relative '../lib/user'

describe Bus do

  it "is empty" do
    expect(Bus.new).to be_empty
  end

  it "can add a passenger" do
    bus = Bus.new
    user1 = User.new(name: "Mick Jagger").work
    bus.add(user1)
    expect(bus).not_to be_empty
  end

  it "can take more than one passenger" do
    bus = Bus.new
    user1 = User.new(name: "Mick Jagger").work
    user2 = User.new(name: "Keith Richards").work
    bus.add(user1)
    bus.add(user2)
    expect(bus.size).to eq(2)
  end

  it "returns true if it contains a specific rider" do
    bus = Bus.new
    expect(bus.contains?("Mick Jagger")).to be_false
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
      user = User.new(name: n)
      user.work
      bus.add(user)
    end
    expect(bus.size).to eq(20)
    bus.add(user)
    expect(bus.size).to eq(20)
  end

  it "has a fare of 2 dollars" do
    bus = Bus.new
    expect(bus.fare).to eq(2)
  end

  it "adds a user only if they have enough money" do
    bus = Bus.new
    bus.add(user)
    expect(bus.size).to eq(0)
  end

end