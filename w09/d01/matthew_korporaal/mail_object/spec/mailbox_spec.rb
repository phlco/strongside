require_relative 'spec_helper'
require_relative '../mailbox'
require_relative '../postcard'
require_relative '../package'

describe Mailbox do
  before(:each) do
    @mailbox = Mailbox.new
    @postcard = PostCard.new(message: "Hello World")
    @package = Package.new
  end

  it "should have array of MailItem objects" do
    expect(@mailbox.mail_items).to be
  end



  it "should have an accept_mail method" do
    expect(@mailbox.accept_mail(@postcard)).to be_true
  end

  it "should accept postcard or package" do
    expect(@mailbox.accept_mail(@postcard)).to be
    expect(@mailbox.accept_mail(@package)).to be
  end

  it "should place mail in mailbox array of mailitem objects" do
    expect(@mailbox.accept_mail(@postcard)).to be
    expect(@mailbox.accept_mail(@package)).to be
    expect(@mailbox.mail_items.length).to eq 2
  end

  it "should have an open_mail method that removes and returns the 1st item in the array" do
    @mailbox.accept_mail(@postcard)
    expect(@mailbox.open_mail).to eq(@postcard)
  end

  it "should have a method to count types of mailItems based on input" do
    @mailbox.accept_mail(@postcard)
    @mailbox.accept_mail(@package)
    expect(@mailbox.count_type("PostCard")).to eq(1)
    expect(@mailbox.count_type("Package")).to eq(1)

  end
  it "should have a to_s method that spits out number of packages" do
    @mailbox.accept_mail(@postcard)
    @mailbox.accept_mail(@package)
    expect(@mailbox.to_s).to match("The mailbox has 1 postcards and 1 packages")
  end
end