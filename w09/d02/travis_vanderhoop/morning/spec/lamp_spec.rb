require_relative 'spec_helper'
require_relative '../lamp'

describe Lamp do
  before(:each) do
    @lamp = Lamp.new
  end

  it "can be instantiated" do
    expect(@lamp.class).to eq(Lamp)
  end

  it "can tell you if it's on" do
    expect(@lamp.on).to eq(false)
  end

  it "can be turned when off and vice versa" do
    @lamp.toggle_power
    expect(@lamp.on).to eq(true)
    binding.pry
    @lamp.toggle_power
    expect(@lamp.on).to eq(false)
  end
end
