require_relative 'spec_helper'
require_relative '../lib/postcard'
require_relative '../lib/mailitem'
require_relative '../lib/package'

describe Postcard do

  it "inherits a mail_item" do
    expect(Postcard.superclass).to eq(Mailitem)
  end

  it "has a message" do
    card = Postcard.new(message: "bambam")
    expect(card.message).to eq 'bambam'
    expect(card).to respond_to(:message)
  end


end
