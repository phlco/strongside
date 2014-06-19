require_relative 'spec_helper'
require_relative '../lib/user'
require_relative '../lib/bus'

describe User do
  it "has a name" do
    user = User.new(name: "Bob")
    expect(user.name).to eq "Bob"
  end

  it "has a starting balance" do
    user = User.new(name: "Elaine")
    expect(user.balance).to eq 0
  end

  it "can increase the balance with work" do
    user = User.new(name: 'Elizabeth')
    user.work
    expect(user.balance).to eq 5
  end

  context "can only ride the bus if it has enough money" do
    it "can ride if it has enough money" do
      user = User.new(name: 'Jamal')
      bus = Bus.new
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


  # describe "it works for money" do
  #   it "has a job"
  #   it "increases its balance by 5 every time"

end
