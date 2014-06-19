require_relative 'spec_helper'
require_relative '../lib/mailitem'
require_relative '../lib/package'

describe Package do

  it "should inherit mailitem" do
    p1 = Package.new
    p1.class.ancestors
    expect(p1.class.ancestors).to include(Mailitem)
  end

  it "should have a content array" do
    p1 = Package.new
    expect(p1.content).to be_a_kind_of(Array)
  end

  it "should have is_fragile boolean" do
    p1 = Package.new
    expect(p1.is_fragile?).to eq(true)
  end

  it "should have an is_broken boolean" do
    p1 = Package.new
    expect(p1.is_broken?).to eq(true)
  end

  it "should check if package is fragile and is shaken, and set is_broken to true" do
    p1 = Package.new
    p1.is_fragile?
    p1.shake
    expect(p1.is_broken?).to eq(true)
  end



end