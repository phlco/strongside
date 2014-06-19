require 'spec_helper'

describe Account do
  let(:account){
    Account.new(
      name: "checking",
      balance: 0
    )
  }

  it "should require a name (Any string), and balance" do
    expect(account.balance).to eq 0
    expect(account.name).to eq "checking"
  end

  it "should have an opening balance of 0." do
    expect(account.balance).to eq 0
  end

  it "will have deposit method" do
    account.deposit(100)
    expect(account.balance).to eq(100)
  end

  it "will have withdrawal method" do
    account.deposit(1000)
    account.withdrawal(100)
    expect(account.balance).to eq(900)
  end

  it "can't be overdrawn." do
    account.deposit(100)
    expect(account.withdrawal(1000)).to be_false
    expect(account.balance).to eq(100)
  end

  it "should belong to a User" do
    user =  User.new({
        name: "Matt",
        password: "matthew",
        password_confirmation: "matthew",
        email: "matthew@korporaal.com"
        })
    account.name = "checking"
    user.accounts << account
    user.save
    account.save
    expect(account.user).to eq(user)
  end

end
