require_relative 'spec_helper'
require_relative '../package'

describe Package do

  it "should have inherit mail_item" do
    package = Package.new
    expect(package.stamp_value).to be_true
  end

  it "should have a content array" do
    package = Package.new
    expect(package.content.class).to eq(Array)
  end

  it "has an is_fragile boolean" do
    package = Package.new
    expect(package.is_fragile).to eq(false)
  end

  it "should have a is_broken boolean" do
    package = Package.new
    expect(package.is_broken).to eq(false)
  end

  it "should have a method shake that when shaken, is_broken is set to true" do
    package = Package.new
    package.shake
    expect(package.is_broken).to eq(true)
  end

end










