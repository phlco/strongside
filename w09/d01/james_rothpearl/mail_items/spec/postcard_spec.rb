require_relative 'spec_helper'
require_relative '../lib/postcard'

describe Postcard do
  it "should inherit MailItem" do
  end

  it "should have a message" do
    p1 = Postcard.new(message: "Hello")
  end


end
