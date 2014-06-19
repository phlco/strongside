require_relative 'spec_helper'
require_relative '../lib/postcard'
require_relative '../lib/mailitem'

describe PostCard do

  it "should have a ship to address" do
    postcard = PostCard.new
    expect(postcard.ship_to_address).to be_true
  end

  it "should have a message" do
    postcard = PostCard.new
    expect(postcard.set_message("message")).not_to be_empty
  end

  it "should return the message" do
    postcard = PostCard.new
    postcard.set_message("the message")
    expect(postcard.get_message()).to eq("the message")
  end

end
