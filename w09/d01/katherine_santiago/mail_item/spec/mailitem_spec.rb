require_relative 'spec_helper'
require_relative '../lib/mailitem'

describe Mailitem do

  it "should have a ship_to address" do
    mail1 = Mailitem.new(ship_to_address: "New York")
    expect(mail1.ship_to_address).to eq("New York")
  end

  it "should have a stamp_value" do
    mail = Mailitem.new(ship_to_addess: "New York", stamp_value: 1)
    expect(mail.stamp_value).to eq(1)
  end
end