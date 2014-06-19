require 'spec_helper'

describe Account do
  let(:account) do
    Account.new
  end

  before(:each) do
    @user = User.new
    @user.name = "Travis"
    @user.password = "batman"
    @user.password_confirmation = "batman"
    @user.email = "travisvanderhoop@gmail.com"
    @user.save
  end

  it "belongs to a user" do
    @user.accounts << account
    expect(account.user).to eq(@user)
  end

  it "won't persist to the db without a name and balance" do
    account.valid?
    expect(account.errors).to have_key(:name)
    account.name = "Checking"
    account.valid?
    expect(account.save).to eq(false)
  end

  it "will persist to the db with proper name and balance inputs" do
    account.name = "Marpy tip tarpy"
    account.balance = 100.00
    expect(account.save).to eq(true)
  end

  it "can have money withdrawn" do
    account.name = "Marpsy Darpsy"
    account.balance = 100
    account.withdraw(50)
    account.save
    expect(account.balance).to eq(50)
  end

  it "can't be overdrawn" do
    account.name = "Bob Lahblah"
    account.balance = 10.00
    account.withdraw(20.00)
    # binding.pry
    account.save
    expect(account.balance).to eq(10.00)
  end

  it "can have money deposited" do
    account.name = "Marpsy Darpsy"
    account.balance = 100.00
    account.deposit(30.00)
    account.save
    expect(account.balance).to eq(130.00)
  end

end
