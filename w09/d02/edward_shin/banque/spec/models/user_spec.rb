require 'spec_helper'

describe User do
  it "has errors when name, email and password are not set" do
    user = User.new
    user.valid?
    expect(user.errors).to have_key(:name)
    expect(user.errors).to have_key(:email)
    expect(user.errors).to have_key(:password)
  end
  it "will have a password between 8 and 16 characters long" do
    user = User.new(name: "eddie", email: "eddie@mail.com", password: "kickhashkickhashkickhash")
    expect(user.save).to be_false
  end
  it "will have unique names and emails" do
    user1 = User.new(name: "eddie", email: "eddie@mail.com", password: "kickhash")
    user1.save
    user2 = User.new(name: "eddie", email: "eddie@mail.com", password: "kickhash")
    expect(user2.save).to be_false
  end
  it "will allow users to have more then 1 account" do
    user1 = User.new(name: "eddie", email: "eddie@mail.com", password: "kickhash")
    user1.save
    account1 = Account.new
    account1.save
    account1.user_id = user1.id
    account2 = Account.new
    account2.save
    account2.user_id = user1.id
    user1.accounts.push(account1, account2)
    expect(account1.user_id).to eq(user1.id)
    expect(account2.user_id).to eq(user1.id)
    expect(user1.accounts.length).to eq(2)
  end

  it "has a method total_balance that returns the total money they have" do
    user1 = User.new(name: "eddie", email: "eddie@mail.com", password: "kickhash")
    user1.save
    account1 = Account.new(name: "checking", balance: 50000)
    account1.save
    user1.accounts << account1
    expect(user1.total_balance).to eq(50000)
  end
  it "has the method rich? thats returns true if they have more then 100k" do
    user1 = User.new(name: "eddie", email: "eddie@mail.com", password: "kickhash")
    user1.save
    account1 = Account.new(name: "checking", balance: 50000)
    account1.save
    user1.accounts << account1
    expect(user1.is_rich?).to be_false
  end
end
