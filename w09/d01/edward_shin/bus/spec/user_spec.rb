require_relative 'spec_helper'
require_relative "../user"
require_relative "../bus"

describe User do

  it "has a name" do
    user = User.new(name: "eddie")
    expect(user.name).to eq("eddie")
  end

  it "has a starting balance" do
    user = User.new
    expect(user.balance).to eq 0
  end

  it "can increase the balance with work" do
    user = User.new(name: "eddie")
    user.work
    expect(user.balance).to eq(5)
  end


  it "can only ride the bus if it has enough money" do
    user = User.new(name: "jamal")
    bus = Bus.new
    user.work
    bus.add(user)
    expect(bus.size).to eq(1)
  end


end
