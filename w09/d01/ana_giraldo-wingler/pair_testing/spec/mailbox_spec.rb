require_relative 'spec_helper'
require_relative '../mailbox'
require_relative '../package'
require_relative '../postcard'

describe Mailbox do
  before(:each) do
    @mailbox = Mailbox.new
    @package = Package.new
    @postcard = PostCard.new
  end

  it "should have array of MailItem objects" do
    expect(@mailbox.mail_items).to be
  end

  describe "accept_mail method" do

    it "should exist" do
      expect(@mailbox.accept_mail("poop")).to_not raise_error
    end

    it "should only accept a postcard or a package" do
      @mailbox.accept_mail("poop")
      expect(@mailbox.mail_items).to_not include("poop")
      @mailbox.accept_mail(@package)
      expect(@mailbox.mail_items).to include(@package)
    end

  end

  describe "open_mail method" do

    it "should exist" do
      expect(@mailbox.open_mail).to_not raise_error
    end

    it "should remove and return the first item in its array of MailItem objects" do
      @mailbox.accept_mail(@package)
      @mailbox.accept_mail(@postcard)
      expect(@mailbox.open_mail).to eq(@package)
    end

  end

  describe "to_s method" do

    it "should describe the number of postcards and packages in the mailbox" do
      16.times do
        @mailbox.accept_mail(@postcard)
      end
      3.times do
        n = Package.new
        @mailbox.accept_mail(@package)
      end
      expect(@mailbox.to_s).to eq("The mailbox has 16 postcards and 3 packages.")
    end

  end

end