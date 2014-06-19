require 'spec_helper'

describe Account do

  it "has a name error when the name is not set" do
    account = Account.new()
    account.valid?
    expect(account.errors).to have_key(:name)
  end

  it "does not have a name error when the name is set" do
    account = Account.new()
    account.name = "savings"
    account.valid?
    expect(account.errors).to_not have_key(:name)
  end

  it "has a balance error when the balance is not set" do
    account = Account.new()
    account.valid?
    expect(account.errors).to have_key(:balance)
  end

  it "does not have a balance error when the balance is set" do
    account = Account.new()
    account.balance = "savings"
    account.valid?
    expect(account.errors).to_not have_key(:balance)
  end

  it "has a deposit method" do
    account = Account.new
    account.name = "savings"
    account.balance = 0
    account.save

    account.deposit(1000)
    account.save

    expect(account.balance).to eq(1000)
  end

  it "has a withdraw method" do
    account = Account.new
    account.name = "savings"
    account.balance = 0
    account.save

    account.deposit(2000)
    account.save

    account.withdraw(500)
    account.save

    expect(account.balance).to eq(1500)
  end
end
