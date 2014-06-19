require_relative 'spec_helper'
require_relative '../lib/user'
require_relative '../lib/bus'

describe User do

  it "has a name" do
    user = User.new(name: "Hello")
    expect(user.name).to eq("Hello")
  end

  it "has a starting balance" do
    user = User.new(name: "Hello")
    expect(user.balance).to eq 0
  end

  it "can create the balance with work" do
    user = User.new(name: 'Elizabeth')
    user.work
    expect(user.balance).to eq 5
  end

  context "can only ride the bus if it has enough money" do

    it "can only ride the bus if it has enough money" do
      user = User.new(name: 'Jamal')
      user.work
      bus = Bus.new
      bus.add(user)
      expect(bus.size).to eq 1
    end

    it "can't ride the bus without the bus " do
      user = User.new(name: 'Jamal')
      bus = Bus.new
      bus.add(user)
      expect(bus.size).to eq 0
    end

    it "decreases your balance if you ride the bus" do
      user = User.new(name: 'Jamal')
      user.work
      bus = Bus.new
      bus.add(user)
      expect(user.balance).to eq 3
    end

  end

end