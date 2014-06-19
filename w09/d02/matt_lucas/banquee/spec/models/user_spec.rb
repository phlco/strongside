require 'spec_helper'

describe User do

  it "requires a name, email and password" do
    user = User.new
    expect(user.save).to eq(false)
  end

  it "requires name" do
    user = User.new(name: "Matt")
    user.email = "masmad@adjghsdlg.com"
    expect(user.save).to eq(true)
  end

  it "requires email" do
    user = User.new(name: "Matt")
    user.save
    expect(user.errors).to have_key(:email)
  end

  it "requires a unique email" do
    user = User.new(name: "Matt", email: "matt@matt.com")
    user2 = User.new(name: "Matt", email: "matt@matt.com")
    user.save
    user2.save
    expect(user2.errors).to have_key(:email)
  end

  it "can have multiple accounts" do
    user = User.new(name: "Matt", email: "matt@matt.com")
    user.account
    user.save
    expect(user.save).to eq(false)
  end
end
