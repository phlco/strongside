require_relative 'spec_helper'
require_relative '../lib/user'
require_relative '../lib/bus'

describe User do

  it "has a name" do
    user = User.new(name: 'Gary')
    expect(user.name).to eq 'Gary'
  end

  it "has the starting balance of 0" do
    user = User.new(name: 'Elaine')
    expect(user.balance).to eq 0
  end

  it "can increase the balance with work" do
    user = User.new(name: "Elizabeth")
    user.work
    expect(user.balance). to eq 5
  end

  it "can only ride a bus if it has enough money" do
    user = User.new(name: "Mick Jagger", balance: 0)
    bus = Bus.new
    bus.add(user)
    expect(bus.size).to eq 0
  end

  # it "should have less money after it rides the bus" do
  #   user = User.new(name: 'Jamal')
  #   user.work
  #   bus = Bus.new
  #   bus.add(user)
  #   expect(bus.balance).to eq 3
  # end



end





