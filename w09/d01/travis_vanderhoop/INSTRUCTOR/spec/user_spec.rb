require_relative 'spec_helper'
require_relative '../user'
require_relative '../bus'

describe User do
  it "has a name" do
    travis = User.new(name: 'Travis')
    expect(travis.name).to eq('Travis')
  end

  it "has a starting balance of zero" do
    travis = User.new(name: 'Travis')
    expect(travis.balance).to eq(0)
  end

  it "can increase the balance with work" do
    user = User.new(name: "Elizabeth")
    user.work
    expect(user.balance).to eq(5)
  end

  it "can only ride the bus if it has enough money" do
    user = User.new(name: "Trizzle")
    bus = Bus.new
    bus.add(user)
    expect(bus.size).to eq 0
  end

  it "should have less money after it rides the bus" do
    user = User.new(name: "Trizzle")
    user.work
    opening_balance = user.balance
    bus = Bus.new
    user.ride_the_bus(bus)
    bus.add(user)
    closing_balance = user.balance
    expect(opening_balance > closing_balance).to be_true
  end

end
