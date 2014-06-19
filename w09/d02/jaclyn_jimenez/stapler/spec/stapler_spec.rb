require_relative 'spec_helper'
require_relative '../stapler'

describe Stapler do
  it "should have a staple method" do
    stapler = Stapler.new
    expect(stapler).to respond_to(:staple)
  end

  it "should be able to check if it's empty" do
    stapler = Stapler.new
    expect(stapler).to be_empty
  end

  it "should be able to be refilled with staples" do
    stapler = Stapler.new
    stapler.refill
    expect(stapler).to_not be_empty
  end

  it "should have 100 staples when refilled" do
    stapler = Stapler.new
    stapler.refill
    expect(stapler.staple_count).to eq(10)
  end

  it "should reduce staple_count when you staple" do
    stapler = Stapler.new
    stapler.refill
    stapler.staple
    expect(stapler.staple_count).to eq(9)
    stapler.staple
    expect(stapler.staple_count).to eq(8)
  end

  it "should not be able to staple with 0 staples" do
    stapler = Stapler.new
    stapler.staple
    expect(stapler.staple_count).to eq(0)
  end

  it "should not be able to staple when staples run out" do
    stapler = Stapler.new
    stapler.refill
    10.times do
      stapler.staple
    end
    expect(stapler).to be_empty
    expect(stapler.staple_count).to eq(0)
  end

end
