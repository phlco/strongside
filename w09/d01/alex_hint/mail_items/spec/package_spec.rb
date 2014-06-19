# Pacakge should inherit MailItem
# Package should have a content array
# Package should have an is_fragile boolean
# Package should have an is_broken boolean
# Package should have a method shake
# If the Package is_fragile and is shaken... is_broken should be set to true
# Package should have an is_broken? method that returns whether it is broken or not

require_relative 'spec_helper'
require_relative '../lib/package'

describe Package do

  it "should inherit Package" do
    package = Package.new
    package.ship_to_address = "224 Main St"
    expect(package.ship_to_address).to eq "224 Main St"
  end

  it "should have a content array" do
    contentArray = ["Item1", "Item2"]
    package = Package.new(content: contentArray)
    expect(package.content).to be_instance_of(Array)
  end

  # Broken boolean

  it "should have an is_fragile? boolean" do
    package = Package.new
    if package.is_fragile?
      expect(package.is_fragile?).to eq true
    else
      expect(package.is_fragile?).to eq false
    end
  end

  it "should have a method shake" do
    package = Package.new
    package.should respond_to :shake
  end

  it "should have an is_broken? method that returns whether it is broken or not" do
    package = Package.new
    if package.is_broken?
      expect(package.is_broken?).to eq true
    else
      expect(package.is_broken?).to eq false
    end
  end

  it "if the Package is_fragile and is shaken... is_broken should be set to true" do
    package = Package.new
    package.fragile = true
    package.shake
    expect(package.is_broken?).to be_true
  end
end

