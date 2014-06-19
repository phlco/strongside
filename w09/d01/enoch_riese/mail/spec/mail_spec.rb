
require_relative "spec_helper"
require_relative "../lib/mail_item"

describe MailItem do
  it "should have a ship_to_address" do
    mail = MailItem.new({ship_to_address: "140 Franklin St."})
    expect(mail.ship_to_address).to be
  end
  it "should have a stamp_value" do
    mail = MailItem.new({stamp_value: 0.37})
    expect(mail.stamp_value).to be
  end
end
