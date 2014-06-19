require_relative 'spec_helper'
require_relative '../bus'
require_relative '../user'

describe Bus do

  it "is empty" do
    expect(Bus.new).to be_empty
  end

  it "can add passenger" do
    bus = Bus.new
    user = User.new(name: "Mickey Mouse")
    user.work
    bus.add(user)
    expect(bus).not_to be_empty
  end

  it "can add more than one passenger" do
    bus = Bus.new
    user = User.new(name: "Mickey Mouse")
    user.work
    bus.add(user)
    expect(bus.size).to eq(1)
    user2 = User.new(name: "Minney")
    user2.work
    bus.add(user2)
    expect(bus.size).to eq(2)
  end

  it "can remove a passenger" do
    bus = Bus.new
    user = User.new(name: "Mickey Mouse")
    user.work
    bus.add(user)
    expect(bus.size).to eq(1)
    user2 = User.new(name: "Minney Mouse")
    user2.work
    bus.add(user2)
    expect(bus.size).to eq(2)
    bus.remove(user2)
    expect(bus.size).to eq(1)
  end

  it "returns true if bus contains a specific rider" do
    bus = Bus.new
    user = User.new(name: "Mickey")
    user.work
    expect(bus.contains?(user)).to be_false
    bus.add(user)
    expect(bus.contains?(user)).to be_true
  end

  it "should not allow me to add a passenger twice" do
    bus = Bus.new
    user = User.new(name: "Mickey")
    user.work
    bus.add(user)
    bus.add(user)
    expect(bus.size).to eq(1)
  end

  it "can only hold 20 people"  do
    bus = Bus.new
    20.times do |n|
      n = User.new
      n.work
      bus.add(n)
    end
    expect(bus.size).to eq(20)
    bus.add("the straw")
    expect(bus.size).to eq(20)
  end

  it "has a fair of 2 dollars" do
    bus = Bus.new
    expect(bus.fare).to eq(2)
  end

  it "adds user only if it has money" do
    user = User.new(name: "Latika")
    bus = Bus.new
    bus.add(user)
    expect(bus.size).to eq 0
  end

  it "decreases the users balance when it rides the bus" do
    user = User.new(name: "henry")
    user.work
    bus = Bus.new
    bus.add(user)
    expect(user.balance).to eq 3
  end

end