require_relative 'spec_helper'
require_relative '../bus'
require_relative '../user'

describe Bus do
  before(:each) do
    @user = User.new("Joe")
    @user.work
    @user2 = User.new("Steve")
    @user2.work
    @user3 = User.new("Rebecca")
    @user3.work
    @bus = Bus.new
  end

  it 'is empty' do
    expect(Bus.new).to be_empty
  end
  it 'can add a passenger' do
    @bus.add(@user)
    expect(@bus).not_to be_empty
  end

  it 'can take more than one passenger' do
    @bus.add(@user)
    @bus.add(@user2)
    expect(@bus.size).to eq(2)
    @bus.add(@user3)
    expect(@bus.size).to eq(3)
  end

  it 'returns true if it contains a specific rider' do
    expect(@bus.contains(@user)).to be_false
    @bus.add(@user)
    expect(@bus.contains(@user)).to be_true
  end

  it 'wont let you add the same passenger twice' do
    @bus.add(@user2)
    @bus.add(@user2)
    expect(@bus.size).to eq(1)
  end

  it 'can only hold 20 people max' do
    20.times do |n|
      user = User.new(n)
      user.work
      @bus.add(user)
    end
    expect(@bus.size).to eq(20)
    @bus.add(@user2)
    expect(@bus.size).to eq(20)
  end

  it "has a fare of 2 dollars" do
    bus = Bus.new
    expect(bus.fare).to eq(2)
  end

end
