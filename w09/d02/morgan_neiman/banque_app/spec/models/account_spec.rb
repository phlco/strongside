require 'spec_helper'

describe Account do
  it "requires a name and balance" do
    a1 = Account.new
    expect(a1.save).to be_false
    a1 = Account.new
    a1.balance = 20
    expect(a1.save).to be_false
    a1 = Account.new
    a1.balance = 30
    a1.name = 1
    expect(a1.save).to be_true
  end
  it "has an opening balance of 0" do
    a1 = Account.new
    a1.name = "butts"
    a1.save
    expect(a1.balance).to eq(0)
  end
  it "has a deposit method" do
    a1 = Account.new
    a1.name = "stuff"
    a1.balance = 500
    a1.save
    a1.deposit(500)
    expect(a1.balance).to eq(1000)
  end
  it "has a withdraw method" do
    a1 = Account.new
    a1.name = "stuff"
    a1.balance = 500
    a1.save
    a1.withdraw(250)
    expect(a1.balance).to eq(250)
  end
  it "can't be overdrawn" do
    a1 = Account.new
    a1.name = "stuff"
    a1.balance = 500
    a1.save
    a1.withdraw(600)
    expect(a1.balance).to eq(0)
  end
  it "belongs to a user" do
    user = User.new
    user.name = "morgan"
    user.email = "stuff@stuff.com"
    user.password = "123456789"
    user.password_confirmation = "123456789"
    user.save
    a1 = Account.new
    a1.name = "stuff"
    a1.balance = 500
    a1.save
    user.accounts << a1
    expect(a1.user_id).to eq(user.id)
  end


end
