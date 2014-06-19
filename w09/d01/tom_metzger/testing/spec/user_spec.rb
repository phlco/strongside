require_relative 'spec_helper'
require_relative '../lib/user'
require_relative '../lib/bus'

describe User do

  it "has a name" do
    user = User.new(name: "Ronnie Wood")
    expect(user.name).to be_true
  end

  it "has a starting balance of 0" do
    user = User.new(name: "Ronnie Wood")
    expect(user.balance).to eq(0)
  end

  it "can increase the balance with work" do
    user = User.new(name: "Elizabeth")
    user.work
    expect(user.balance).to eq(5)
  end

  # describe blocks within tests are used to compartmentalized larger tests that have been broken down into smaller tests
  # can use contain block (instead of it) in describe blocks

  context "can only ride the bus if it has enough money" do

    it "can't ride without enough money" do
      user = User.new(name: "Jamal")
      bus = Bus.new
      bus.add("Jamal")
      expect(bus.size).to eq(0)
    end

    it "can ride if it has enough money" do
      user = User.new(name: "Jamal")
      user.work
      bus = Bus.new
      bus.add("Jamal")
      expect(bus.size).to eq(1)
    end

  end


end
