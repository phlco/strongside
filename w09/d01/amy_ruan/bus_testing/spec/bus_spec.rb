require_relative 'spec_helper'
require_relative '../lib/bus'
require_relative '../lib/user'

describe Bus do
  it "is empty" do
    expect(Bus.new).to be_empty
  end

  it "can add a passenger" do
    bus = Bus.new
    mick = User.new(name: "Mick")
    mick.balance = 2
    bus.add(mick)
    expect(bus.size).to eq(1)
    keith = User.new(name: "Keith")
    keith.balance = 2
    bus.add(keith)
    expect(bus.size).to eq(2)
  end

  it "can remove a passenger" do
    bus = Bus.new

    mick = User.new(name: "Mick")
    mick.balance = 2
    bus.add(mick)

    micky = User.new(name: "Mick")
    micky.balance = 2
    bus.add(micky)

    expect(bus.size).to eq(2)

    bus.remove(mick)
    expect(bus.size).to eq(1)
  end

  it "returns true if it contains a specific name" do
    bus = Bus.new
    expect(bus.contains?("Mick Jagger")).to be_false
  end

  it "won't let you add the same passenger twice" do
    bus = Bus.new

    mick = User.new(name: "Mick")
    mick.balance = 2
    bus.add(mick)

    bus.add(mick)
    bus.add(mick)
    expect(bus.size).to eq(1)
  end

  it "can only hold 20 people max" do
    bus = Bus.new

    20.times do |n|
      n = User.new(name: "Mick")
      n.balance = 2
      bus.add(n)
    end

    expect(bus.size).to eq(20)
    bus.add("the straw")
    expect(bus.size).to eq(20)
  end

  it "has a fare of 2" do
    bus = Bus.new
    expect(bus.fare).to eq 2
  end

  it "adds a user only if they have enough money" do
    bus = Bus.new
    user = User.new
    bus.add(user)
    expect(bus.size).to eq 0
  end
end