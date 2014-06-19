require_relative 'spec_helper'
require_relative '../lib/bus'
require_relative '../lib/user'

describe Bus do
  it "is empty" do
    expect(Bus.new).to be_empty
  end

  it "can add a passenger" do
    bus = Bus.new
    passenger = User.new(name: "Mick Jagger")
    passenger.work
    bus.add(passenger)
    expect(bus).not_to be_empty
  end

  it "can take more than one passenger" do
    bus = Bus.new
    p1 = User.new(name: "Mick Jagger")
    p2 = User.new(name: "Keith Richards")
    p1.work
    p2.work
    bus.add(p1)
    bus.add(p2)
    expect(bus.size).to eq(2)
    p3 = User.new(name: "Charlie Old Guy")
    p3.work
    bus.add(p3)
    expect(bus.size).to eq(3)
  end

  it "returns true if it contains a specific rider" do
    bus = Bus.new
    expect(bus.contains?("Mick Jagger")).to be_false
    bus.add("Mick Jagger")
    expect(bus.contains?("Mick Jagger")).to be_true
  end

  it "won't let you add the same passenger twice" do
    bus = Bus.new
    p1 = User.new(name: "Mick Jagger")
    p2 = User.new(name: "Mick Jagger")
    p1.work
    p2.work
    bus.add(p1)
    bus.add(p2)
    expect(bus.size).to eq(1)
  end

  it "can only hold 20 people max" do
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
    expect(bus.fare).to eq 2
  end

  # it "adds a user only if they have enough money" do
  #   bus = Bus.new
  #   user = User.new
  #   bus.add(user)
  #   expect(bus.size)
  # end
end
