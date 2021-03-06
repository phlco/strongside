require_relative 'spec_helper'
require_relative '../lib/user'
require_relative '../lib/bus'

describe User do
  it "has a name" do
    user = User.new(name: "Jorge")
    expect(user.name).to eq("Jorge")
  end

  it "has a starting balance of 0" do
    user = User.new(name: "Jorge")
    expect(user.balance).to eq(0)
  end

  it "can increase the balance by 5 with work" do
    user = User.new(name: "Jorge")
    user.work
    expect(user.balance).to eq(5)
  end

  context "can only ride the bus if it has enough money" do
    it "can't ride the bus if doesn't have enough money" do
      user = User.new(name: "Jorge")
      bus = Bus.new
      bus.add(user)
      expect(bus.size).to eq(0)
    end

    it "can ride the bus if it has enough money" do
      user = User.new(name: "Jorge")
      bus = Bus.new
      user.work
      bus.add(user)
      expect(bus.size).to eq(1)
    end
  end

  it "should have less money after it rides the bus" do
    user = User.new(name: "Jorge")
    bus = Bus.new
    user.work
    bus.add(user)
    expect(user.balance).to eq(3)
  end

end
