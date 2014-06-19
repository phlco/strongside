require_relative 'spec_helper'
require_relative '../lib/lamp'

describe Lamp do
  let(:lamp) {
    Lamp.new ({
      name: "IGVAR"
    })
  }

  it "should have a name IGVAR" do
    expect(lamp.name).to eq("IGVAR")
  end

  it "should be initialized to off" do
    expect(lamp.is_on?).to be_false
  end

  it "can be turned on" do
    lamp.is_on = true
    expect(lamp.is_on?).to be_true
  end

end