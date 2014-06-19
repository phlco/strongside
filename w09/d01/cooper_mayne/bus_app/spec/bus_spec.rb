require_relative 'spec_helper'
require_relative '../lib/bus'
require_relative '../lib/user'

describe Bus do
  before(:each) do
    @bus = @bus
  end

  it 'is empty' do
    expect(@bus).to be_empty
  end

  it "can have a passenger" do
    bus = @bus
    user = User.new("Mick Jagger")
    user.work
    bus.add user
    expect(bus).not_to be_empty
  end
  
  it "can take more than one passenger" do
    bus = @bus
    user = User.new("Mick")
    user.work
    bus.add user
    expect(bus.size).to eq(1)
    user = User.new("Nick")
    user.work
    bus.add user
    expect(bus.size).to eq(2)
  end

  it "returns true if it contains a specific rider" do
    bus = @bus
    expect(bus.contains?("Mick Jagger")).to be false
  end

  it "won't let you add the same passenger twice" do
    bus = @bus
    user = User.new("Nick")
    user = User.new("Nick")
    user.work
    bus.add user
    bus.add user
    expect(bus.size).to eq(1)
  end

  it "has a max capacity of 20" do
    bus = @bus
    20.times do |num|
      user = User.new(num)
      user.work
      bus.add user
    end
    expect(bus.size).to eq(20)
    user = User.new("last")
    user.work
    bus.add user
    expect(bus.size).to eq(20)
  end

  it "has a fare of 2 dollars" do
    bus = @bus
    expect(bus.fare).to eq(2)
  end

  it "adds a user only if they have enough money" do
    bus = @bus
    user = User.new("Cooper")
    user.work
    expect(user.balance).to eq(5)
    bus.add user
    expect(bus.size).to eq(1)
  end
end
