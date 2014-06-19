require_relative 'spec_helper'
require_relative '../lib/package'

describe Package do
  it "should inherit MailItem" do
    p1 = Package.new
    expect(p1).to be_a_kind_of(Mailitem)
  end

  it "should have a content array" do
    p1 = Package.new
    p1.content
    expect(p1.content).to be_instance_of(Array)
  end

  it "should have an is_fragile boolean" do
    p1 = Package.new
    p1.is_fragile?
    expect(p1.is_fragile?).to be_true
  end

  it "should have an is_broken boolean" do
    p1 = Package.new
    p1.is_broken?
    expect(p1.is_broken?).to be_false
  end

  it "should have a shake method" do


end
