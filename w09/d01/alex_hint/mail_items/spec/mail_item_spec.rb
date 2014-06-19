# MailItem should have a ship_to_address
# MailItem should have a stamp_value

require_relative 'spec_helper'
require_relative '../lib/mail_item'

describe MailItem do

  it 'should have a ship to address' do
    mailitem = MailItem.new
    mailitem.ship_to_address = "224 Main St"
    expect(mailitem.ship_to_address).to eq "224 Main St"
  end

  it "should have a stamp value" do
    mailitem = MailItem.new
    mailitem.stamp_value = "5"
    expect(mailitem.stamp_value).to eq "5"
  end

end
