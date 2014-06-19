require_relative 'spec_helper'
require_relative '../lib/postcard'

describe Postcard do
  it "should inherit MailItem" do
    p1 = Postcard.new
    expect(p1).to be_a_kind_of(Mailitem)
  end

  it "should have a message" do
    p1 = Postcard.new
    p1.message
    expect(p1.message).to eq("I am a message")
  end

  it "should be able to return a message" do
    p1 = Postcard.new
    p1.message
    p1.return_message
    expect(p1.return_message).to be_true
  end
end
