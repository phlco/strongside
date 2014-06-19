require_relative 'spec_helper'
require_relative '../lib/mailitem'
require_relative '../lib/package'

describe Package do

  it "should have a ship to address" do
    package = Package.new
    expect(package.ship_to_address).to be_true
  end

  it "should have a content array" do
    package = Package.new
    expect(package.content.length).to eq(2)
  end

  it "should be labeled if fragile or not" do
    package = Package.new
    package.is_fragile = true
    expect(package.is_fragile).to be_true
  end

  it "should be tell if it is broken or not" do
    package  = Package.new
    expect(package.is_broken).to be_false
  end

  context "should be broken if it is fragile and shaken" do
    it "should break if shaken" do
      p1 = Package.new
      p1.is_fragile = true
      expect(p1.is_fragile).to be_true
      expect(p1.is_broken).to be_false
      p1.shake
      expect(p1.is_broken).to be_true
    end
    it "should not break if shaken" do
      p2 = Package.new
      expect(p2.is_fragile).to be_false
      expect(p2.is_broken).to be_false
      p2.shake
      expect(p2.is_broken).to be_false
    end
  end

end
