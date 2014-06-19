require_relative 'spec_helper'
require_relative '../mail_item'
require_relative '../package'
require_relative '../postcard'

describe Mail_Item do

  it "should have a ship_to_address" do
    mail_item = Mail_Item.new
    expect(mail_item.ship_to_address).to be_true
  end

  it "should have a stamp value" do
    mail_item = Mail_Item.new
    expect(mail_item.stamp_value).to be_true
  end

end