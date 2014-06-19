require_relative 'spec_helper'
require_relative '../lib/bus'
require_relative '../lib/user'

describe Bus do

  # I expect the bus to be empty, therefore we need a method in the bus model that checks if the bus is empty
  it "is empty" do
    expect(Bus.new).to be_empty
  end

  it "can add a passenger" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger")
    user.work
    bus.add(user)
    expect(bus).not_to be_empty
  end

  it "can take more than one passenger" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger")
    user.work
    bus.add(user)
    expect(bus.size).to eq(1)
    user2 = User.new(name: "Keith Richards")
    user2.work
    bus.add(user2)
    expect(bus.size).to eq(2)
  end

  it "returns true if it contains a specific rider" do
    bus = Bus.new
    expect(bus.contains?("Mick Jagger")).to be_false
    user = User.new(name: "Mick Jagger")
    user.work
    bus.add("Mick Jagger")
    expect(bus.contains?("Mick Jagger")).to be_true
  end

  it "won't let you add the same passenger twice" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger")
    user.work
    bus.add(user)
    bus.add(user)
    expect(bus.size).to eq(1)
  end

  it "will let you remove a passenger" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger")
    user.work
    bus.add(user)
    expect(bus.size).to eq(1)
    user2 = User.new(name: "Keith Richards")
    user2.work
    bus.add(user2)
    bus.remove()
    expect(bus.size).to eq(1)
  end

  it "will have a maximum capacity of 20 people" do
    bus = Bus.new
    20.times do |n|
      bus.add(n)
    end
    expect(bus.size).to eq(20)
    bus.add("the straw")
    expect(bus.size).to eq(20)
  end

  it "has a fare of 2 dollars" do
    bus = Bus.new
    expect(bus.fare).to eq(2)
  end

  # it "adds a user only if they have enough money" do
  #   bus = Bus.new
  #   user = User.new(name: "Mick Jagger")
  #   user.work
  #   bus.add(user)
  # end


end
