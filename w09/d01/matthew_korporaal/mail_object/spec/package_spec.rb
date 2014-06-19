require_relative 'spec_helper'
require_relative '../package'

describe Package do

  before(:each) do
    @package = Package.new
  end

  it "should inherit from MailItem" do
    expect(Package < MailItem).to be_true
  end

  it "should have a content array" do
    expect(@package.content).to be
  end

  it "should have an is_fragile boolean" do
    expect(@package.fragile?).to be_false
  end

  it "should have an is_broken boolean" do
    expect(@package.broken?).to be_false
  end

  it "should have a method 'shake'" do
    @package.shake
    expect(@package.broken?).to be_true
  end

  it "should have a is_broken method" do
    expect(@package.broken?).to_not raise_error
  end

end