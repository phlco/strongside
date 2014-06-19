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
    passenger1 = User.new(name: "Mick Jagger")
    passenger1.work
    expect(bus.size).to eq(1)
    passenger2 = User.new(name: "Keith Richards")
    passenger2.work
    expect(bus.size).to eq(2)
  end

  it "returns true if it contains a specific rider" do
    bus = Bus.new
    expect(bus.contains?("Mick Jagger")).to be_false
    bus.add("Mick Jagger")
    expect(bus.contains?("Mick Jagger")).to be_true
  end

  it "won't let you add the same passenger twice" do
    bus = Bus.new
    passenger1 = User.new(name: "Mick Jagger")
    # passenger2 = User.new(name: "Mick Jagger")
    bus.add(passenger1)
    bus.add(passenger1)
    expect(bus.size).to eq(1)
  end

  it "can only hold 20 people max" do
    bus = Bus.new
    20.times do |n|
      bus.add(n)
    end
    bus.add("the staw")
    expect(bus.size).to eq(20)
  end

  it "has a fare of 2 dollars" do
    bus = Bus.new
    expect(bus.fare).to eq 2
  end




end
