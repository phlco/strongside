require 'spec_helper'

describe User do

  it "cannot create a user without a name" do
    user = User.new
    expect(user).to_not be_valid
  end

  it "requires a name to create a user" do
    user = User.new(name: "Kat")
    expect(user.save).to be_valid
  end

  it "cannot create a user without an email" do
    user = User.new(name: "Kat", email: "ks@ks.com", password: "kickhash")
    expect(user.save).to be_valid
  end

  it "cannot create a user without a password" do
    user = User.new(name: "Kat", email: "ks@ks.com", password: "kickhash")
    expect(user.save).to be_valid
  end

  it "requires passwords to be at least 8 characters long"
  it "requires passwords to be less than 17 characters long"
  it "has a unique name"
  it "has a unique email"
  it "can have more than one account"
  it "has a total_balance method"
  it "has a rich? method if they have more than 100k"
end
