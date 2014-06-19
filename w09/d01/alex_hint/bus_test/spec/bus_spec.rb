require_relative 'spec_helper'
require_relative '../lib/bus'

describe Bus do
  it "is empty" do
    expect(Bus.new).to be_empty
  end

  it "can add a passenger" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger", balance: 5)
    bus.add(user)
    expect(bus).not_to be_empty
  end

  it "can take more than one passenger" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger", balance: 5)
    bus.add(user)
    expect(bus.size).to eq(1)
    user = User.new(name: "Dick Jagger", balance: 5)
    bus.add(user)
    expect(bus.size).to eq(2)
  end

  it "can remove a passenger" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger", balance: 5)
    bus.add(user)
    user = User.new(name: "Dick Jagger", balance: 5)
    bus.add(user)
    bus.remove(0)
    expect(bus.size).to eq(1)
  end

  it "returns true if it includes a specifi rider" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger", balance: 5)
    expect(bus.contains?(user)).to be_false
    user = User.new(name: "Mick Jagger", balance: 5)
    bus.add(user)
    expect(bus.contains?(user)).to be_true
  end

  it "won't let you add the same passenger twice" do
    bus = Bus.new
    user = User.new(name: "Mick Jagger", balance: 5)
    bus.add(user)
    user1 = User.new(name: "Mick Jagger", balance: 5)
    bus.add(user1)
    expect(bus.size).to eq(1)
  end

  it "can only hold 20 people max" do
    bus = Bus.new
    20.times do |n|
      n = User.new(name: "Mick Jagger #{n}", balance: 5)
      bus.add(n)
    end
    expect(bus.size).to eq(20)
    user = User.new(name: "Mick Jagger", balance: 5)
    bus.add(user)
    expect(bus.size).to eq(20)
  end

  it 'has a fair of 2 dollars' do
    bus = Bus.new
    expect(bus.fare).to eq 2
  end

  it 'adds a user only if they have enough money' do
    bus = Bus.new
    user = User.new(name: "Mick Jagger", balance: 5)
    bus.add(user)
    expect(bus.size).to eq(1)
  end


end





