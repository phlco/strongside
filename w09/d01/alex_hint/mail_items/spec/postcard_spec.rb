# Postcard should inherit MailItem
# Postcard should have a message
# Postcard should have a method to return its message

require_relative 'spec_helper'
require_relative '../lib/postcard'

describe Postcard do

  it "should inherit MailItem" do
    postcard = Postcard.new
    postcard.ship_to_address = "224 Main St"
    expect(postcard.ship_to_address).to eq "224 Main St"
  end

  it "should have a message" do
    postcard = Postcard.new(message: "hello")
    expect(postcard.message).to eq("hello")
  end

  it "should have a method to return its message" do
    postcard = Postcard.new(message: "hello")
    expect(postcard.message).to eq("hello")
  end

end