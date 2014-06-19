require_relative 'spec_helper'
require_relative '../user'

describe User do
  it "has a name" do
    user = User.new(name: 'Gary')
    expect(user.name).to eq 'Gary'
  end
  it "can increate the balance with work" do
    user = User.new(name: 'Elizabeth')
    user.work
    expect(user.balance).to eq 5
  end
  it "can only ride the bus if it has enough money" do
    user = User.new(name: 'Jamal')
    bus = Bus.new
    bus.add(user)
    expect(bus.size).to eq 0
  end
end