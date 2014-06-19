require_relative 'spec_helper'
require_relative '../lib/mailitem'
require_relative '../lib/postcard'
require_relative '../lib/package'
require_relative '../lib/mailbox'

describe Mailbox do

  before(:each) do
    @mailbox = Mailbox.new
  end

  it 'has an array of Mailitem objects' do
    expect(@mailbox.mail_items.is_a?(Array)).to eq true
  end

  it 'has an accept_mail method' do
    expect(@mailbox).to respond_to(:accept_mail)
  end

  context 'accepts postcards or package' do
    it 'accepts postcard' do
      postcard = Postcard.new
      @mailbox.accept_mail(postcard)
      expect(@mailbox.mail_items.first).to eq postcard
    end

    it 'accepts package' do
      package = Package.new
      @mailbox.accept_mail(package)
      expect(@mailbox.mail_items.first).to eq package
    end

    it 'does not accept another mailbox' do
      mailbox2 = Mailbox.new
      @mailbox.accept_mail(mailbox2)
      expect(@mailbox.mail_items.length).to eq 0
    end

    it 'accepts multiple mail items' do
      postcard = Postcard.new
      package = Package.new
      @mailbox.accept_mail(postcard)
      @mailbox.accept_mail(package)
      expect(@mailbox.mail_items).to eq [postcard, package]
    end
  end

  it 'has an open_mail method that removes and returns the first item in its array of Mailitem objects' do
    postcard = Postcard.new
    package = Package.new
    @mailbox.accept_mail(postcard)
    @mailbox.accept_mail(package)
    first_item = @mailbox.mail_items.first
    num_items = @mailbox.mail_items.length
    expect(@mailbox.open_mail).to eq(first_item)
    expect(@mailbox.mail_items.length).to eq(num_items-1)
  end

  it 'is string value includes postcards and packages' do
    postcard1 = Postcard.new
    postcard2 = Postcard.new
    package1 = Package.new
    package2 = Package.new
    @mailbox.accept_mail(postcard1)
    @mailbox.accept_mail(postcard2)
    @mailbox.accept_mail(package1)
    @mailbox.accept_mail(package2)
    expect(@mailbox.to_s).to eq("The mailbox has 2 postcards and 2 packages.")

  end





end

