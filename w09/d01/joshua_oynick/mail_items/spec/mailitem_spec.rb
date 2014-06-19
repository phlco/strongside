require_relative 'spec_helper'
require_relative '../lib/mailitem'

describe Mailitem do

  it "has a ship_to_address" do
    mail_item = Mailitem.new(ship_to_address: '1 North Pole')
    expect(mail_item.ship_to_address).to eq('1 North Pole')
  end

  it "has a stamp value" do
    mail_item = Mailitem.new(stamp_value: 'yomomma')
    expect(mail_item.stamp_value).to eq 'yomomma'
  end

end
