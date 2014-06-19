require_relative "spec_helper"
require_relative "../lib/postcard"

describe Postcard do
  it "inherits from MailItem" do
    expect(Postcard.superclass).to eq(MailItem)
  end
  it "should have a message" do
    post = Postcard.new({})
    post.message = "Hey, Morgs"
    expect(post.message).to be
  end
  it "should have a method to return its message" do
    post = Postcard.new({})
    post.message = "Hey, Morgs"
    expect(post.message).to eq("Hey, Morgs")
  end
end
