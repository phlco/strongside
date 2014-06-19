require 'spec_helper'
require 'bigdecimal'

describe User do
  let(:user) { User.create(password: '12345678', password_confirmation: '12345678', email: 'example@example.com') }
  describe ".new" do
    it "is valid with proper password and email" do
      expect(user).to be_valid
    end
  end
  describe "#accounts" do
    it "has many accounts" do
      expect(user).to respond_to(:accounts)
    end
  end
  describe "#transfer" do
    it "moves amount from one account to another" do
      savings_account = Account.create(balance: 50, name: 'Savings')
      checking_account = Account.create
      user.accounts << savings_account << checking_account
      expect { user.transfer(50, savings_account, checking_account, "rent") }.to change{ checking_account.balance.to_s }.from(0.0.to_s).to(50.0.to_s)
    end
  end
  describe "#total_balance" do
    it "sums account balances" do
      user.accounts.create(balance: 50)
      user.accounts.create(balance: 50)
      expect(user.total_balance).to eq(100)
    end
  end

end
