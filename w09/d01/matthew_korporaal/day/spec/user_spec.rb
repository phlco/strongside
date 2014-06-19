require_relative 'spec_helper'
require_relative '../lib/user'
require_relative '../lib/bus'

describe User do
  it "has a name" do
    user = User.new(name: 'Phil')
    expect(user.name).to eq 'Phil'
  end

  it "has a starting balance of 0" do
    user = User.new
    expect(user.balance).to eq(0)
  end

  it "can increase the balance with work" do
    user = User.new(name: 'Elizabeth')
    user.work
    expect(user.balance).to eq 5

  end

  context "can only ride the bus if it has enough money" do
    it "can ride the bus if it has enough money" do
      user = User.new(name: 'Jamal')
      bus = Bus.new
      user.work
      bus.add(user)
      expect(user.balance).to eq 5
    end

    it "can ride the bus if it has enough money" do
      user = User.new(name: 'Jamal')
      bus = Bus.new
      #user.work
      bus.add(user)
      expect(bus.size).to eq 0
    end
  end
  # it "should have less money after it rides the bus" do
  #   #user = User.new(name: 'Jamal')
  # end

end





