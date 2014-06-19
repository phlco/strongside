require_relative 'spec_helper'
require_relative '../lamp'

describe Lamp do
  it "should turn on and off" do
    lamp = Lamp.new
    lamp.switch
    expect(lamp.on).to be_true
    lamp.switch
    expect(lamp.on).to be_false
  end


end
