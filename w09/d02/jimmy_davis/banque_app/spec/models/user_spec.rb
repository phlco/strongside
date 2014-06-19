require 'spec_helper'

describe User do

  it "has a name error when the name is not set" do
    user = User.new()
    user.valid?
    expect(user.errors).to have_key(:name)
  end

  it "does not have a name error when the name is set" do
    user = User.new()
    user.name = "Jimmy"
    user.valid?
    expect(user.errors).to_not have_key(:name)
  end

  it "has a name email errror when the email is not set" do
    user = User.new()
    user.name = "Jimmy"
    user.valid?
    expect(user.errors).to have_key(:email)
  end

  it "does not have a email error when the email is set" do
    user = User.new()
    user.name = "Jimmy"
    user.email = "jd@gmail.com"
    user.valid?
    expect(user.errors).to_not have_key(:email)
  end

  it "cannot create a user without a valid password and password confirmation" do
    user = User.new()
    expect(user).to_not be_valid
  end

  it "has a password error when the password is less than 8 characters" do
    user = User.new
    user.password = "hi"
    user.password_confirmation = "hi"
    user.valid?
    expect(user.errors).to have_key(:password)
  end

  it "does not have a password error when the password is between 8 and 16 characters" do
    user = User.new
    user.password = "kickhash"
    user.password_confirmation = "kickhash"
    user.valid?
    expect(user.errors).to_not have_key(:password)
  end

  it "has a password error when the password is longer than 16 characters" do
    user = User.new
    user.password = "passwordlongerthansixteen"
    user.password_confirmation = "passwordlongerthansixteen"
    user.valid?
    expect(user.errors).to have_key(:password)
  end

  it "must have a unique username" do
    user = User.new
    user.name = "jimmyd"
    user.email = "jd@gmail.com"
    user.password = "kickhash"
    user.password_confirmation = "kickhash"
    user.save

    user2 = User.new
    user2.name = "jimmyd"
    user2.email = "jimmyd@gmail.com"
    user2.password = "kickhash"
    user2.password_confirmation = "kickhash"
    expect(user2.save).to be_false
  end

  it "must have a unique email" do
    user = User.new
    user.name = "hello"
    user.email = "jimmy@davis.com"
    user.password = "kickhash"
    user.password_confirmation = "kickhash"
    user.save

    user2 = User.new
    user2.name = "hello"
    user2.email = "jimmy@davis.com"
    user2.password = "kickhash"
    user2.password_confirmation = "kickhash"
    expect(user2.save).to be_false
  end

    it "can have many accounts" do
    user = User.new
    user.name = "jimmyd"
    user.email = "jd@gmail.com"
    user.password = "kickhash"
    user.password_confirmation = "kickhash"
    user.save

    account1 = Account.new
    account1.name = "savings"
    account1.balance = 1000
    account1.user = user
    account1.save

    account2 = Account.new
    account2.name = "checking"
    account2.balance = 2000
    account2.user = user
    account2.save

    accounts = Account.where(user_id: user.id)
    expect(accounts.length).to eq(2)
  end

  it "has a total_balance method that returns the total amount of money they have" do
    user = User.new
    user.name = "jimmyd"
    user.email = "jd@gmail.com"
    user.password = "kickhash"
    user.password_confirmation = "kickhash"
    user.save

    account1 = Account.new
    account1.name = "savings"
    account1.balance = 1000
    account1.user_id = user.id
    account1.save

    account2 = Account.new
    account2.name = "checking"
    account2.balance = 2000
    account2.user_id = user.id
    account2.save

    expect(user.total_balance).to eq(3000)
  end

  it "has a method rich? that returns true if they have more than 100k" do
    user = User.new
    user.name = "jimmyd"
    user.email = "jd@gmail.com"
    user.password = "kickhash"
    user.password_confirmation = "kickhash"
    user.save

    account1 = Account.new
    account1.name = "savings"
    account1.balance = 1000
    account1.user_id = user.id
    account1.save

    expect(user.rich?).to be_false

    account2 = Account.new
    account2.name = "checking"
    account2.balance = 100000000
    account2.user_id = user.id
    account2.save

    expect(user.rich?).to be_true
  end


end
