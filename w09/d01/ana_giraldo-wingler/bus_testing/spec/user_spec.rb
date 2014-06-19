require_relative 'spec_helper'
require_relative '../user'
require_relative '../bus'

describe User do
  it "has a name" do
    user = User.new(name: 'Sally')
    expect(user.name).to eq('Sally')
  end

  it "has a starting balance of 0" do
    user = User.new(name: 'Sally')
    expect(user.balance).to eq(0)
  end

  it "can increase the balance with work" do
    user = User.new(name: 'Elizabeth')
    user.work
    expect(user.balance).to eq 5
  end

describe "can only ride the bus if it has enough money" do

  it "can ride if it has money" do
    user = User.new(name: 'Jamal')
    bus = Bus.new
    bus.add(user)
    expect(bus.size).to eq 0
  end

  it "can't ride without enough money" do
    user = User.new(name: 'Jamal')
    user.work
    bus = Bus.new
    bus.add(user)
    expect(bus.size).to eq 1
  end

end

  # describe "it works for money" do
  #   it "has a job" do
  #   end

  #   it "increases its balance by 5 every job" do
  #   end

  # end

end