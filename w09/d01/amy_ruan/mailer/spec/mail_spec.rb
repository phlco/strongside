require_relative('../lib/mail')

describe Mail do
  it "has a ship_to_address" do
    mail = Mail.new(ship_to_address: "902 Broadway")
    expect(mail.ship_to_address).to eq "902 Broadway"
  end
  it "should have a stamp value" do
    mail = Mail.new(stamp_value: 500)
    expect(mail.stamp_value).to eq(500)
  end
end