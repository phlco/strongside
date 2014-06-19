require_relative 'spec_helper'
require_relative '../lib/bus'
require_relative '../lib/user'

describe Bus do

  it "is empty" do
    expect(Bus.new).to be_empty
  end

  it "can add a passenger" do
    bus = Bus.new
    passenger = "Mick Jagger"
    bus.add(passenger)
    expect(bus).not_to be_empty
  end

  it "can take more than one passenger" do
    bus = Bus.new
    bus.add(passenger)
    expect(bus.size).to eq(1)
    bus.add(passenger)
    expect(bus.size).to eq(2)
  end

  it "returns true if it contains a specific rider" do
    bus = Bus.new
    passenger = "Mick Jagger"
    expect(bus.contains?(passenger)).to be_false
    bus.add(passenger)
    expect(bus.contains?(passenger)).to be_true
  end

  it "won't let you add the same passenger twice" do
    bus = Bus.new
    passenger = "Mick Jagger"
    bus.add(passenger)
    bus.add(passenger)
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

  it "has a fare" do
    bus = Bus.new
    expect(bus.fare).to eq(2)
  end






end
