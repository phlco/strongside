require_relative 'spec_helper'
require_relative '../lib/bus'
require_relative '../lib/user'
describe Bus do

  it "is empty" do
    expect(Bus.new).to be_empty
  end

  it "can add a passenger" do
    bus = Bus.new
    user = User.new(name: "Jon")
    user.work
    bus.add(user)
    expect(bus).not_to be_empty
  end

  it "can take more than one passenger" do
    bus = Bus.new
    user = User.new(name: "Mick")
    user.work
    bus.add(user)
    user = User.new(name: "Keith")
    user.work
    bus.add(user)
    expect(bus.size).to eq(2)
    user = User.new(name: "Charlie")
    user.work
    bus.add(user)
    expect(bus.size).to eq(3)
  end

  it "can remove a passenger" do
    bus = Bus.new
    user = User.new(name: "Mick")
    user.work
    bus.add(user)
    user = User.new(name: "Keith")
    user.work
    bus.add(user)
    expect(bus.size).to eq(2)
    bus.remove(user)
    expect(bus.size).to eq(1)
  end

  it "returns true if it contains a specific rider" do
    bus = Bus.new
    expect(bus.contains?("Mick Jagger")).to be_false
    bus.add(User.new(name: "Mick Jagger"))
    expect(bus.contains?("Mick Jagger")).to be_true
  end

  it "won't let you add the same a passenger twice" do
    bus = Bus.new
    user = User.new(name: "Mick")
    user.work
    bus.add(user)
    bus.add(user)
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

  it "adds a user only if thye have enough money" do
    bus = Bus.new
    user = User.new(name: "Mick")
    bus.add(user)
    expect(bus.size).to eq 0
    user.work
    expect(bus.size).to eq 1

  end
end
