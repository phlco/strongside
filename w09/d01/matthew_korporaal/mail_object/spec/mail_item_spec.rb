require_relative 'spec_helper'
require_relative '../mail_item'

describe MailItem do

  it "should have a ship_to_address" do
    mail = MailItem.new
    expect(mail.ship_to_address).to be
  end

  it "should have a stamp_value" do
    mail = MailItem.new
    expect(mail.stamp_value).to be
  end

end