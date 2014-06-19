require_relative '../lib/mailbox'
require_relative '../lib/package'
require_relative '../lib/postcard'

describe Mailbox do
  it "has an array of Mailitem objects" do
    mailbox = Mailbox.new
    expect(mailbox.contents.class).to eq(Array)
  end

  it "should have an accept mail method" do
    mailbox= Mailbox.new
    mailbox.accept_mail("hello")
    expect(mailbox.contents.empty?).to eq(false)
  end

  it "should have an open mail method" do
    mailbox = Mailbox.new
    mailbox.accept_mail("hello")
    mailbox.accept_mail("byebye")
    expect(mailbox.open).to eq("hello")
    expect(mailbox.contents.length).to eq(1)
  end

  it "should have a to_s method that
  includes the number of postcards and
  packages in the mailbox" do
    mailbox = Mailbox.new
    package = Package.new
    postcard = Postcard.new
    mailbox.accept_mail(package)
    mailbox.accept_mail(postcard)
    expect(mailbox.to_s).to eq("The mailbox has 1 postcard and 1 package")
  end


end