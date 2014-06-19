require_relative '../lib/lamp'

describe Lamp do

  let(:lamp) {
  Lamp.new({
    name: "IGVAR",
    is_on: false
  }) }

  it "has a name" do
    expect(lamp.name).to eq("IGVAR")
  end

  it "can turn off" do
    lamp.turn_on
    expect(lamp.is_on?).to eq(true)
  end
end
