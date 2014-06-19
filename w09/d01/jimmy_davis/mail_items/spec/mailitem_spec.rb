require_relative "spec_helper"
require_relative "../lib/mailitem"

describe MailItem do

  it "should have a ship to address" do
    mailitem = MailItem.new
    expect(mailitem.ship_to_address).to be_true
  end

  it "should have a stamp value" do
    mailitem = MailItem.new
    expect(mailitem.stamp_value).to be_true
  end

end
