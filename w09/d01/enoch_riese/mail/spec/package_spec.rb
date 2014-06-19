require_relative "spec_helper"
require_relative "../lib/package"

describe Package do
  it "should have a content array" do
    pack = Package.new
    expect(pack.content).to be_instance_of(Array)
  end
  it "should have an is_fragile boolean" do
    pack = Package.new
    frag = pack.is_fragile
    expect(!!frag).to eq(frag)
  end
  it "should have an is_broken boolean" do
    pack = Package.new
    frag = pack.is_broken
    expect(!!frag).to eq(frag)
  end
  it "should have a method shake" do
    pack = Package.new
    expect(pack).to respond_to(:shake)
  end
  it "should break if fragile and shaken" do
    pack = Package.new
    pack.shake
    expect(pack.is_broken).to be_true
  end
  it "should have an is_broken method" do
    pack = Package.new
    expect(pack).to respond_to(:is_broken)
  end
end
