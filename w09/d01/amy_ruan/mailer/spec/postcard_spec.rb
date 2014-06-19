require_relative('../lib/postcard')

describe Postcard do
  it "has a ship_to_address" do
    postcard = Postcard.new(ship_to_address: "902 Broadway")
    expect(postcard.ship_to_address).to eq "902 Broadway"
  end

  it "should have a message" do
    postcard = Postcard.new(message: "whats up")
    expect(postcard.message).to eq("whats up")
  end
end