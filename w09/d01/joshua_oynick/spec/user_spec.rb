require_relative 'spec_helper'
require_relative '../user'
require_relative '../bus'

describe User do
  it "has a name" do
    user = User.new(name: 'Bob')
    expect(user.name).to eq 'Bob'
  end

  it "has a starting balance of 0" do
    user = User.new(name: 'Elaine')
    expect(user.balance).to eq 0
  end

  it "can increase the balance with work" do
    user = User.new(name: 'Elizabeth')
    user.work
    expect(user.balance).to eq 5
  end

  it "can only ride the bus if it has enough money" do
    user = User.new(name: 'Joe')
    bus = Bus.new
    bus.add(user)
    expect(bus.size).to eq 0
  end

  context "can only ride the bus if it has enough money" do
    it "can ride the bus if it has enough money" do
      user = User.new(name: 'Joe')
      bus = Bus.new
      user.work
      bus.add(user)
      expect(bus.size).to eq 1
    end

    it "can't ride without enough money" do
      user = User.new(name: 'Joe')
      bus = Bus.new
      bus.add(user)
      expect(bus.size).to eq 0
    end
  end

  # it "should have less money after it rides the bus" do
  #   user = User.new(name: 'Joe')
  #   user.work
  #   bus = Bus.new
  #   bus.add(user)
  # end
  # describe "it works for money" do
  #   it "has a job" do
  #   it "increases its balance by 5 every time it works"
end
