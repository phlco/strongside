require_relative 'spec_helper'
require_relative '../lib/user'
require_relative '../lib/bus'

describe User do
  it "has a name" do
    user = User.new(name: 'Gary')
    expect(user.name).to eq 'Gary'
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

  describe "can only ride the bus if it has enough money" do
    it "can ride if it has enough money" do
      user = User.new(name: 'Jamal')
      bus = Bus.new
      user.work
      bus.add(user)
      expect(bus.size).to eq 1
    end
    it "can't ride without enough money" do
      user = User.new(name: 'Jamal')
      bus = Bus.new
      bus.add(user)
      expect(bus.size).to eq 0
    end
  end

  # it "should have less money after it rides the bus" do
  #   user = User.new(name: 'Jamal')
  #   user.work
  #   bus = Bus.new
  #   bus.add(user)
  #   expect(user.balance).to eq 3
  # end
end
