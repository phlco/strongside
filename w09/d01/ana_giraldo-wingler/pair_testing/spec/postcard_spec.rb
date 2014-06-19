require_relative 'spec_helper'
require_relative '../mail_item'
require_relative '../postcard'

describe PostCard do

  before(:each) do
    @postcard = PostCard.new({message: "Hi"})
  end

  it "should inherit from MailItem" do
    expect(PostCard < MailItem).to be_true
  end

  it "should have a message" do
    expect(@postcard.message).to be
  end

  it "should have a method to return its message" do
    expect(@postcard.message).to match("Hi")
  end

end