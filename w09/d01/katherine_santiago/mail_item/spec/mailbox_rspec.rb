require_relative 'spec_helper'
require_relative '../lib/mailitem'
require_relative '../lib/package'
require_relative '../lib/postcard'
require_relative '../lib/mailbox'

describe Mailbox  do

  it "has an array of Mailitem objects" do
    m1 = Mailbox.new
    expect(m1.mailitem).to be_empty
  end

  it "takes a postcard" do
    m1 = Mailbox.new
    p1 = Postcard.new
    m1.accept_mail(p1)
    expect(m1.mailitem).to eq(p1)
  end

  it "takes a package" do
    m1 = Mailbox.new
    p1 = Package.new
    m1.accept_mail(p1)
    expect(m1.mailitem).to eq(p1)
  end

  it "places postcards and packages in the mailbox's array of MailItem objects" do
    m1 = Mailbox.new
    p1 = Postcard.new
    package1 = Package.new
    m1.accept_mail(p1)
    m1.accept_mail(package1)
    expect(m1.mailitem).to eq([p1, package1])
  end

  it "removes and returns first item in mailitem objects" do
    m1 = Mailbox.new
    p1 = Postcard.new
    p2 = Postcard.new
    p3 = Package.new
    m1.accept_mail(p1)
    m1.accept_mail(p2)
    m1.accept_mail(p3)
    m1.open_mail
    expect(m1.mailitem).to eq([p2, p3])
    expect(m1.open_mail).to eq([p1])
  end

end
