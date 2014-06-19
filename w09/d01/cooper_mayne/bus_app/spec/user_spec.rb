require_relative 'spec_helper'
require_relative '../lib/user'
require_relative '../lib/bus'

describe User do
  before(:each) do
    @user = User.new('Cooper')
  end

  it "has a name" do
    user = @user
    expect(user.name).to eq("Cooper")
  end

  it "has a starting balance of 0" do
    user = @user
    expect(user.balance).to eq(0)
  end
  
  it "can increase the balance with work" do
    user = @user
    user.work
    expect(user.balance).to eq(5)
  end

  describe "can only ride the bus if it has enough money" do
    it "it can't ride without any money" do
      user = @user
      bus = Bus.new
      bus.add(user)
      expect(bus.size).to eq(0)
    end

    it "it can ride with money" do
      user = @user
      user.work
      bus = Bus.new
      bus.add(user)
      expect(bus.size).to eq(1)
    end
  end
end
