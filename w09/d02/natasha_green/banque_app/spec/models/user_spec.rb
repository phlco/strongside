require 'spec_helper'

describe User do

  it "need password, password confirmation and email" do
    user = User.new
    expect(user).to_not be_valid
  end

  it "needs email" do
    user = User.new
    user.password = "12345god"
    user.password_confirmation = "12345god"
    expect(user).to_not be_valid
  end

  it "has valid email and password" do
    user = User.new
    user.password = "123god"
    user.password_confirmation = "123god"
    user.email = "user@aol.com"
    expect(user).to be_valid
  end

  it "no repeating emails" do
    user1 = User.new
    user1.password = "123god"
    user1.password_confirmation = "123god"
    user1.email = "user@aol.com"
    user1.save

    user2 = User.new
    user2.password = "password"
    user2.password_confirmation = "password"
    user2.email = "user@aol.com"
    expect(user2.save).to be_false
  end

  it "ensure my password is at least 8 characters" do
    user1 = User.new
    user1.password = "123god"
    user1.password_confirmation = "123god"
    user1.email = "user@aol.com"
    user1.save
    expect(user1.password).to have_at_least(8).characters
  end

end