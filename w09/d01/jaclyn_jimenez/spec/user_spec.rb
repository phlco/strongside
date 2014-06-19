require_relative 'spec_helper'
require_relative '../user'
require_relative '../bus'
describe User do
  it "must have a name" do
    user = User.new("Steve")
    expect(user.name).to eq("Steve")
  end

  it "has a starting balance of 0" do
    user = User.new("Joe")
    expect(user.balance).to eq(0)
  end

  describe "it works for money" do
    it "has a job" do
      user = User.new("Joe")
      expect(user.job).to eq("dev")
    end

    it "can increase the balance with work" do
      user = User.new("Joe")
      user.work
      expect(user.balance).to eq(5)
    end

    it "can only ride the bus if it has enough money" do
      user1 = User.new("Joe")
      user1.work
      user2 = User.new("Joe")
      bus = Bus.new
      bus.add(user1)
      bus.add(user2)
      expect(bus.size).to eq(1)
    end
  end

end
