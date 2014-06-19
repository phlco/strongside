require_relative "../lib/lamp"
require_relative "spec_helper"

describe Lamp do
  let(:lamp) do
    Lamp.new
  end

  it "should have a bulb" do
    expect(lamp.bulb).to be_true
  end

  it "should be able to be plugged in" do
    expect(lamp.plug_in).to be_true
  end

  it "should indicate if the lamp is already plugged in" do
    @plug_in = true
    expect(lamp.plug_in).to eq("Lamp is already plugged in")
  end

  it "should indicate plug_in is false when unplugged" do
    expect(lamp.unplug).to be(false)
  end

end
