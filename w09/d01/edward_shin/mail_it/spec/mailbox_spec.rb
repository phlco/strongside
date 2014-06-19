require_relative 'spec_helper'
require_relative '../mailbox'
require_relative '../postcard'
require_relative '../package'


describe Mailbox do
  it "should have an array of MailItem objects" do
    mailbox = Mailbox.new
    expect(mailbox.check_mail.class).to eq(Array)
  end

  it "should have an accept_mail method" do
    mailbox = Mailbox.new
    package = Package.new
    mailbox.accept_mail(package)
    expect(mailbox.check_mail.length).to eq(1)
    postcard = Postcard.new
    mailbox.accept_mail(postcard)
    expect(mailbox.check_mail.length).to eq(2)
  end

  it "should have an open_mail method that removes and returns the item" do
    mailbox = Mailbox.new
    package = Package.new
    postcard = Postcard.new
    mailbox.accept_mail(postcard)
    mailbox.accept_mail(package)
    expect(mailbox.open_mail).to eq(postcard)
  end

  it "should have a to_s method that returns the num of postcards and packages" do
    mailbox = Mailbox.new
    5.times do |n|
      n = Package.new
      mailbox.accept_mail(n)
    end
    7.times do |p|
    p = Postcard.new
      mailbox.accept_mail(p)
    end
    expect(mailbox.to_s).to eq("the mailbox has 5 packages and 7 postcards")
  end

end