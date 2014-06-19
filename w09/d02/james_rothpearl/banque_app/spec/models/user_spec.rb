require 'spec_helper'

describe User do

  it "requires a name, email, and password" do
    u = User.new
    expect(u).to_not be_valid
  end


  it "has a unique password between 8 to 16 characters in length"
  #how do i test for password input if it is not accessible by using bcrypt?

  it "must have unique user name and email" do
    u1 = User.new(name: "James", email: "this@that.com", password: "password123", password_confirmation: "password123")
    u1 = User.new(name: "James", email: "this@that.com", password: "password123", password_confirmation: "password123")
    expect(u1).to be_valid
    expect(u2).to_not be_valid
  end


  it "can have more than one account"

  it "should have a method 'total_balance', that returns total amount of money the user has"

  it "should have a method 'rich?' that returns true if they have more than 100k"

end
