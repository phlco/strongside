require_relative 'spec_helper'
require_relative '../user'
require_relative '../bus'


describe User do

  it "has a name" do
    m = User.new("Matt")
    expect(m.name).to eq("Matt")
  end

  it "has a starting balance" do
    m = User.new("Matt")
    expect(m.balance).to eq(0)
  end

  it "can increase the balance with work" do
    user = User.new("Liz")
    user.work
    expect(user.balance).to_not eq(0)
  end

  describe "can only ride the bus with enough money" do
    it "can ride the bus with enough money" do
      user = User.new("Mike")
      user.work
      bus = Bus.new
      bus.add(user)
      expect(bus.size).to eq(1)
    end
    it "can't ride unless it has enough money" do
      user2 = User.new("pauper")
      bus = Bus.new
      bus.add(user2)
      expect(bus.size).to eq(0)
    end
  end

  it "should have less money after bus ride" do
  end

end