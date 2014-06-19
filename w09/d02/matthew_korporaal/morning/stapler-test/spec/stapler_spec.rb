require_relative 'spec_helper'
require_relative '../lib/stapler'

describe Stapler do
  let(:stapler) {
    Stapler.new({
      name: "Red Rider",
      color: "red",
      num_staples: 0
    })
  }

  it "should have name" do
    expect(stapler.name).to eq("Red Rider")
  end

  it "should have a color" do
    expect(stapler.color).to eq("red")
  end

  it "should not work without staples in beginning" do
    expect(stapler.is_working?).to be_false
  end

  it "should be able to add staples" do
    expect(stapler.add(100)).to eq(100)
  end

  it "should work when staples present" do
    stapler.add(100)
    expect(staple.is_working?).to be_true
  end
end