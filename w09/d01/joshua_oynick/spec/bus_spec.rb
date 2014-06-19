require_relative 'spec_helper'
require_relative '../user'
require_relative '../bus'

describe Bus do

  it "is empty" do
    # what do we expect to happen? that's the assertion
    expect(Bus.new).to be_empty
  end

  it "can add a passenger" do
    bus = Bus.new
    user = User.new
    user.work
    bus.add(user)
    expect(bus).not_to be_empty
  end

  it "can take more than one passenger" do
    bus = Bus.new
    user1 = User.new
    user1.work
    bus.add(user1)
    expect(bus.size).to eq(1)
    user2 = User.new
    user2.work
    bus.add(user2)
    expect(bus.size).to eq(2)
  end

  it "returns true if it contains a specific rider" do
    bus = Bus.new
    user = User.new
    user.work
    expect(bus.contains?(user)).to be_false
    bus.add(user)
    expect(bus.contains?(user)).to be_true
  end

  it "won't let you add the same passenger twice" do
    bus = Bus.new
    user = User.new
    user.work
    bus.add(user)
    bus.add(user)
    expect(bus.size).to eq(1)
  end

  it "can only hold 20 people max" do
    bus = Bus.new
    20.times do |user|
      user = User.new
      user.work
      bus.add(user)
    end
    expect(bus.size).to eq(20)
    user = User.new
    user.work
    bus.add(user)
    expect(bus.size).to eq(20)
  end

  it "has a fare of 2 dollars" do
    bus = Bus.new
    expect(bus.fare).to eq(2)
  end

  it "adds a user only if they have enough money" do
    bus = Bus.new
    user = User.new
    user.work
  end

end
