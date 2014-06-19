require_relative 'spec_helper'
require_relative '../lib/bus'
require_relative '../lib/user'

describe Bus do
  it "is empty" do
    expect(Bus.new).to be_empty
  end

  it "can add a passenger" do
    bus = Bus.new
    user = User.new(name: "Jorge")
    user.work
    bus.add(user)
    expect(bus).not_to be_empty
  end

  it "can take more than one passenger" do
    bus = Bus.new
    user1 = User.new(name: "Jorge")
    user2 = User.new(name: "James")
    user1.work
    bus.add(user1)
    expect(bus.size).to eq(1)
    user2.work
    bus.add(user2)
    expect(bus.size).to eq(2)
  end

  it "can remove a passenger" do
    bus = Bus.new
    user1 = User.new(name: "Jorge")
    user2 = User.new(name: "James")
    user1.work
    bus.add(user1)
    user2.work
    bus.add(user2)
    bus.remove(user1)
    expect(bus.size).to eq(1)
  end

  it "returns true if it contains a specific rider" do
    bus = Bus.new
    user = User.new(name: "Jorge")
    user.work
    expect(bus.contains?(user)).to be_false
    bus.add(user)
    expect(bus.contains?(user)).to be_true
  end

  it "won't let you add the same passenger twice" do
    bus = Bus.new
    user = User.new(name: "Jorge")
    user.work
    bus.add(user)
    bus.add(user)
    expect(bus.size).to eq(1)
  end

  it "can only hold 20 people max" do
    bus = Bus.new
    20.times do |n|
      n = User.new(name: "Jorge #{n}")
      n.work
      bus.add(n)
    end
    the_straw = User.new(name: "Straw")
    the_straw.work
    bus.add(the_straw)
    expect(bus.size).to eq(20)
  end

  it "has a fare of 2" do
    bus = Bus.new
    expect(bus.fare).to eq(2)
  end

end
