require_relative "../lib/mailbox"
require_relative "spec_helper"
require_relative "../lib/package"

describe Mailbox do
  it "should have an array of mailbox object" do
    mail = Mailbox.new
    expect(mail.objects).to be_instance_of(Array)
  end
  describe "it should have an accept_mail method" do
    it "should take a postcard or package" do
      mail = Mailbox.new
      pack = Package.new
      expect(mail).to respond_to(:accept_mail)
    end
    it "should place mail in the mailbox's objects" do
      mail = Mailbox.new
      pack = Package.new
      mail.accept_mail(pack)
      expect(mail.objects).to eq([pack])
    end
  end
  it "should have an open_mail method that removes and returns the first itne in objects" do
    mail = Mailbox.new
    pack = Package.new
    mail.accept_mail(pack)
    expect(mail.open_mail).to eq(pack)
    expect(mail.objects).to eq([])
  end
  it "should have a to_s method that includes the number of postcards and packages" do
    mail = Mailbox.new
    pack = Package.new
    mail.accept_mail(pack)
    expect(mail.to_s).to eq("The mailbox has 0 postcards and 1 packages")
  end
end
