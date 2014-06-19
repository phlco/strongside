require 'spec_helper'

describe Account do
  before :each do
    @user = User.new({name: "name5", email: "email6", password: "password"})
  end
  it "requires a name" do
    acct = @user.accounts.new({balance: 1000})
    acct.valid?
    expect(acct.errors).to have_key(:name)
  end
  it "has a  starting balance of 0" do
    acct = @user.accounts.new({name: "Account"})
    expect(acct.balance).to eq(0)
  end
  it "has a withdraw function" do
    acct = @user.accounts.new({name: "Account"})
    expect(acct).to respond_to(:withdraw)
  end
  it "has a deposit function" do
    acct = @user.accounts.new({name: "Account"})
    expect(acct).to respond_to(:deposit)
  end
  it "can't be overdrawn" do
    acct = @user.accounts.new({name: "Account"})
    expect(acct.withdraw(300)).to eq("You don't have that much money in your account!")
  end
  it "belongs to a user" do
    acct = Account.new({name: "Account"})
    acct.valid?
    expect(acct.errors).to have_key(:user_id)
  end
end
