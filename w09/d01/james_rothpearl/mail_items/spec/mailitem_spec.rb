require_relative 'spec_helper'
require_relative '../lib/mailitem'

describe Mailitem do
  it "has a shipping address" do
    m1 = Mailitem.new(ship_to_address: "902 Broadway")
    expect(m1.ship_to_address).to eq("902 Broadway")
  end

  it "should have a stamp value" do
    m1 = Mailitem.new(ship_to_address: "902 Broadway", stamp_value: 42)
    expect(m1.stamp_value).to eq(42)
  end
end
