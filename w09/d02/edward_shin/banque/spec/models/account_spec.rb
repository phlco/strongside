require 'spec_helper'

describe Account do
  it "must have a balance and a name" do
    account = Account.new
    account.valid?
    expect(account.valid?).to be_false
  end
  it "has an opening balance of 0" do
    # account = Account.new(name: "checking")
    # expect(account.balance).to eq(0)
  end
  it "has a deposit method and a withdraw method" do
    account = Account.new(name: "checking", balance: 2000)
    account.withdraw(100)
    account.deposit(50)
    expect(account.balance).to eq(1950)
  end
  it "cannot be over drawn" do
    account = Account.new(name: "checking", balance: 20)
    expect(account.withdraw(21)).to eq("cannot withdraw")

  end

  it "belongs to a user" do
    user = User.new(name: "eddie", email: "eddie@mail.com", password: "kickhash")
    account = Account.new(name: "checking", balance: 2000)
    account.user = user
    expect(account.user).to be_true
  end
end
