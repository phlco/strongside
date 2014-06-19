require_relative 'spec_helper'
require_relative '../lib/mailitem'
require_relative '../lib/postcard'

describe Postcard do

  it "should inherit mailitem" do
    p1 = Postcard.new
    p1.class.ancestors
    expect(p1.class.ancestors).to include(Mailitem)
  end

  it "should have a message" do
    p1 = Postcard.new(ship_to_address: "China", stamp_value: 1, message: "Wish you were here")

    expect(p1.message).to eq("Wish you were here")
  end

  it "should have a method to return its message" do
    p1 = Postcard.new(message: 'Yo')
    expect(p1.message).to eq('Yo')
  end


end