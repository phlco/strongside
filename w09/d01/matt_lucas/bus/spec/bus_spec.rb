require_relative 'spec_helper'
require_relative '../bus'
require_relative '../user'



describe Bus do

  before(:each) do
    @user = User.new("gary")
    @user.work
  end


  it "is empty" do
    expect(Bus.new).to be_empty
  end

  it "can add a passenger" do
    bus = Bus.new
    user = User.new("micky")
    user.work
    bus.add(user)
    expect(bus).to_not be_empty
  end

  it "can take more than one passenger" do
    bus = Bus.new
    user = User.new("mick")
    user.work
    bus.add(user)
    expect(bus.size).to eq(1)
    user2 = User.new("keith")
    user2.work
    bus.add(user2)
    expect(bus.size).to eq(2)
  end

  # it "returns true if it contains a specific rider" do
  #   bus = Bus.new
  #   expect(bus.contains?("mick")).to be_false
  #   bus.add("mick")
  #   expect(bus.contains?("mick")).to be_true
  # end


  # it "won't let you add the same person twice" do
  #   bus = Bus.new
  #   bus.add("mick")
  #   bus.add("mick")
  #   expect(bus.size).to eq(1)
  # end

  # it "can only hold 20 people max" do
  #   bus = Bus.new
  #   20.times do |n|
  #     bus.add(n)
  #   end
  #   expect(bus.size).to eq(20)
  #   bus.add("the straw")
  #   expect(bus.size).to eq(20)
  # end

  # it "costs 2.00 to ride the bus" do
  #   bus = Bus.new
  #   expect(bus.fare).to eq(2)
  # end

  # it "only adds a user if he has enough money" do
  # end

end
