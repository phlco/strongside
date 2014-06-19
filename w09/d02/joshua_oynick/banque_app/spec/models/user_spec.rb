require 'spec_helper'

describe User do

  before(:each) do
  @attr = {
    :name => "Example User",
    :email => "user@example.com",
    :password => "kickhash",
    :password_confirmation => "kickhash"
    }
  end

  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "should require a name" do
    user1 = User.new(@attr.merge(:name => ""))
    user1.should_not be_valid
  end

  it "should require an email address" do
    user1 = User.new(@attr.merge(:email => ""))
    user1.should_not be_valid
  end



end
