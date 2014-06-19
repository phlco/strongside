require_relative 'spec_helper'
require_relative '../postcard'

describe Postcard do
  it "should inherit Mailitem" do
    postcard = Postcard.new
    expect(postcard.stamp_value).to be_true
  end

  it "should have a message" do
    postcard = Postcard.new(message: "My dad's name is Derek. Tell no one.")
    expect(postcard.message).to eq("My dad's name is Derek. Tell no one.")
  end

  it "should return its message" do
    postcard = Postcard.new(message: "I like turtles!")
    expect(postcard.message).to eq("I like turtles!")
  end

end