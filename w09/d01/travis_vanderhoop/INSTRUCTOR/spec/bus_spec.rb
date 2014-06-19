require_relative 'spec_helper'
require_relative '../bus'

# this will house examples of what our code should do
describe Bus do

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
    user1 = User.new(name: "Mick Jagger")
    user1.work
    user2 = User.new(name: "Keith Richards")
    user2.work
    bus.add(user1)
    bus.add(user2)
    expect(bus.size).to eq(2)
  end

  it "can remove a passenger" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger")
    user.work
    bus.add(user)
    bus.remove(user)
    expect(bus.size).to eq(0)
  end

  it "can return an array of passengers" do
    bus = Bus.new
    user1 = User.new(name: "Mick Jagger")
    user1.work
    user2 = User.new(name: "Keith Richards")
    user2.work
    expect(bus.passengers.class).to eq(Array)
    bus.add(user1)
    bus.add(user2)
    expect(bus.passengers).to eq([user1, user2])
  end

  it "returns true if it contains a specific rider" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger")
    user.work
    bus.add(user)
    expect(bus.contains?(user)).to eq true
    expect(bus.contains?("Dave")).to eq false

  end

  it "won't let you add the same passenger twice" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger")
    user.work
    bus.add(user)
    bus.add(user)
    expect(bus.size).to eq(1)
  end

  it "can only hold 20 people max" do
    #passengers is given 20 objects
    bus = Bus.new
    20.times do |n|
      new_user = User.new(name: "Mick Jagger")
      new_user.work
      bus.add(new_user)
    end
    expect(bus.size).to eq(20)
    new_guy = User.new(name: "Mick Jagger")
    bus.add(new_guy)
    expect(bus.size).to eq(20)
  end

  it "has a fare of 2 dollars" do
    bus = Bus.new
    expect(bus.fare).to eq(2)
  end

end #describe bus
